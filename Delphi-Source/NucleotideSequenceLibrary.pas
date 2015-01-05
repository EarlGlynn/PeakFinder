// Manipulate Nucleotide Sequences, including:
//
//    - Read ASCII sequence file, which could be in fasta format,
//      into in-memory string for further proessing.
//
//    - Compute nucleotide counts for sequence.
//
//    - Compute range of nucleotide content (usually, A, T, G, C, AT, or GC,
//      but other combinations are possible).
//
//    - Plot nucleotide content (using generic Pantograph) as function of
//      base index.
//
// efg, July 2003.  Major revision October 2003.
//
// **************************************************************************
// Copyright © 2003, Stowers Institute for Medical Research.
//
// This program is free software that can be redistributed and/or
// modified under the terms of the GNU General Public License as
// published by the Free Software Foundation (version 2 of the
// License, or (at your option) any later version).
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY and without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
// the GNU General Public License for more details.
//
// If a copy of the GNU General Public License is not received with
// this program, contact the Free Software Foundation, Inc.,
// 675 Mass Ave, Cambridge MA 02139, USA or
// http://www.gnu.org/copyleft/gpl.html?cid=6.

// Written by Earl F. Glynn, Stowers Institute for Medical Research.
//
// Please submit all inquiries regarding this software to
// Earl F. Glynn, Stowers Institute for Medical Research,
// 1000 East 50th Street, Kansas City, MO 64110,
// e f g @ s t o w e r s - i n s t i t u t e . o r g
//
// Solely with respect to any use of this program outside the scope
// of the GNU General Public License, the following disclaimers shall
// apply.  This software and any associated documentation are provided
// "as is."  THE STOWERS INSTITUTE MAKES NO REPRESENTATIONS OR WARRANTIES,
// EXPRESSED OR IMPLIED, INCLUDING THOSE OF MERCHANTABILITY, FITNESS FOR
// A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Neither the Stowers Institute
// nor any of its directors, officers, employees or agents shall be liable
// under any circumstances for any damages of any type with respect to any
// claim by a user of this software or any third party on account of or
// arising from the use or inability to use this software, modifications
// hereto or associated documentation.

UNIT NucleotideSequenceLibrary;

INTERFACE

  USES
    // TPantograph: map "world coordinates" to device plotting area
    PantographLibrary;

  PROCEDURE NucleotideReadSequence(CONST Filename:  STRING;
                                   VAR Sequence, Defline:  STRING;
                                   VAR LineCount, ErrorCount:  INTEGER);

  FUNCTION  NucleotideCount(CONST sequence:  STRING; CONST target:  STRING):  INTEGER;

  PROCEDURE NucleotideContentRange(CONST Sequence  :  STRING;
                                   CONST target    :  STRING;
                                   CONST WindowSize:  INTEGER;
                                   CONST Frequency :  INTEGER;
                                   VAR   RangeMin  :  Double;
                                   VAR   RangeMax  :  Double);

  PROCEDURE NucleotidePlot (CONST Pantograph:  TPantograph;
                            CONST Sequence  :  STRING;
                            CONST target    :  STRING;
                            CONST WindowSize:  INTEGER;
                            CONST Frequency :  INTEGER;
                            CONST xMin,xMax :  Double);

IMPLEMENTATION

  USES
    Classes;  // TMemoryStream

// =========================================================================
// Read ASCII sequence file and extract fasta defline if present

  PROCEDURE NucleotideReadSequence(CONST Filename:  STRING;
                                   VAR Sequence, Defline:  STRING;
                                   VAR LineCount, ErrorCount:  INTEGER);
    CONST
      CarriageReturn = #$0D;  // in case sequence files edited in Windows
      LineFeed       = #$0A;

    VAR
      i         :  INTEGER;
      index     :  INTEGER;
      nucleotide:  CHAR;
      RawData   :  STRING;
      Stream    :  TMemoryStream;
      TideCount :  INTEGER;
  begin
    Sequence := '';
    Defline := '';
    LineCount := 0;
    ErrorCount := 0;

    Stream := TMemoryStream.Create;
    TRY
      // Load entire file into MemoryStream
      Stream.LoadFromFile(FileName);

      SetLength(RawData, Stream.Size);
      Stream.Read(RawData[1], Stream.Size);

      // Read any defline
      index := POS(LineFeed, RawData);
      IF   (POS('>', RawData) > 0) AND (index > 0)
      THEN BEGIN
        Defline := COPY(RawData, 1, index-1);
        Delete (RawData, 1, index)
      END;

      // Do this pre-allocation to get rid of mysterious time delays in
      // processing data some of the time thought to be caused by many
      // memory reallocations.
      SetLength(Sequence, Stream.Size);
      TideCount := 0;

      FOR i := 1 TO LENGTH(RawData) DO
      BEGIN
        nucleotide := Upcase( RawData[i] );

        CASE nucleotide OF
          'A','C','G','T':
            BEGIN
              INC(TideCount);
              Sequence[TideCount] := nucleotide;
            END;

          CarriageReturn:  ;  // do nothing; skip (PC data)

          LineFeed:  INC(LineCount)

          ELSE
            INC(ErrorCount);
        END

      END

    FINALLY
      Stream.Free
    END;

    // Adjust size to space actually needed
    SetLength(Sequence, TideCount);
  end;

