/// PeakFinder:  Find peaks in yeast ChIP (Chromatin Immunoprecipitation)
//               microarray data.
//
// Supplementary material to:
//
//    Genome-wide mapping of the cohesin complex in the yeast
//    Saccharomyces cerevisiae, Glynn EF, Megee PC, Yu HG, Mistrot C,
//    Unal E, Koshland DE, DeRisi JL, and Gerton JL.
//    http://www.stowers-institute.org/labs/Gerton/2003/cohesin
//
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

program PeakFinder;

{$R 'RichText.res' 'RichText.RC'}

uses
  Windows,
  Forms,
  ScreenPeakFinder in 'ScreenPeakFinder.pas' {FormPeaks},
  StringGridLibrary in 'StringGridLibrary.pas',
  SmoothingLibrary in 'SmoothingLibrary.pas',
  fmath in 'fmath.pas',
  fspec in 'fspec.pas',
  GenomeLibrary in 'GenomeLibrary.pas',
  ScreenProcessAll in 'ScreenProcessAll.pas' {FormProcessAll},
  ScreenSplash in 'ScreenSplash.pas' {FormSplash},
  NucleotideSequenceLibrary in 'NucleotideSequenceLibrary.pas',
  INILibrary in 'INILibrary.pas',
  GraphicsDriverLibrary in 'GraphicsDriverLibrary.pas',
  TypesLibrary in 'TypesLibrary.pas',
  CanvasDriverLibrary in 'CanvasDriverLibrary.pas',
  PantographLibrary in 'PantographLibrary.pas',
  RealColorLibrary in 'RealColorLibrary.pas',
  PostScriptDriverLibrary in 'PostScriptDriverLibrary.pas';

CONST
  ProgramName = 'Peaks4';

VAR
  MutexHandle:  THandle;

{$R *.res}

begin
  // Use mutex to only allow one copy to be in memory at a time
  MutexHandle := 0;

  TRY
    MutexHandle := CreateMutex(NIL, TRUE, ProgramName);
    IF   GetLastError = ERROR_ALREADY_EXISTS
    THEN BEGIN
      SetForegroundWindow(FindWindow(ProgramName, NIL));
      CloseHandle (MutexHandle)
    END
    ELSE BEGIN
      Application.Initialize;
      Application.CreateForm(TFormPeaks, FormPeaks);
  Application.CreateForm(TFormProcessAll, FormProcessAll);
  Application.CreateForm(TFormSplash, FormSplash);
  Application.Run;
    END
  FINALLY
    ReleaseMutex(MutexHandle)
  END
end.
