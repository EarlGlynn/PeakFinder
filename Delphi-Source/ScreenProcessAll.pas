// Process all chromosomes in genome and optionally write graphics to directory.
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

unit ScreenProcessAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TFormProcessAll = class(TForm)
    ButtonGo: TButton;
    EditDirectory: TEdit;
    BitBtnOK: TBitBtn;
    ProgressBar: TProgressBar;
    BitBtnCancel: TBitBtn;
    LabelDirectory: TLabel;
    LabelPrefix: TLabel;
    EditPrefix: TEdit;
    LabelComplete: TLabel;
    CheckBoxSaveChartSingle: TCheckBox;
    CheckBoxSaveChartMulti: TCheckBox;
    procedure ButtonGoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    StopNow:  BOOLEAN;
  public
    { Public declarations }
  end;

var
  FormProcessAll: TFormProcessAll;

implementation
{$R *.dfm}

  uses
{$IFDEF GIF}
    GIFImage,     // TGIFImage
{$ENDIF}
    ScreenPeakfinder,
    FileCtrl;

procedure TFormProcessAll.ButtonGoClick(Sender: TObject);
  VAR
    Directory  :  STRING;
    Filename   :  TFIlename;
{$IFDEF GIF}
    GIFImage   :  TGIFImage;
{$ENDIF}
    iChromosome:  INTEGER;
    iSave      :  INTEGER;
    OK         :  BOOLEAN;
    Path       :  STRING;
begin
  // Save view to be restored later
  iSave := FormPeaks.ComboBoxChromosomeFilter.ItemIndex;

  Directory := ExcludeTrailingBackSlash(EditDirectory.Text);
  Path := Directory + '\' + EditPrefix.Text;

  // Create directory, if necessary.
  IF   NOT FileCtrl.DirectoryExists(Directory)
  THEN FileCtrl.ForceDirectories(Directory);

  IF   SysUtils.FileExists(Path + '.dat')
  THEN OK := (mrYes = MessageDlg('Overwrite files?', mtConfirmation,[mbYes, mbNo],0))
  ELSE OK := TRUE;   // file doesn't exist, let create new

  IF   OK
  THEN BEGIN
    ProgressBar.Visible := TRUE;
    FormPeaks.WriteSmoothingData(Path + '.dat');

    BitBtnCancel.Visible := TRUE;
    iChromosome := 1;
    StopNow := FALSE;

    WHILE (iChromosome < 17) AND (NOT StopNow) DO
    BEGIN
      Application.ProcessMessages;  // for the cancel button to work
      ProgressBar.Position := iChromosome;
      FormPeaks.ComboBoxChromosomeFilter.ItemIndex := iChromosome;
      FormPeaks.UpdateChromosomeFilter;

      Filename := Path + '-Peaks.csv';
      // Save data and charts
      IF   iChromosome = 1
      THEN FormPeaks.SavePeakData(Filename, spNew)
      ELSE FormPeaks.SavePeakData(Filename, spAppend);

      IF   CheckBoxSaveChartMulti.Checked
      THEN BEGIN
        FileName := Path + '-' +
                    'Chromosome' +
                    Format('%2.2d', [ FormPeaks.ComboboxChromosomeFilter.ItemIndex ]);
{$IFDEF GIF}
        FileName := FileName + '.gif';
        GIFImage := TGIFImage.Create;
        TRY
          GIFImage.Assign(FormPeaks.BitmapMultiRow);
          GIFImage.SavetoFile(Filename);
        FINALLY
          GIFImage.Free
        END
{$ELSE}
        FileName := FileName + '.bmp';
        FormPeaks.BitmapMultiRow.SaveToFile(Filename);
{$ENDIF}
      END;

      IF   CheckBoxSaveChartSingle.Checked
      THEN BEGIN
        FileName := Path + '-' +
                    'Strip' +
                    Format('%2.2d', [ FormPeaks.ComboboxChromosomeFilter.ItemIndex ]);

        CASE FormPeaks.RadioGroupSingleRowFormat.ItemIndex OF
          0:  BEGIN // Bitmap
               FileName := FileName + '.bmp';
               FormPeaks.BitmapSingleRow.SavetoFile(Filename);
             END;

          1: BEGIN // Metafile
               FileName := FileName + '.emf';
               FormPeaks.ImageSingleRow.Picture.Metafile.SaveToFile(Filename);
             END;

          2: BEGIN // Postscript
               FileName := FileName + '.eps';
               FormPeaks.DriverPostscript.List.SaveToFile(FileName)
             END;
        END
      END;

      INC(iChromosome)
    END;

    ProgressBar.Position := ProgressBar.Max;

    // Return to original view
    FormPeaks.ComboBoxChromosomeFilter.ItemIndex := iSave;
    FormPeaks.UpdateChromosomeFilter;

    BitBtnCancel.Visible := FALSE;
    ProgressBar.Visible := FALSE;
    LabelComplete.Visible := TRUE;
    ButtonGo.Enabled := FALSE;
  END
end;

procedure TFormProcessAll.FormActivate(Sender: TObject);
  VAR
    index:  INTEGER;
    s    :  STRING;
begin
  ProgressBar.Position := 0;
  s := FormPeaks.LabelRatioWorkBook.Caption;
  Delete(s,1,9);
  s := Trim(s);
  EditDirectory.Text := ExtractFilePath(s);

  s := ExtractFileName(s);
  index := POS('.',s);
  IF   index > 0
  THEN s := COPY(s,1,index-1);

  EditPrefix.Text    := ExtractFileName(s);
  LabelComplete.Visible := FALSE;
  ButtonGo.Enabled := TRUE;
end;

procedure TFormProcessAll.FormCreate(Sender: TObject);
begin
  StopNow := FALSE;
end;

procedure TFormProcessAll.BitBtnCancelClick(Sender: TObject);
begin
  StopNow := TRUE
end;

end.