// =========================================================================
// Compute nucleotide counts for sequence

  FUNCTION NucleotideCount(CONST sequence:  STRING; CONST target:  STRING):  INTEGER;
    VAR
      i:  INTEGER;
  BEGIN
    RESULT := 0;
    FOR i := 1 TO LENGTH(sequence) DO
    BEGIN
      // Is current nucleotide in target list?
      IF   POS(sequence[i], target) > 0
      THEN INC(RESULT)
    END
  END {NucleotideCount};


// =========================================================================
// Compute range of nucleotide content

  // Use Frequency = 1 to get exact range.  A larger Frequency value
  // gives approximate values, which are good enough for setting
  // the plotting scale, and executes much more quickly.
  PROCEDURE NucleotideContentRange(CONST Sequence  :  STRING;
                                   CONST target    :  String;
                                   CONST WindowSize:  INTEGER;
                                   CONST Frequency :  INTEGER;
                                   VAR   RangeMin  :  Double;
                                   VAR   RangeMax  :  Double);
    VAR
      i          :  INTEGER;
      M          :  INTEGER;
      N          :  INTEGER;
      TargetCount:  INTEGER;
      TotalCount :  INTEGER;

    PROCEDURE UpdateRange;
      VAR
        Content    :  Double;
    BEGIN
      Content := 100.0 * TargetCount / TotalCount;
      IF   Content < RangeMin
      THEN RangeMin := Content
      ELSE
        IF   Content > RangeMax
        THEN RangeMax := Content
    END {UpdateRange};

  BEGIN
    ASSERT(WindowSize MOD 2 = 1, 'WindowSize should be odd');
    N := (WindowSize - 1) DIV 2;
    M := LENGTH(Sequence);

    RangeMin := 100.0;
    RangeMax :=   0.0;

    // initialization for moving averages:  load N values
    TargetCount := 0;
    FOR i := 1 TO N DO
    BEGIN
      IF   POS(sequence[i], target) > 0
      THEN INC(TargetCount)
    END;
    TotalCount := N;

    FOR i := 1 TO M DO
    BEGIN
      // Slide over one.  Take care near boundaries.
      IF   i <= M-N
      THEN BEGIN
        IF   POS(Sequence[i+N], target) > 0
        THEN INC(TargetCount);
        INC(TotalCount)
      END;

      IF   i > N+1
      THEN BEGIN
        IF   POS(Sequence[i-N-1], target) > 0
        THEN DEC(TargetCount);
        DEC(TotalCount)
      END;

      IF   Frequency <= 1
      THEN UpdateRange
      ELSE
        IF  i MOD Frequency = 1
        THEN UpdateRange
    END
  END {NucleotideContentRange};


