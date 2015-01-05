// Manage info about chromosomes of genome specified by given text file.
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

UNIT GenomeLibrary;

INTERFACE

  TYPE
    TChromosome =
      CLASS(TObject)
        PUBLIC
          Name           :  STRING;
          FirstCoordinate:  INTEGER;
          LastCoordinate :  INTEGER;
          PlotLength     :  INTEGER;
          CentromereStart:  INTEGER;
          CentromereEnd  :  INTEGER;

          CONSTRUCTOR Create;
          FUNCTION Length:  INTEGER;
      END;

    TGenome =
      CLASS(TObject)

        PRIVATE
          FChromosome     :  ARRAY OF TChromosome;
          FChromosomeCount:  INTEGER;

          FUNCTION GetChromosome(Index:  INTEGER):  TChromosome;
        PUBLIC
          CONSTRUCTOR Create(CONST filename: STRING);
          DESTRUCTOR  Destroy; OVERRIDE;

          PROCEDURE GetChromosomeIndex(CONST position:  INTEGER;
                                       VAR chromosome: INTEGER;
                                       VAR offset:  INTEGER);
          FUNCTION Size:  INTEGER;

          PROPERTY ChromosomeCount: INTEGER  READ FChromosomeCount;

          PROPERTY Chromosome[Index:  INTEGER]:  TChromosome READ GetChromosome;
      END;

IMPLEMENTATION

  USES
    Classes,   // TStringList
    Dialogs,   // ShowMessage
    SysUtils;  // Exception

  TYPE
    EOutOfChromosomeRange = CLASS(Exception);
    EOutOfGenomeRange     = CLASS(Exception);

  CONSTRUCTOR TChromosome.Create;
  BEGIN
    Name            :=  'Unknown';
    FirstCoordinate :=  0;
    LastCoordinate  :=  0;
    PlotLength      :=  0;
    CentromereStart :=  0;
    CentromereEnd   :=  0;
  END {TChromosome.Create};

  FUNCTION TChromosome.Length:  INTEGER;
  BEGIN
    RESULT := LastCoordinate - FirstCoordinate + 1
  END {Length};
  

  FUNCTION TGenome.GetChromosome(Index:  INTEGER):  TChromosome;
  BEGIN
    RESULT := FChromosome[Index]
  END {GetChromosome};


  CONSTRUCTOR TGenome.Create(CONST filename: STRING);
    VAR
      ChromosomeIndex:  INTEGER;
      i             :  INTEGER;
      index         :  INTEGER;
      iTemp         :  INTEGER;
      List          :  TStringList;
      s             :  STRING;
  BEGIN
    List := TStringList.Create;
    TRY
    
      TRY
        List.LoadFromFile(filename);
        // Get rid of any comments starting with '#', or blank lines, in the file
        FOR i := List.Count-1 DownTo 0 DO
        BEGIN
          s := Trim(List[i]);
          IF   (LENGTH(s) = 0) OR (s[1] = '#')
          THEN List.Delete(i);
        END;

        FChromosomeCount := List.Count;
        IF   FChromosomeCount <= 0
        THEN RAISE EOutofGenomeRange.Create('Genome Index file is empty');

        // Allocate space for Chromosomes 0, 1, ..., ChromsomeCount
        // Slot for '0' is just wasted so index here matches real world
        // index number.
        SetLength(FChromosome, FChromosomeCount+1);

        FOR i := 0 TO List.Count-1 DO
        BEGIN
          ChromosomeIndex := i + 1;
          FChromosome[ChromosomeIndex] := TChromosome.Create;

          s := Trim(List[i]);
          // brute force parsing here
          index := POS(' ',s);
          iTemp := StrToInt(COPY(s,1,index-1));
          ASSERT((i+1) = iTemp, 'ChromosomeIndex problem');

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);
          FChromosome[ChromosomeIndex].Name := COPY(s,1,index-1);

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);
          FChromosome[ChromosomeIndex].FirstCoordinate := StrToInt( COPY(s,1,index-1) );
          IF   ChromosomeIndex > 1
          THEN FChromosome[ChromosomeIndex-1].LastCoordinate :=
                 FChromosome[ChromosomeIndex].FirstCoordinate - 1;

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);
          // Use a '-' here to mean Last is 1 less than next First
          IF   s[1] <> '-'
          THEN  FChromosome[ChromosomeIndex].LastCoordinate :=
                  StrToInt( COPY(s,1,index-1) );

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);
          FChromosome[ChromosomeIndex].PlotLength := StrToInt( COPY(s,1,index-1) );

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);
          FChromosome[ChromosomeIndex].CentromereStart := StrToInt( COPY(s,1,index-1) );

          Delete(s,1,index);
          s := Trim(s);
          index := POS(' ',s);

          IF   index = 0
          THEN FChromosome[ChromosomeIndex].CentromereEnd := StrToInt(s)
          ELSE FChromosome[ChromosomeIndex].CentromereEnd := StrToInt( COPY(s,1,index-1) );
        END

      EXCEPT
        ON EConvertError DO ShowMessage('Corrupt Genome Index file')
      END

    FINALLY
      List.Free
    END;

  END {Create};

  DESTRUCTOR TGenome.Destroy;
    VAR
      i:  INTEGER;
  BEGIN
    FOR i := 0 TO FChromosomeCount-1 DO
    BEGIN
      IF   Assigned(FChromosome[i])
      THEN FChromosome[i].Free
    END

  END {Destroy};


  PROCEDURE TGenome.GetChromosomeIndex(CONST position:  INTEGER;
                                       VAR chromosome: INTEGER;
                                       VAR offset:  INTEGER);
    VAR
      found:  BOOLEAN;
  BEGIN
    IF   (position < 0) OR (position > FChromosome[FChromosomeCount].LastCoordinate)
    THEN RAISE EOutofGenomeRange.Create('position ' + IntToStr(position) +
                                        ' is outside the genome');

    found := FALSE;
    chromosome := 1;
    WHILE (NOT found)                     AND
          (chromosome < FChromosomeCount) AND
          (position >= FChromosome[chromosome].FirstCoordinate) DO
    BEGIN
      found := (position <= FChromosome[chromosome].LastCoordinate);
      IF   NOT found
      THEN INC(chromosome)
    END;

    offset := position - FChromosome[chromosome].FirstCoordinate
  END {GetChromosomeIndex};


  FUNCTION TGenome.Size:  INTEGER;
  BEGIN
    RESULT := FChromosome[FChromosomeCount-1].LastCoordinate
  END {Size};

END.
