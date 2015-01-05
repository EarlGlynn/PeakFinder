//  Utility routines to manipulate TStringGrids.
//
//  Copyright (C) 1997, Earl F. Glynn, EFG Software.  All Rights Reserved.
//  www.efg2.com/Lab

UNIT StringGridLibrary;

INTERFACE
  USES
    Classes,    // TFileStream, TAlignment
    Grids,      // TStringGrid
    Graphics,   // TCanvas
    SysUtils,   // StrToInt
    WinTypes;   // TRect

  TYPE
    TGridColumnCompare = (gccLT, gccEQ, gccGT);
    TCellAlignment     = (alLeft, alCenter, alRight);


  PROCEDURE ReadGridFile (VAR StringGrid:  TStringGrid; GridFile:  STRING);
  PROCEDURE WriteGridFile (VAR StringGrid:  TStringGrid; GridFile:  STRING);

  PROCEDURE AddBlankRowToTop (VAR StringGrid:  TStringGrid);
  PROCEDURE InsertBlankRow   (CONST NewRow:  INTEGER; VAR StringGrid:  TStringGrid);
  PROCEDURE DeleteSelectedRow (VAR StringGrid:  TStringGrid);

  FUNCTION StringGridSearch(CONST StringGrid:  TStringGrid;
                            CONST column:  INTEGER;
                            CONST target:  STRING;
                            CONST GridColumnCompare:  TGridColumnCompare;
                            VAR   MatchRow:  INTEGER):  BOOLEAN;

  FUNCTION XLeft   (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  FUNCTION XCenter (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  FUNCTION XRight  (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  FUNCTION YCenter (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;

  PROCEDURE AlignText(CONST Canvas:  TCanvas; CONST Rect:  TRect;
                      CONST alignment:  TCellAlignment; CONST s:  STRING);


IMPLEMENTATION
  USES
    Dialogs;    {Dialogs}


  CONST
    CR    = #$0D;
    LF    = #$0A;

  {---------------------------------------------------------------------}

  PROCEDURE ReadGridFile (VAR StringGrid:  TStringGrid; GridFile:  STRING);
    VAR
      i          :  INTEGER;
      j          :  INTEGER;
      Stream     :  TFileStream;
      Strings    :  TStringList;

    FUNCTION ReadLineFromStream:  STRING;
      VAR
        c:  CHAR;
    BEGIN
      RESULT := '';
      // Read characters until end-of-line character(s) are seen
      WHILE (Stream.Read(c,1) = 1) AND NOT (c in [CR, LF]) DO
        RESULT := RESULT + c;
      IF   c = CR
      THEN BEGIN
        IF  (Stream.Read(c,1) = 1) AND (c <> LF)
        THEN Stream.Position := Stream.Position - 1
      END
    END {ReadLineFromStream};

    FUNCTION ReadIntegerFromStream:  INTEGER;
    BEGIN
      RESULT := StrToInt(ReadLineFromStream)
    END {ReadIntegerFromStream};

  BEGIN
    Strings:=NIL;
    IF   FileExists(GridFile)
    THEN BEGIN
      TRY
        Strings := TStringList.Create;
        Stream := TFileStream.Create(GridFile, fmOpenRead);

        StringGrid.RowCount := ReadIntegerFromStream;
        StringGrid.ColCount := ReadIntegerFromStream;
        StringGrid.Row      := ReadIntegerFromStream;

        // Unfortunately, LoadFromStream reads the whole file, not just one row.
        // This is a bad design to have "SaveToStream" and "LoadFromStream"
        // work so differently with a TStringGrid.
        Strings.LoadFromStream(Stream);

        IF   Strings.Count = StringGrid.RowCount * StringGrid.ColCount
        THEN BEGIN
          FOR j := 0 TO StringGrid.RowCount-1 DO
            FOR i := 0 TO StringGrid.ColCount-1 DO
             StringGrid.Cells[i,j] := Strings[i + j*StringGrid.ColCount];
        END
        ELSE BEGIN
          MessageDlg('Corrupt StringGrid File <' + GridFile + '>', mtError,[mbOK],0);
          EXIT
        END;

      FINALLY
        Stream.Free;
        Strings.Free
      END

    END

  END {ReadGridFile};


  PROCEDURE WriteGridFile (VAR StringGrid:  TStringGrid; GridFile:  STRING);
    VAR
      j     :  INTEGER;
      Stream:  TFileStream;

    PROCEDURE WriteIntegerToStream(CONST i:  INTEGER);
      // Write Integer to Stream as string to keep file editable by ASCII editor.
      // See book "Secrets of Delphi 2", p. 75.  Perhaps the next version of Delphi
      // will make streams easier to use for common data types.
      VAR
        s:  STRING;
    BEGIN
      s := IntToStr(i);
      Stream.WriteBuffer(s[1], LENGTH(s));
      s := CR + LF;
      Stream.WriteBuffer(s[1], LENGTH(s));
    END {WriteIntegerToStream};

  BEGIN
    Stream := TFileStream.Create(GridFile, fmCreate);

    WriteIntegerToStream(StringGrid.RowCount);
    WriteIntegerToStream(StringGrid.ColCount);
    WriteIntegerToStream(StringGrid.Row);

    TRY
      FOR j := 0 TO StringGrid.RowCount-1 DO
      BEGIN
        StringGrid.Rows[j].SaveToStream(Stream);
      END
    FINALLY
      Stream.Free
    END

  END {WriteGridFile};


  {---------------------------------------------------------------------}

  // Keep for historical purposes.  Use InsertBlankRow whenever possible
  // instead of this routine.
  PROCEDURE AddBlankRowToTop (VAR StringGrid:  TStringGrid);
    VAR
      i:  INTEGER;
      j:  INTEGER;
  BEGIN
    StringGrid.RowCount := StringGrid.RowCount + 1;

    // Copy Row j-1 to Row j
    FOR j := StringGrid.RowCount-1 DOWNTO StringGrid.FixedRows+1 DO
      StringGrid.Rows[j] := StringGrid.Rows[j-1];

    // Make Row <FixedRows> cells empty
    FOR i := StringGrid.FixedCols TO StringGrid.ColCount-1 DO
      StringGrid.Cells[i, StringGrid.FixedRows] := '';

    StringGrid.TopRow := StringGrid.FixedRows;

    // Select the new one
    StringGrid.Row := StringGrid.FixedRows;
    StringGrid.Col := StringGrid.FixedRows

  END {AddBlankRowToTop};


  // Insert new blank row at the specified NewRow (assuming orign 0)
  // Use NewRow = 1 for equivalent of AddBlankRowToTop
  PROCEDURE InsertBlankRow   (CONST NewRow:  INTEGER; VAR StringGrid:  TStringGrid);
    VAR
      i:  INTEGER;
      j:  INTEGER;
  BEGIN
    // Add new row at bottom
    StringGrid.RowCount := StringGrid.RowCount + 1;

    // Copy Row j-1 to Row j
    FOR j := StringGrid.RowCount-1 DOWNTO StringGrid.FixedRows+NewRow DO
      StringGrid.Rows[j] := StringGrid.Rows[j-1];

    // Make Row <FixedRows> cells empty
    FOR i := StringGrid.FixedCols TO StringGrid.ColCount-1 DO
      StringGrid.Cells[i, NewRow] := '';

    // Select the new one
    StringGrid.Row := NewRow;
    StringGrid.Col := StringGrid.FixedRows
  END {InsertBlankRow};


  PROCEDURE DeleteSelectedRow (VAR StringGrid:  TStringGrid);
    VAR
      j:  INTEGER;
  BEGIN
    // Copy Row j-1 to Row j
    FOR j := StringGrid.Row TO StringGrid.RowCount-2 DO
    BEGIN
      StringGrid.Cells[0,j] := StringGrid.Cells[0,j+1];
      StringGrid.Rows[j] := StringGrid.Rows[j+1]
    END;

    StringGrid.RowCount := StringGrid.RowCount - 1;
  END;

  {---------------------------------------------------------------------}

  // Use sequential search (for now) to find target string in specified
  // column of given StringGrid.  Returns TRUE if found.  IF not found,
  // returns insertion point when sorted in decreasing order.
  FUNCTION StringGridSearch(CONST StringGrid:  TStringGrid;
                            CONST column:  INTEGER;
                            CONST target:  STRING;
                            CONST GridColumnCompare:  TGridColumnCompare;
                            VAR   MatchRow:  INTEGER):  BOOLEAN;
    VAR
      j          :  INTEGER;
      UpperTarget:  STRING;
  BEGIN
    MatchRow := -1;  {Use this value for when target is not found}

    RESULT := TRUE;
    j := StringGrid.FixedRows;
    UpperTarget := Uppercase(Target);
    WHILE RESULT AND (j < StringGrid.RowCount) DO
    BEGIN
      CASE  GridColumnCompare OF
        gccLT:  RESULT := (UpperTarget < UpperCase(Trim(StringGrid.Cells[column, j])));
        gccEQ:  RESULT := (UpperTarget = UpperCase(Trim(StringGrid.Cells[column, j])));
        gccGT:  RESULT := (UpperTarget > UpperCase(Trim(StringGrid.Cells[column, j])))
        ELSE    RESULT := FALSE;
      END;

      IF   RESULT
      THEN INC(j)
    END;

    MatchRow := j
  END {StringGridSearch};


  {---------------------------------------------------------------------}

  // Use half-width of 'X' as left margin
  FUNCTION XLeft   (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  BEGIN
    RESULT := rect.Left + canvas.TextWidth('X') DIV 2
  END {XRight};


  FUNCTION XCenter (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  BEGIN
    RESULT := ((rect.Left + rect.Right) - canvas.TextWidth(s)) DIV 2
  END {XCenter};


  // Use half-width of 'X' as right margin
  FUNCTION XRight (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  BEGIN
    RESULT := rect.Right - canvas.TextWidth(s) - canvas.TextWidth('X') DIV 2
  END {XRight};


  // Top of text is its origin, so adjust by half-height of text to center
  FUNCTION YCenter (rect:  TRect; canvas:  TCanvas; s:  STRING):  INTEGER;
  BEGIN
    RESULT := ((rect.Top + rect.Bottom) - canvas.TextHeight(s)) DIV 2
  END {YCenter};


  PROCEDURE AlignText(CONST Canvas:  TCanvas; CONST Rect:  TRect;
                      CONST alignment:  TCellAlignment; CONST s:  STRING);
  BEGIN
    CASE alignment OF
      alLeft:    Canvas.TextRect(Rect,
                                 XLeft(Rect, Canvas, s),
                                 YCenter(Rect, Canvas, s),
                                 s);
      alCenter:         Canvas.TextRect(Rect,
                                 XCenter(Rect, Canvas, s),
                                 YCenter(Rect, Canvas, s),
                                 s);

      alRight:   Canvas.TextRect(Rect,
                                 XRight(Rect, Canvas, s),
                                 YCenter(Rect, Canvas, s),
                                 s);
    END
  END {AlignText};


END.