// =========================================================================
// Plot nucleotide content 
//
// Plot specified "target" graph (usually, AT, GC, A, T, G or C).  Use
// multiple calls to plot more than one content.  Use NucleotideContentRange
// to adjust scaling paramters automatically.
//
// Discussion of how boundaries are handled in moving average:
//
// Consider: Nucleotide Sequence
//            A T G A C G A A A C C C     M = 12
//            +-+-+-+-+-+-+-+-+-+-+-+
//
// Given:  Moving Window
//                                        N = 2
//            +-+-+-+-+                   2N + 1 = 5
//           -2-1 0+1+2
//
//
// Step 0.  Count first N nucleotides
//
//            A T G A C G A A A C C C
//            +-+
//
//                                         A=1   G=0
//                                         T=1   C=0     Count
//                                        ----  ----
//                                        AT=2  GC=0       2=N
//
// Step 1.  (Loop from 1 to M)            Add G
//
//            A T G A C G A A A C C C
//            +-+-+
//            |
//           i=1                           A=1   G=1
//                                         T=1   C=0     Count
//                                        ----  ----
//                                        AT=2  GC=1       3
//                                         67%   33%
//
// Step 2.    A T G A C G A A A C C C     Add A
//            +-+-+-+
//              |
//             i=2                         A=2   G=1
//                                         T=1   C=0     Count
//                                        ----  ----
//                                        AT=3  GC=1       4
//                                         75%   25%
//
// Step 3.    A T G A C G A A A C C C     Add C (now fully loaded)
//            +-+-+-+-+
//                |
//               i=3                       A=2   G=1
//                                         T=1   C=1     Count
//                                        ----  ----
//                                        AT=3  GC=2       5
//                                         60%   40%
//
// Step 4     A T G A C G A A A C C C     Add G, Subtract A
//              +-+-+-+-+
//                  |
//                 i=4                     A=1   G=2
//                                         T=1   C=1     Count
//                                        ----  ----
//                                        AT=2  GC=3       5
//                                         40%   60%
// . . .
//
// Step 9     A T G A C G A A A C C C     Add C, Subtract G
//                        +-+-+-+-+
//                            |
//                           i=9           A=3   G=0
//                                         T=0   C=2     Count
//                                        ----  ----
//                                        AT=3  GC=2       5
//                                         60%   40%
//
// Step 10    A T G A C G A A A C C C     Add C, Subtract A
//                          +-+-+-+-+
//                              |
//                             i=10        A=2   G=0
//                                         T=0   C=3     Count
//                                        ----  ----
//                                        AT=2  GC=3       5
//                                         40%   60%
//
// Step 11    A T G A C G A A A C C C     Subtract A
//                            +-+-+-+
//                                |
//                               i=11      A=1   G=0
//                                         T=0   C=3     Count
//                                        ----  ----
//                                        AT=1  GC=3       4
//                                         25%   75%
//
// Step 12    A T G A C G A A A C C C     Subtract A
//                              +-+-+
//                                  |
//                                 i=12    A=0   G=0
//                                         T=0   C=3     Count
//                                        ----  ----
//                                        AT=0  GC=3       3
//                                          0%  100%
//
// "Rules"
//   Add new nucleotide:  i:  1..10 = 1   .. M-N
//   Subtract old:        i:  4..12 = N+2 .. M

  PROCEDURE NucleotidePlot (CONST Pantograph:  TPantograph;
                            CONST Sequence  :  STRING;
                            CONST target    :  STRING;
                            CONST WindowSize:  INTEGER;
                            CONST Frequency :  INTEGER;
                            CONST xMin,xMax :  Double);
    VAR
      i          :  INTEGER;
      M          :  INTEGER;
      N          :  INTEGER;
      PlotCount  :  INTEGER;
      TargetCount:  INTEGER;
      TotalCount :  INTEGER;

    PROCEDURE PlotContent;
      VAR Content:  Double;
    BEGIN
      Content := 100.0 * TargetCount / TotalCount;

      IF   PlotCount = 0
      THEN Pantograph.MoveTo(i, Content)
      ELSE Pantograph.LineTo(i, Content);

      INC(PlotCount)
    END {PlotContent};

  BEGIN
    ASSERT(WindowSize MOD 2 = 1, 'WindowSize should be odd');
    N := (WindowSize - 1) DIV 2;
    M := LENGTH(Sequence);

    // initialization for moving averages:  load N values
    TargetCount := 0;
    FOR i := 1 TO N DO
    BEGIN
      IF   POS(sequence[i], target) > 0
      THEN INC(TargetCount)
    END;
    TotalCount := N;

    PlotCount := 0;
    FOR i := 1 TO M DO
    BEGIN
      // Slide over one.  Take care near boundaries.
      IF   i <= M-N
      THEN BEGIN
        IF   POS(Sequence[i+N], target) > 0
        THEN INC(TargetCount);
        INC(TotalCount)
      END;

      IF   i > N+1
      THEN BEGIN
        IF   POS(Sequence[i-N-1], target) > 0
        THEN DEC(TargetCount);
        DEC(TotalCount)
      END;

      IF   (i >= xMin) AND (i <= xMax)
      THEN BEGIN
      
        IF   Frequency <= 1
        THEN PlotContent
        ELSE
          IF  i MOD Frequency = 1
          THEN PlotContent

      END
    END
  END {NucleotidePlot};


END.
