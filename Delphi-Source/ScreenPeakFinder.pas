// PeakFinder:  Find peaks in yeast ChIP (Chromatin Immunoprecipitation)
//              microarray data.
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

unit ScreenPeakFinder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Excel2000, OleServer, StdCtrls, Grids, ComCtrls, ExtCtrls,
  Buttons, Spin,
  PantographLibrary,       // TPantograph
  CanvasDriverLibrary,     // TCanvasDriver, ColorToRealColor
{$IFDEF Postscript}
  PostscriptDriverLibrary,  // TPostScriptDriver
{$ENDIF}
  GenomeLibrary,           // TGenome
  ExtDlgs, Mask, jpeg;


type
  TSavePeaks = (spNew, spAppend);
  TFormPeaks = class(TForm)
    PageControl: TPageControl;
    TabSheetChart: TTabSheet;
    ImageMultiRow: TImage;
    TabSheetPeaks: TTabSheet;
    StringGridPeaks: TStringGrid;
    TabSheetUniformSpacing: TTabSheet;
    MemoData: TMemo;
    CheckBoxLog2: TCheckBox;
    CheckBoxShowFeature: TCheckBox;
    ButtonRecomputeUniform: TButton;
    LabelStep: TLabel;
    SpinEditStep: TSpinEdit;
    CheckBoxUniform: TCheckBox;
    CheckBoxGap: TCheckBox;
    CheckBoxPeaks: TCheckBox;
    ButtonSavePeaks: TButton;
    SaveDialog: TSaveDialog;
    MemoPeaks: TMemo;
    GroupBoxSmoothing: TGroupBox;
    CheckBoxSmooth: TCheckBox;
    CheckBoxGaussian: TCheckBox;
    LabelNSmooth: TLabel;
    SpinEditSmoothHalfRange: TSpinEdit;
    SpinEditSmoothRounds: TSpinEdit;
    LabelRounds: TLabel;
    LabelNPoint: TLabel;
    TabSheetRawData: TTabSheet;
    ButtonLoadCoordinates: TButton;
    StringGridCoord: TStringGrid;
    ExcelApplicationCoordinates: TExcelApplication;
    OpenDialogCoordinates: TOpenDialog;
    ComboBoxCoordWorksheet: TComboBox;
    LabelCoordinatesWorkbook: TLabel;
    LabelWorksheetCoord: TLabel;
    LabelWorksheetRowCount: TLabel;
    LabelGap: TLabel;
    LabelOverlap: TLabel;
    ComboBoxChromosomeFilter: TComboBox;
    CheckBoxWriteUniform: TCheckBox;
    ButtonLoadRatio: TButton;
    LabelRatioWorkbook: TLabel;
    LabelWorksheetRatio: TLabel;
    ComboBoxRatioWorksheet: TComboBox;
    LabelRatioIndex: TLabel;
    OpenDialogRatio: TOpenDialog;
    ExcelApplicationRatio: TExcelApplication;
    SpinEditRatioColumn: TSpinEdit;
    MemoRatioProblems: TMemo;
    LabelNotFoundHeader: TLabel;
    LabelRatioError: TLabel;
    LabelRatioMissing: TLabel;
    LabelCoord1: TLabel;
    EditCoord1: TEdit;
    EditCoord2: TEdit;
    LabelCoord2: TLabel;
    ButtonReplot: TButton;
    LabelRatioRange: TLabel;
    LabelRatioName: TLabel;
    ButtonReloadRatio: TButton;
    RadioButtonRawData: TRadioButton;
    RadioButtonUniformData: TRadioButton;
    LabelCoords: TLabel;
    SavePictureDialog: TSavePictureDialog;
    ButtonProcessAll: TButton;
    ShapeCentromere: TShape;
    LabelCentromere: TLabel;
    LabelDisplayRatio1: TLabel;
    EditDisplayFrom: TEdit;
    LabelDisplayRatio2: TLabel;
    EditDisplayTo: TEdit;
    LabelWatson: TLabel;
    LabelCrick: TLabel;
    LabelIntergenic: TLabel;
    CheckBoxContent: TCheckBox;
    TabSheetATGC: TTabSheet;
    GroupBox1: TGroupBox;
    LabelSlidingWindow: TLabel;
    SpinEditSlidingWindow: TSpinEdit;
    LabelUpdateFrequency: TLabel;
    SpinEditUpdateFrequency: TSpinEdit;
    LabelPercentRange: TLabel;
    SpinEditPercentRangeHigh: TSpinEdit;
    SpinEditPercentRangeLow: TSpinEdit;
    CheckBoxContentAT: TCheckBox;
    CheckBoxContentGC: TCheckBox;
    CheckBoxContentA: TCheckBox;
    CheckBoxContentT: TCheckBox;
    CheckBoxContentC: TCheckBox;
    CheckBoxContentG: TCheckBox;
    LabelPercentRangeComment: TLabel;
    MemoSequence: TMemo;
    CheckBoxAutoScaleATGC: TCheckBox;
    LabelGapShow: TLabel;
    LabelOverlapShow: TLabel;
    TabSheetAbout: TTabSheet;
    PanelAdvertisement: TPanel;
    LabelLabName: TLabel;
    LabelStowersURL: TLabel;
    LabelPIName: TLabel;
    LabelProgrammerName: TLabel;
    LabelProgramName: TLabel;
    LabelProgramDate: TLabel;
    RichEditInfo: TRichEdit;
    SpeedButtonSaveChart: TSpeedButton;
    LabelAbout: TLabel;
    Image1: TImage;
    PanelStowersNameLogo: TPanel;
    ImageStowersNameLogo: TImage;
    LabelMinPeak: TLabel;
    LabelMinYLeftDelta: TLabel;
    SpinEditMinSmoothLeftDelta: TSpinEdit;
    SpinEditMinSmoothRightDelta: TSpinEdit;
    LabelMinYRightDelta: TLabel;
    LabelYSmoothDelta: TLabel;
    Label1: TLabel;
    SpinEditThreshold: TSpinEdit;
    Label2: TLabel;
    SpinEditTraceCount: TSpinEdit;
    LabelTraceCount: TLabel;
    TabSheetSingleStrip: TTabSheet;
    PanelSingleRow: TPanel;
    ScrollBarSingleRow: TScrollBar;
    SpinEditSingleRowHeight: TSpinEdit;
    LabelSingleRowHeight: TLabel;
    LabelSingleRowVertical: TLabel;
    LabelSingleRowHorizontal: TLabel;
    LabelSingleRowBasesPerPixel: TLabel;
    SpinEditSingleRowBasesPerPixel: TSpinEdit;
    ImageSingleRow: TImage;
    SpeedButtonSingleRow: TSpeedButton;
    CheckBoxAutoScaleRatio: TCheckBox;
    TabSheet1: TTabSheet;
    GroupBoxMisc: TGroupBox;
    Label3: TLabel;
    SpinEditHorizontalGrid: TSpinEdit;
    RadioGroupAutoSave: TRadioGroup;
    CheckBoxShowRatio: TCheckBox;
    ButtonLoadGenome: TButton;
    LabelGenomeIndex: TLabel;
    OpenDialogGenomeIndex: TOpenDialog;
    ButtonSelectSequenceDirectory: TButton;
    EditSequenceDirectory: TEdit;
    LabelSequenceDirectoryComment: TLabel;
    CheckBoxShowTitle: TCheckBox;
    CheckBoxVerticalTicks: TCheckBox;
    RadioGroupSingleRowFormat: TRadioGroup;
    SaveDialogPostscript: TSaveDialog;
    ButtonReset: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure ButtonLoadCoordinatesClick(Sender: TObject);     // Coordinates Data
    procedure ComboBoxCoordWorksheetChange(Sender: TObject);
    procedure StringGridCoordDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

    procedure ButtonLoadRatioClick(Sender: TObject);           // Ratio Data
    procedure ComboBoxRatioWorksheetChange(Sender: TObject);

    procedure ComboBoxChromosomeFilterChange(Sender: TObject); // Coordinates + Ratio Data

    procedure ButtonRecomputeUniformClick(Sender: TObject);

    procedure SpinEditTraceCountChange(Sender: TObject);       // Plotting Data
    procedure EditCoordKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonReplotClick(Sender: TObject);
    procedure CheckBoxLog2Click(Sender: TObject);

    procedure ButtonSavePeaksClick(Sender: TObject);
    procedure ButtonReloadRatioClick(Sender: TObject);
    procedure ImageMultiRowMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ButtonProcessAllClick(Sender: TObject);
    procedure EditFloatKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSelectSequenceDirectoryClick(Sender: TObject);
    procedure CheckBoxContentClick(Sender: TObject);
    procedure SpinEditReplotChange(Sender: TObject);
    procedure CheckBoxReplotClick(Sender: TObject);
    procedure LabelStowersURLClick(Sender: TObject);
    procedure SpeedButtonSaveChartClick(Sender: TObject);
    procedure ScrollBarSingleRowChange(Sender: TObject);
    procedure SpinEditSingleRowChange(Sender: TObject);
    procedure ButtonLoadGenomeClick(Sender: TObject);
    procedure ReplotEverythingEvent(Sender: TObject);
    procedure SpeedButtonSingleRowClick(Sender: TObject);
    procedure RadioGroupSingleRowFormatClick(Sender: TObject);
    procedure CheckBoxPeaksClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);           // Peak Data


  private
    DriverBitmap          :  TCanvasDriver;
    DriverBitmapSingle    :  TCanvasDriver;
    DriverMetafile        :  TCanvasDriver;


    FilenameCoordinates   :  STRING;
    FilenameRatio         :  STRING;
    CoordinatesList       :  TStringList;  // Lookup table to find features by name in StringGridCoord
    DataLoadedCoord       :  BOOLEAN;
    DataLoadedRatio       :  BOOLEAN;
    InitialSingleRowHeight:  INTEGER;
    InitialSingleRowWidth :  INTEGER;

    LCID                  :  DWORD;      // the user default–locale identifier (to load Excel)
    Pantograph            :  ARRAY OF TPantograph; // keep in-memory for dynamic lookup
    PantographCount       :  INTEGER;
    PeakCount             :  INTEGER;
    RatioHeaderName       :  STRING;

    step                  :  INTEGER;
    xMaxChromosome        :  Double;     // Actual length of selected chromosome

                             // Dynamic arrays for data to be plotted.
                             // These data defined in UpdateChromosomeFilter.
                             // Arrays are for "Chromosome Coordinates", except
                             // "Genome Coordinates" are used with "All Chromosomes".
    FeatureCount          :  INTEGER;            // FeatureCount array elements
    FeatureName           :  ARRAY OF STRING;
    Coord1                :  ARRAY OF INTEGER;
    Coord2                :  ARRAY OF INTEGER;
    DS2Ratio              :  ARRAY OF Double;
    Midpoint              :  ARRAY OF Double;    // (Midpoint, DS2Ratio)
    ratioMin              :  Double;
    ratioMax              :  Double;

    UniformCount          :  INTEGER;            // UniformCount array elements
    UniformX              :  ARRAY OF Double;    // (UniformX, UniformY)
    UniformY              :  ARRAY OF Double;
    stepCount             :  ARRAY OF INTEGER;   // # features at uniform point
    FeatureIndex          :  ARRAY OF INTEGER;

    xMaxPlot              :  Double;    // Parameters for pantographs.
    xMinPlot              :  Double;
    yIntMax               :  Integer;
    yIntMin               :  INTEGER;
    yMax                  :  Double;
    yMin                  :  Double;

    Genome                :  TGenome;

    // For AT/GC content plots
    ChromosomeSequence:  STRING;
    SlidingWindow     :  INTEGER;
    PROCEDURE ComputeNucleotideContentRanges;

    PROCEDURE LoadGenomeIndexFile(CONST Filename:  TFilename);
    PROCEDURE CheckSequenceFiles(CONST Directory: STRING);

    PROCEDURE LoadCoordinatesWorkbook;           // Coordinates Data
    PROCEDURE LoadCoordinatesWorksheet;

    PROCEDURE LoadRatioWorkbook;                 // Ratio Data
    PROCEDURE LoadRatioWorksheet(CONST column:  INTEGER);


    PROCEDURE UniformSpacing;                    // Uniform Data
    PROCEDURE PlotValues;                        // Plotting Data

    PROCEDURE DefineNewPantographs;
    PROCEDURE GetFeatureName(CONST bps:  Double; VAR FeatureCode, FeatureInfo:  STRING);

    PROCEDURE UpdateDisplayRange;

    PROCEDURE ResetEverything;
  public
     BitmapMultiRow   :  TBitmap;
     BitmapSingleRow  :  TBitmap;
     MetafileSingleRow:  TMetafile;
     MetafileCanvas   :  TMetafileCanvas;

     DriverPostscript :  TPostScriptDriver;  // Expose this for ProcessAll option

     PROCEDURE SavePeakData(CONST Filename:  TFilename; SavePeaks:  TSavePeaks);
     PROCEDURE UpdateChromosomeFilter;            // Coordinates + Ratio Data
     PROCEDURE WriteSmoothingData(CONST Filename:  TFilename);
  end;

var
  FormPeaks: TFormPeaks;

implementation
{$R *.dfm}

  USES
{$IFDEF GIF}
    GIFImage,      // TGIFImage
{$ENDIF}

{$IFDEF MSWindows}
    ShellAPI,      // ShellExecute
{$ENDIF}

{$IFDEF Linux}     // In case ever ported to Kylix
    libc,          // libc.system
{$ENDIF}

    Clipbrd,       // Clipboard
    FileCtrl,      // SelectDirectory
    IniFiles,      // TIniFile
    INILibrary,    // AppINIFilename
    TypesLibrary,  // centerText
    Math,          // Max
    NucleotideSequenceLibrary,
    SmoothingLibrary,
    StringGridLibrary,
    ScreenProcessAll,
    ScreenSplash;

  CONST
    AppDir              = 'StowersInstitute';

    BadValue            = -99999999;

    colCoordName        =  1;  // column indices for StringGridCoord
    colCoordGenome1     =  2;
    colCoordGenome2     =  3;
    colCoordLength      =  4;
    colCoordChromosome  =  5;
    colCoordChr1        =  6;
    colCoordChr2        =  7;
    colCoordChrMidpoint =  8;
    colCoordGapOverlap  =  9;
    colCoordRatio       = 10;

    PeakColumnCount =     14;  // columns in StringGridPeaks to write to disk

    colorWatson     = clBlue;
    colorCrick      = clRed;
    colorIntergenic = clOlive;
    colorUnknown    = clAqua;

    colorGap        = clLime;
    colorOverlap    = clFuchsia;

  TYPE
    EWrongColumns       = CLASS(Exception);
    EMissingGenomeIndex = CLASS(Exception);

////  Utility functions   ////////////////////////////////////////////////////

  FUNCTION LOG2(X:  Double): Double;
  BEGIN
    IF   X <= 0
    THEN LOG2 := 0    // use this kludge for this data
    ELSE LOG2 := LN(X) / LN(2)
  END {Log2};


  FUNCTION FeatureColor(CONST feature:  STRING):  TColor;
  BEGIN
    IF   POS(';', feature) > 0     //  feature1; feature2; feature3
    THEN RESULT := colorOverlap    // overlap with multiple features
    ELSE
      IF   Uppercase(COPY(feature, 1, 1)) = 'I'
      THEN RESULT := colorIntergenic
      ELSE
       IF   Uppercase(COPY(feature, LENGTH(feature), 1)) = 'C'  // Crick
       THEN RESULT := colorCrick
       ELSE
         IF   Uppercase(COPY(feature, LENGTH(feature), 1)) = 'W'  // Watson
         THEN RESULT := colorWatson
         ELSE RESULT := colorGap    // unknown, boundaries
  END;


  // Adapted from Dr. John Stockton's Math Page
  // www.merlyn.demon.co.uk/programs/wr-roman.pas
  // efg tested through 300
  function RomanNumeral(CONST Number:  LongWord) : string;
    const
      Digits = 7 ;
    type
      Decades = 0..Pred(Digits);
    const
      Pattern : array ['0'..'9'] of string [4] =
        ('', 'x', 'xx', 'xxx', 'xy', 'y', 'yx', 'yxx', 'yxxx', 'xz') ;
    const
      DecXlatn : array [Decades] of array ['x'..'z'] of char =
        ('IVX', 'XLC', 'CDM', 'Mvx', 'xlc', 'cdm', 'm??' {, ...}) ;
    var
      DigitNum:  byte;
      CharNumb:  byte;
      NumStr  :  string[10];
      ChrPattn:  string[4];
      PartRomn:  string[4];
  begin
    RESULT := '' ;
    NumStr := IntToStr(Number);

    if   Length(NumStr) > Digits
    then RESULT := 'Too Big'
    else begin
      for DigitNum := 1 to Length(NumStr) do
      begin
        ChrPattn := Pattern[NumStr[DigitNum]];
        PartRomn[0] := ChrPattn[0];
        for CharNumb := 1 to Length(ChrPattn) do
          PartRomn[CharNumb] := DecXlatn[Length(NumStr)-DigitNum][ChrPattn[CharNumb]] ;
        RESULT := RESULT + PartRomn
      end {DigitNum}
    end
  end {RomanNumeral};


////  Form Create/Destroy ////////////////////////////////////////////////////

procedure TFormPeaks.FormCreate(Sender: TObject);
  VAR
    Filename      :  TFilename;
    IniFile       :  TInifile;
    ResourceStream:  TResourceStream;
begin
  InitialSingleRowHeight := ImageSingleRow.Height;
  InitialSingleRowWidth  := ImageSingleRow.Width;
  LabelProgramDate.Caption := FormSplash.LicenseLabel.Caption;

  // One-time startup initializations
  PanelSingleRow.DoubleBuffered := TRUE;  // avoid flicker

  // Hassle user if screen too small
  IF   (Screen.Width < FormPeaks.Width) OR
       (Screen.Height < FormPeaks.Height)
  THEN ShowMessage('Best on screen with ' +
                  IntToStr(FormPeaks.Width) + '-by-' +
                  InttoStr(FormPeaks.Height) + ' resolution (or higher)');

  // Load "About" rich text from resource
  ResourceStream := TResourceStream.Create(hInstance, 'PEAKABOUT', 'RTF');
  TRY
    RichEditInfo.Lines.LoadFromStream(ResourceStream)
  FINALLY
    ResourceStream.Free
  END;

  LabelWatson.Font.Color     := colorWatson;
  LabelCrick.Font.Color      := colorCrick;
  LabelIntergenic.Font.Color := colorIntergenic;

  // Assign column names to StringGridPeaks
  WITH StringGridPeaks DO
  BEGIN
    Cells[ 1,0] := 'Peak';
    Cells[ 2,0] := 'xSmooth';
    Cells[ 3,0] := 'xSLeftDelta';
    Cells[ 4,0] := 'xSRightDelta';
    Cells[ 5,0] := 'ySmooth';
    Cells[ 6,0] := 'ySLeftDelta';
    Cells[ 7,0] := 'ySRightDelta';
    Cells[ 8,0] := 'Feature';
    Cells[ 9,0] := 'x';
    Cells[10,0] := 'xLeftDelta';
    Cells[11,0] := 'xRightDelta';
    Cells[12,0] := 'y';
    Cells[13,0] := 'yLeftDelta';
    Cells[14,0] := 'yRightDelta';
  END;

  LCID := GetUserDefaultLCID;      // Obscure:  needed to load Excel workbooks

  //  Get the name of the first three columns of the coordinates file from INI
  Filename := AppINIFilename(AppDir);
  IniFile := TIniFile.Create(Filename);
  TRY
    WITH StringGridCoord DO
    BEGIN
      // Columns read from Excel worksheet
      Cells[colCoordName,    0] := IniFile.ReadString('Setup', 'CoordName', 'Name');
      Cells[colCoordGenome1 ,0] := IniFile.ReadString('Setup', 'Coord1',    'Coord1');
      Cells[colCoordGenome2, 0] := IniFile.ReadString('Setup', 'Coord2',    'Coord2');
      RatioHeaderName           := IniFile.ReadString('Setup', 'RatioName', 'IName');

      // Computed columns with fixed names
      Cells[colCoordLength,     0] := 'Length';
      Cells[colCoordChromosome, 0] := 'Chromosome';
      Cells[colCoordChr1,       0] := 'ChrCoord1';
      Cells[colCoordChr2,       0] := 'ChrCoord2';
      Cells[colCoordChrMidpoint,0] := 'Midpoint';
      Cells[colCoordGapOverlap, 0] := 'Gap/Overlap';
      Cells[colCoordRatio,      0] := 'Ratio';
    END;

  FINALLY
    IniFile.Free
  END;

  ///////////////////////////////////////////////////////////

  // Get File names from INI
  Filename := AppINIFilename(AppDir);
  IniFile := TIniFile.Create(Filename);
  TRY
    LabelGenomeIndex.Caption := IniFile.ReadString('Setup', 'GenomeIndex', '');

    FilenameCoordinates :=
        IniFile.ReadString('Setup', 'CoordinatesWorkbook', '');

    FilenameRatio :=
        IniFile.ReadString('Setup', 'RatioWorkbook', '');

    EditSequenceDirectory.Text := IniFile.ReadString('Setup', 'SequenceDirectory', '');

  FINALLY
    IniFile.Free
  END;

  PageControl.ActivePage := TabSheetRawData;

  // Try the Genome Index File
  LoadGenomeIndexFile(LabelGenomeIndex.Caption);

  IF  ButtonSelectSequenceDirectory.Enabled
  THEN BEGIN
    // Check on the default Sequence Directory
    CheckSequenceFiles(ExtractFilePath(LabelGenomeIndex.Caption));

    // Read default coordinates file (if any)
    IF   (LENGTH(FilenameCoordinates) > 0) AND FileExists(FilenameCoordinates)
    THEN BEGIN
       LoadCoordinatesWorkbook;
       IF   DataLoadedCoord
       THEN LoadRatioWorkbook;
    END
  END
end;


procedure TFormPeaks.FormDestroy(Sender: TObject);
  VAR
    k:  INTEGER;
begin
  IF   Assigned(Genome)
  THEN Genome.Free;

  IF   Assigned(BitmapMultiRow)
  THEN BitmapMultiRow.Free;

  // Single Row
  IF   Assigned(BitmapSingleRow)       // Bitmap
  THEN BitmapSingleRow.Free;

  IF   Assigned(DriverBitmapSingle)    // Metafile
  THEN DriverBitmapSingle.Free;

  IF   Assigned(MetafileSingleRow)
  THEN MetafileSingleRow.Free;

  IF   Assigned(DriverMetafile)
  THEN DriverMetafile.Free;

  IF   Assigned(DriverPostscript)
  THEN DriverPostscript.Free;

  FOR k := 0 TO PantographCount-1 DO
    Pantograph[k].Free;

  IF   Assigned(DriverBitmap)
  THEN DriverBitmap.Free;

  Pantograph := NIL;
  CoordinatesList.Free;
end;


PROCEDURE TFormPeaks.ResetEverything;
  VAR
    Filename:  STRING;
    k       :  INTEGER;
    IniFile :  TIniFile;
BEGIN
  // Update INI file for next time
  Filename := AppINIFilename(AppDir);
  IniFile := TIniFile.Create(Filename);
  TRY
    IniFile.WriteString('Setup', 'GenomeIndex', OpenDialogGenomeIndex.Filename);

    // Default starting values
    FilenameCoordinates := '';
    FilenameRatio := '';
    EditSequenceDirectory.Text := '';

    LabelSequenceDirectoryComment.Caption := '<Comment>';
    LabelCoordinatesWorkbook.Caption := 'Workbook:  Coordinates Filename';
    LabelRatioWorkbook.Caption := 'Workbook:  Ratios Filename';

    IniFile.WriteString('Setup', 'CoordinatesWorkbook', FilenameCoordinates);
    IniFile.WriteString('Setup', 'RatioWorkbook',       FilenameRatio);
    IniFile.WriteString('Setup', 'SequenceDirectory',   EditSequenceDirectory.Text);
  FINALLY
    IniFile.Free
  END;
  // Flush INI cache
  WritePrivateProfileString(NIL, NIL, NIL, pChar(Filename));

  // Erase any existing coordinate data
  StringGridCoord.RowCount := 2;
  // Blank the second row
  FOR k := 1 TO StringGridCoord.ColCount DO
  BEGIN
    StringGridCoord.Cells[k,1] := ''
  END;

  // Erase any existing ratio data
  StringGridPeaks.RowCount := 2;
  // Blank the second row
  FOR k := 1 TO StringGridPeaks.ColCount DO
  BEGIN
    StringGridPeaks.Cells[k,1] := ''
  END;

  // Clear / re-initialize verything
  ChromosomeSequence := '';
  PeakCount := 0;
  DataLoadedCoord := FALSE;
  DataLoadedRatio := FALSE;
  ButtonLoadRatio.Enabled := FALSE;

  ChromosomeSequence := '';
  ComboBoxCoordWorksheet.Text := '';
  ComboBoxRatioWorksheet.Text := '';

  ImageMultiRow.Picture.Graphic  := NIL;  // clear the images

  ImageSingleRow.Picture.Graphic := NIL;
  PanelSingleRow.Width  := InitialSingleRowWidth;
  PanelSingleRow.Height := InitialSingleRowHeight;

  MemoRatioProblems.Lines.Clear;
  MemoSequence.Lines.Clear;
  MemoData.Lines.Clear;
  MemoPeaks.Lines.Clear;

  IF   Assigned(BitmapMultiRow)
  THEN BitmapMultiRow.Free;

  BitmapMultiRow        := TBitmap.Create;  // Bitmap to hold all drawing
  BitmapMultiRow.Width  := ImageMultiRow.Width;
  BitmapMultiRow.Height := ImageMultiRow.Height;
  BitmapMultiRow.PixelFormat := pf24bit;

  IF   Assigned(CoordinatesList)
  THEN CoordinatesList.Free;

  CoordinatesList := TStringList.Create;    // Feature name lookup table
  CoordinatesList.Sorted     := TRUE;
  CoordinatesList.Duplicates := dupError;
END {ResetEverything};


/////  Genome Index File   ///////////////////////////////////////////////////

PROCEDURE TFormPeaks.LoadGenomeIndexFile(CONST Filename:  TFilename);
  VAR
    i:  INTEGER;
    k:  INTEGER;
BEGIN
  // Clear / re-initialize verything
  ChromosomeSequence := '';
  PeakCount := 0;
  DataLoadedCoord := FALSE;
  DataLoadedRatio := FALSE;

  ImageMultiRow.Picture.Graphic  := NIL;  // clear the images

  ImageSingleRow.Picture.Graphic := NIL;
  PanelSingleRow.Width  := InitialSingleRowWidth;
  PanelSingleRow.Height := InitialSingleRowHeight;

  MemoRatioProblems.Lines.Clear;
  MemoSequence.Lines.Clear;
  MemoData.Lines.Clear;
  MemoPeaks.Lines.Clear;

  StringGridCoord.RowCount := 2;
  // Blank the second row
  FOR k := 1 TO StringGridCoord.ColCount DO
  BEGIN
    StringGridCoord.Cells[k,1] := ''
  END;

  StringGridPeaks.RowCount := 2;
  // Blank the second row
  FOR k := 1 TO StringGridPeaks.ColCount DO
  BEGIN
    StringGridPeaks.Cells[k,1] := ''
  END;

  IF   Assigned(BitmapMultiRow)
  THEN BitmapMultiRow.Free;

  BitmapMultiRow        := TBitmap.Create;  // Bitmap to hold all drawing
  BitmapMultiRow.Width  := ImageMultiRow.Width;
  BitmapMultiRow.Height := ImageMultiRow.Height;
  BitmapMultiRow.PixelFormat := pf24bit;

  IF   Assigned(CoordinatesList)
  THEN CoordinatesList.Free;

  CoordinatesList := TStringList.Create;    // Feature name lookup table
  CoordinatesList.Sorted     := TRUE;
  CoordinatesList.Duplicates := dupError;

  IF   SysUtils.FileExists(Filename)
  THEN BEGIN
    IF   Assigned(Genome)
    THEN Genome.Free;

    Genome := TGenome.Create(Filename);

    ComboBoxChromosomeFilter.Items.Clear;
    ComboBoxChromosomeFilter.Items.Add('All Chromosomes');
    FOR i := 1 TO Genome.ChromosomeCount DO
    BEGIN
      ComboBoxChromosomeFilter.Items.Add('Chromosome ' + Genome.Chromosome[i].Name);
    END;

    ButtonSelectSequenceDirectory.Enabled := TRUE;
    ButtonLoadCoordinates.Enabled := TRUE;
  END
  ELSE BEGIN
    ShowMessage('Please specify Genome Index Filename');
    LabelGenomeIndex.Caption := 'Genome Index:  Filename';
  END

END {LoadGenomeIndexFile};


////  Coordinates Data    ////////////////////////////////////////////////////

PROCEDURE TFormPeaks.LoadCoordinatesWorkbook;
  VAR
    i        :  INTEGER;
    WorkBook :  _WorkBook;
    WorkSheet:  _WorkSheet;
BEGIN
  Screen.Cursor := crHourGlass;
  TRY

    LabelCoordinatesWorkbook.Caption := 'Workbook:  ' + FilenameCoordinates;

    // Make sure ConnectKind property is set to ckNewInstance to prevent
    // interference with other open Excel workbooks.
    ExcelApplicationCoordinates.Connect;
    TRY
      ExcelApplicationCoordinates.Workbooks.Open(
        FilenameCoordinates,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, 0);

      // Not sure how this could be 0, but check anyway
      IF   ExcelApplicationCoordinates.Workbooks.Count > 0
      THEN BEGIN

         ComboBoxCoordWorksheet.Items.Clear;
         WorkBook := ExcelApplicationCoordinates.Workbooks.Item[1];
         FOR i := 1 TO Workbook.Worksheets.Count DO
         BEGIN
           WorkSheet := WorkBook.Worksheets.Get_Item(i) AS _WorkSheet;
           ComboBoxCoordWorksheet.Items.Add(WorkSheet.Name)
         END;

         IF   Workbook.Worksheets.Count > 0
         THEN BEGIN
           // Pick the first one for coordinates
           ComboBoxCoordWorksheet.ItemIndex := 0;
           LoadCoordinatesWorksheet
         END
      END

    FINALLY
      ExcelApplicationCoordinates.Quit;
      ExcelApplicationCoordinates.Disconnect
    END

  FINALLY
    Screen.Cursor := crDefault
  END
END {LoadCoordinatesWorkbook};


PROCEDURE TFormPeaks.LoadCoordinatesWorksheet;
  VAR
    chromosome1  :  INTEGER;
    chromosome2  :  INTEGER;
    coord1       :  INTEGER;
    coord2       :  INTEGER;
    i            :  INTEGER;
    j            :  INTEGER;
    Matrix       :  OLEvariant;
    offset1      :  INTEGER;
    offset2      :  INTEGER;
    OK           :  BOOLEAN;
    SheetColCount:  INTEGER;
    SheetRowCount:  INTEGER;
    WorkBook     :  _WorkBook;
    WorkSheet    :  _WorkSheet;
    WorkSheetName:  STRING;
begin
  IF  ComboBoxCoordWorksheet.ItemIndex >= 0
  THEN BEGIN
    WorkSheetName := ComboBoxCoordWorksheet.Items[ComboBoxCoordWorksheet.ItemIndex];

    // Make sure ConnectKind property is set to ckNewInstance to prevent
    // interference with other open Excel workbooks.
    ExcelApplicationCoordinates.Connect;
    TRY
      ExcelApplicationCoordinates.Workbooks.Open(
        FilenameCoordinates,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, 0);
      WorkBook := ExcelApplicationCoordinates.Workbooks.Item[1];
      WorkSheet := WorkBook.Worksheets.Item[WorkSheetName] AS _WorkSheet;
      WorkSheet.Activate(LCID);

      // To find dimensions of worksheet, activate the last non-empty cell
      WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

      SheetRowCount := ExcelApplicationCoordinates.ActiveCell.Row;
      SheetColCount := ExcelApplicationCoordinates.ActiveCell.Column;

      Matrix := ExcelApplicationCoordinates.Range['A1',
        ExcelApplicationCoordinates.Cells.Item[SheetRowCount,SheetColCount]].Value;

      // Fetch entire spreadsheet into "Matrix" for convenience
      // "New" way adapted from
      // "Top 10 list for using Microsoft Excel to speed Delphi development"
      // http://community.borland.com/article/0,1410,28076,00.html
      // Matrix := WorkSheet.UsedRange[0].Value;
      // But the "old" way works in some cases that the new method fails.
      // So, I'm keeping the old way, but leaving these commments here
      // for future consideration.

      // This is tempting to use, but access to Matrix fails
      // if 0 rows or 0 columns present.  Row.Count and
      // Columns.Count lie here and say "1" when they should be "0".
      // SheetRowCount := VarArrayHighBound(Matrix, 1);
      // SheetColCount := VarArrayHighBound(Matrix, 2);
      //
      // Another way
      // SheetRowCount := WorkSheet.UsedRange[0].Rows.Count;
      // SheetColCount := WorkSheet.UsedRange[0].Columns.Count;

      StringGridCoord.RowCount :=  SheetRowCount;

      IF   (SheetRowCount = 1) AND (SheetColCount = 1)
      THEN StringGridCoord.Cells[1,1] := ''
      ELSE BEGIN
        // Fill StringGrid with spreadsheet values

        // Read the required column names for worksheet:
        // colCoordName, colCoordGenome1, colCoordGenome2
        // Make sure names match expected names (or could be using wrong
        // spreadsheet).
        OK := TRUE;
        FOR i := colCoordName TO colCoordGenome2 DO
        BEGIN
          OK := OK AND
               (Uppercase(StringGridCoord.Cells[i,0]) = Uppercase(Matrix[1,i]))
        END;

        IF   OK
        THEN BEGIN
          CoordinatesList.Clear;

          FOR j := 2 TO SheetRowCount DO
          BEGIN
            StringGridCoord.Cells[0,j-1] := IntToStr(j-1);

            // Get only the desired columns:
            FOR i := colCoordName TO colCoordGenome2 DO
            BEGIN
              StringGridCoord.Cells[i,j-1] := Matrix[j,i]
            END;

            TRY
              CoordinatesList.AddObject(StringGridCoord.Cells[colCoordName, j-1],
                                        TObject(j-1));
            EXCEPT
              ON EStringListError DO
              BEGIN
                ShowMessage('Ignoring duplicate ' +
                            StringGridCoord.Cells[colCoordName, j-1] +
                            ' in line ' +
                            IntToStr(j-1));
              END
            END;

            // Compute remaining columns
            coord1 := StrToIntDef(StringGridCoord.Cells[colCoordGenome1 ,j-1], 0);
            coord2 := StrToIntDef(StringGridCoord.Cells[colCoordGenome2 ,j-1], 0);

            ASSERT ( (coord1 > 0) AND (coord2 > 0),
                    'Problem in converting coordinates in line ' + IntToStr(j-1) );

            StringGridCoord.Cells[colCoordLength, j-1] := IntToStr(coord2 - coord1);

            Genome.GetChromosomeIndex(coord1, chromosome1, offset1);
            Genome.GetChromosomeIndex(coord2, chromosome2, offset2);

            ASSERT ( (chromosome1 = chromosome2),
                    'Feature ' + IntToStr(j-1) + ' spans two chromosomes');

            StringGridCoord.Cells[colCoordChromosome, j-1] := IntToStr(chromosome1);
            StringGridCoord.Cells[colCoordChr1, j-1] := IntToStr(offset1);
            StringGridCoord.Cells[colCoordChr2, j-1] := IntToStr(offset2);

            StringGridCoord.Cells[colCoordChrMidpoint, j-1] := Format('%.1f', [(offset1 + offset2) / 2]);

            StringGridCoord.Cells[colCoordRatio, j-1] := 'Missing';

            // Gap/Overlap kludge
            IF   j > 2
            THEN StringGridCoord.Cells[colCoordGapOverlap, j-1] :=
              IntToStr( StrToInt(StringGridCoord.Cells[2,j-1]) -
                        StrToInt(StringGridCoord.Cells[3,j-2]) );
          END;

          DataLoadedCoord := TRUE;
          ButtonLoadRatio.Enabled := TRUE;
        END
        ELSE BEGIN
          ShowMessage('Column headers not correct for coordinates file');
          // Show expected and found headers
          StringGridCoord.RowCount := 2;
          FOR i := colCoordName TO colCoordRatio  DO
          BEGIN
             StringGridCoord.Cells[i,1] := '';
          END;

          DataLoadedCoord := FALSE;
          ButtonLoadRatio.Enabled := FALSE
        END

      END

    FINALLY
      ExcelApplicationCoordinates.Quit;
      ExcelApplicationCoordinates.Disconnect;
    END;

    // Force update using first chromosome instead of genome view
    ComboBoxChromosomeFilter.ItemIndex := 1;

  END
  ELSE BEGIN
    ShowMessage('No WorkSheet available');
    DataLoadedCoord := FALSE;
    ButtonLoadRatio.Enabled := FALSE
  END

END {LoadCoordinatesWorksheet};


procedure TFormPeaks.ButtonLoadCoordinatesClick(Sender: TObject);
  VAR
    Filename :  TFilename;
    IniFile  :  TInifile;
begin
  IF  OpenDialogCoordinates.Execute
  THEN BEGIN
    FilenameCoordinates := OpenDialogCoordinates.Filename;

    IF   FileExists(FilenameCoordinates)
    THEN BEGIN
      FileName := AppINIFilename(AppDir);
      IniFile := TIniFile.Create(Filename);
      TRY
        IniFile.WriteString('Setup', 'CoordinatesWorkbook', FilenameCoordinates);
      FINALLY
        IniFile.Free
      END;
      // Flush INI cache
      WritePrivateProfileString(NIL, NIL, NIL, pChar(Filename));

      LoadCoordinatesWorkbook
    END
    ELSE ShowMessage('Cannot find file <' + Filename + '>');
  END
end;


procedure TFormPeaks.ComboBoxCoordWorksheetChange(Sender: TObject);
begin
  LoadCoordinatesWorksheet;
end;


procedure TFormPeaks.StringGridCoordDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

  VAR
    Coord1This:  INTEGER;
    Coord2Last:  INTEGER;
    s         :  STRING;
begin
  // Don't bother trying to draw cell if not visible
  IF   StringGridCoord.RowHeights[ARow] > 0
  THEN BEGIN
    s := StringGridCoord.Cells[ACol, ARow];

    StringGridCoord.Canvas.Font.Color := clBlack;

    IF   (ACol < StringGridCoord.FixedCols) OR (ARow < StringGridCoord.FixedRows)
    THEN StringGridCoord.Canvas.Brush.Color := clBtnFace
    ELSE
      IF   (ARow >= StringGridCoord.Selection.Top) AND
           (ARow <= StringGridCoord.Selection.Bottom)
      THEN StringGridCoord.Canvas.Brush.Color := clYellow
      ELSE StringGridCoord.Canvas.Brush.Color := clWhite;

    StringGridCoord.Canvas.FillRect(Rect);

    IF   ARow = 0
    THEN BEGIN
      StringGridCoord.Canvas.Font.Color := clBlack;
      AlignText(StringGridCoord.Canvas, Rect, alCenter, s)
    END
    ELSE BEGIN
      CASE ACol OF
        0:
          BEGIN
            StringGridCoord.Canvas.Font.Color := clBlack;
            StringGridCoord.Canvas.Font.Style := [];
            AlignText(StringGridCoord.Canvas, Rect, alRight, s);
          END;

        1:
          BEGIN
            StringGridCoord.Canvas.Font.Color := clBlack;
            StringGridCoord.Canvas.Font.Style := [];
            AlignText(StringGridCoord.Canvas, Rect, alLeft, s);
          END;

        ELSE
          IF  (UpperCase(s) = 'ERROR') OR (UpperCase(s) = 'MISSING')
          THEN BEGIN
            StringGridCoord.Canvas.Brush.Color := clRed;
            StringGridCoord.Canvas.FillRect(Rect);
            StringGridCoord.Canvas.Font.Color := clWhite;
            StringGridCoord.Canvas.Font.Style := [fsBold];
            AlignText(StringGridCoord.Canvas, Rect, alLeft, s);
          END
          ELSE BEGIN
            StringGridCoord.Canvas.Font.Color := clBlack;
            StringGridCoord.Canvas.Font.Style := [];
            AlignText(StringGridCoord.Canvas, Rect, alRight, s);
          END;
      END
    END;

    IF   (ACol > 0) AND (ARow > 2)
    THEN BEGIN
      Coord1This := StrToIntDef(StringGridCoord.Cells[2, ARow],0);
      Coord2Last := StrToIntDef(StringGridCoord.Cells[3, ARow-1],0);

      IF  Coord1This <> Coord2Last
      THEN BEGIN
        IF   Coord1This > Coord2Last
        THEN StringGridCoord.Canvas.Pen.Color := clLime      // gap
        ELSE StringGridCoord.Canvas.Pen.Color := clFuchsia;  // overlap
        StringGridCoord.Canvas.Pen.Width  := 1;
        StringGridCoord.Canvas.MoveTo(Rect.Left,  Rect.Top);
        StringGridCoord.Canvas.LineTo(Rect.Right, Rect.Top);
      END
    END
  END
end;


////  Ratio Data    //////////////////////////////////////////////////////////

PROCEDURE TFormPeaks.LoadRatioWorkbook;
  VAR
    i        :  INTEGER;
    WorkBook :  _WorkBook;
    WorkSheet:  _WorkSheet;
BEGIN
  Screen.Cursor := crHourGlass;
  TRY
    LabelRatioWorkbook.Caption := 'Workbook:  ' + FilenameRatio;

    ExcelApplicationRatio.Connect;
    TRY
      ExcelApplicationRatio.Workbooks.Open(
        FilenameRatio,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, 0);

      // Not sure how this could be 0, but check anyway
      IF   ExcelApplicationRatio.Workbooks.Count > 0
      THEN BEGIN

         ComboBoxRatioWorksheet.Items.Clear;
         WorkBook := ExcelApplicationRatio.Workbooks.Item[1];
         FOR i := 1 TO Workbook.Worksheets.Count DO
         BEGIN
           WorkSheet := WorkBook.Worksheets.Get_Item(i) AS _WorkSheet;
           ComboBoxRatioWorksheet.Items.Add(WorkSheet.Name)
         END;

         IF   Workbook.Worksheets.Count > 0
         THEN BEGIN
           // Pick the last one for ratios
           ComboBoxRatioWorksheet.ItemIndex := Workbook.Worksheets.Count-1;
           LoadRatioWorksheet(-1)
         END
      END

    FINALLY
      ExcelApplicationRatio.Quit;
      ExcelApplicationRatio.Disconnect
    END

  FINALLY
    Screen.Cursor := crDefault
  END

END {LoadRatioWorkbook};


// column is "-1" to automatically select the last column
PROCEDURE TFormPeaks.LoadRatioWorkSheet(CONST column:  INTEGER);
  VAR
    ColumnToRead :  INTEGER;
    index        :  INTEGER;
    j            :  INTEGER;
    Matrix       :  OLEvariant;
    name         :  STRING;
    OK           :  BOOLEAN;
    ratio        :  STRING;
    SheetColCount:  INTEGER;
    SheetRowCount:  INTEGER;
    WorkBook     :  _WorkBook;
    WorkSheet    :  _WorkSheet;
    WorkSheetName:  STRING;
    x            :  Double;
begin
  IF  ComboBoxRatioWorksheet.ItemIndex >= 0
  THEN BEGIN
    // Mark all cells as "Missing" in case left over from previous dataset
    FOR j := 1 TO StringGridCoord.RowCount-1 DO
    BEGIN
      StringGridCoord.Cells[colCoordRatio, j] := 'Missing'
    END;

    WorkSheetName := ComboBoxRatioWorksheet.Items[ComboBoxRatioWorksheet.ItemIndex];

    // Show WorkSheetName in form caption
    FormPeaks.Caption := 'PeakFinder:  ' + WorkSheetName;

    ExcelApplicationRatio.Connect;
    TRY
      ExcelApplicationRatio.Workbooks.Open(
        FilenameRatio,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, 0);
      WorkBook := ExcelApplicationRatio.Workbooks.Item[1];
      WorkSheet := WorkBook.Worksheets.Item[WorkSheetName] AS _WorkSheet;
      WorkSheet.Activate(LCID);

      // To find dimensions of worksheet, activate the last non-empty cell
      WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

      SheetRowCount := ExcelApplicationRatio.ActiveCell.Row;
      SheetColCount := ExcelApplicationRatio.ActiveCell.Column;

      // When the column is negative, set maximum and current value;
      // Otherwise
      IF   column < 0
      THEN BEGIN
        SpinEditRatioColumn.MaxValue := SheetColCount;
        SpinEditRatioColumn.Value    := SheetColCount;

        ColumnToRead := SheetColCount
      END
      ELSE ColumnToRead := column;

      Matrix := ExcelApplicationRatio.Range['A1',
        ExcelApplicationRatio.Cells.Item[SheetRowCount,SheetColCount]].Value;

      OK := (UpperCase(Uppercase(Matrix[1,1])) = UpperCase(RatioHeaderName));

      IF   OK
      THEN BEGIN
        IF   VarType(Matrix[1,ColumnToRead]) <> varError
        THEN LabelRatioName.Caption := VarAsType(Matrix[1,ColumnToRead],varString)
        ELSE LabelRatioName.Caption := '????';
        IF   Length( Trim(LabelRatioName.Caption) ) = 0
        THEN LabelRatioName.Caption := 'Column' + IntToStr(ColumnToRead);

        FOR j := 2 TO SheetRowCount DO
        BEGIN
          name  := Matrix[j,1];
          IF   VarType(Matrix[j,ColumnToRead]) <> varError
          THEN ratio := VarAstype(Matrix[j,ColumnToRead],varString)
          ELSE ratio := 'Error';  // unclear why this error is occuring

          IF   CoordinatesList.Find(name, index)
          THEN BEGIN
            x := StrToFloatDef(ratio, BadValue);
            IF   x = BadValue
            THEN ratio := 'Error'
            ELSE ratio := Format('%.5f', [x]);

            // This may look a bit contorted, but really is simple
            StringGridCoord.Cells[colCoordRatio,
              Integer(CoordinatesList.Objects[index])] := ratio
          END
          ELSE MemoRatioProblems.Lines.Add(IntToStr(j) + '?: ' + Name + ' ' + ratio)
        END;

        DataLoadedRatio := TRUE;
        ButtonProcessAll.Enabled := TRUE
      END
      ELSE BEGIN
        ShowMessage('Column header INAME missing in ratio file');
        DataLoadedRatio := FALSE;
        ButtonProcessAll.Enabled := FALSE
      END

    FINALLY
      ExcelApplicationRatio.Quit;
      ExcelApplicationRatio.Disconnect;
    END;

    UpdateChromosomeFilter;

  END
  ELSE ShowMessage('No Ratio workSheet available')
END {LoadRatioWorkSheet};


procedure TFormPeaks.ButtonLoadRatioClick(Sender: TObject);
  VAR
    Filename :  TFilename;
    IniFile  :  TInifile;
begin
  IF  OpenDialogRatio.Execute
  THEN BEGIN
    FilenameRatio := OpenDialogRatio.Filename;

    IF   FileExists(FilenameRatio)
    THEN BEGIN

      FileName := AppINIFilename(AppDir);
      IniFile := TIniFile.Create(Filename);
      TRY
        IniFile.WriteString('Setup', 'RatioWorkbook', FilenameRatio);
      FINALLY
        IniFile.Free
      END;
      // Flush INI cache
      WritePrivateProfileString(NIL, NIL, NIL, pChar(Filename));

      LoadRatioWorkbook
    END
    ELSE ShowMessage('Cannot find file <' + Filename + '>');
  END
end;

procedure TFormPeaks.ComboBoxRatioWorksheetChange(Sender: TObject);
begin
  LoadRatioWorkSheet(-1)
end;

procedure TFormPeaks.ButtonReloadRatioClick(Sender: TObject);
begin
  LoadRatioWorkSheet(SpinEditRatioColumn.Value)
end;


////  Coordinates + Ratio Data    ////////////////////////////////////////////

PROCEDURE TFormPeaks.UpdateChromosomeFilter;
  CONST
    CarriageReturn = #$0D;  // in case sequence files edited in Windows
    LineFeed       = #$0A;

  VAR
    CountA      :  INTEGER;
    CountC      :  INTEGER;
    CountG      :  INTEGER;
    CountT      :  INTEGER;
    CountOther  :  INTEGER;

    ErrorCount  :  INTEGER;
    Filename    :  STRING;
    count       :  INTEGER;
    i           :  INTEGER;
    MissingCount:  INTEGER;
    ratio       :  Double;
    ReturnCode  :  INTEGER;
    SearchRec   :  TSearchRec;
    s           :  STRING;
    skip        :  INTEGER;
    // Variables for sequence file
    Defline     :  STRING;
    LineCount   :  INTEGER;
begin
  IF   DataLoadedRatio
  THEN BEGIN
    Screen.Cursor := crHourGlass;

    // Read Chromosome sequence if not processing whole genome
    IF  (ComboBoxChromosomeFilter.ItemIndex > 0)
    THEN BEGIN
      // Usual file format:  chrNN*.*
      Filename := ExcludeTrailingBackSlash(EditSequenceDirectory.Text) + '\' +
                  'chr' + Format('%2.2d', [ComboBoxChromosomeFilter.ItemIndex]) + '*.*';
      ReturnCode := FindFirst(Filename, faAnyFile, SearchRec);
      IF   ReturnCode = 0
      THEN LabelSequenceDirectoryComment.Caption := SearchRec.Name;
      FindClose(SearchRec);

      IF   ReturnCode <> 0
      THEN BEGIN
        // Try the other filename format:  chr<Roman>_*.*
        Filename := ExcludeTrailingBackSlash(EditSequenceDirectory.Text) + '\' +
                    'chr' + RomanNumeral(ComboBoxChromosomeFilter.ItemIndex) + '_*.*';
        ReturnCode := FindFirst(Filename, faAnyFile, SearchRec);
        IF   ReturnCode = 0
        THEN LabelSequenceDirectoryComment.Caption := SearchRec.Name;
        FindClose(SearchRec)
      END;

      IF   ReturnCode = 0
      THEN BEGIN
        Filename := ExcludeTrailingBackSlash(EditSequenceDirectory.Text) + '\' +
                    LabelSequenceDirectoryComment.Caption;
        IF   FileExists(Filename)
        THEN BEGIN
          MemoSequence.Lines.Clear;
          NucleotideReadSequence(Filename,
                                 ChromosomeSequence, Defline,
                                 LineCount, ErrorCount);

          CountA := NucleotideCount(ChromosomeSequence, 'A');
          CountT := NucleotideCount(ChromosomeSequence, 'T');
          CountC := NucleotideCount(ChromosomeSequence, 'C');
          CountG := NucleotideCount(ChromosomeSequence, 'G');

          MemoSequence.Lines.Add( 'Total = ' + FormatFloat(',0', Length(ChromosomeSequence) ) );
          MemoSequence.Lines.Add( '    A = ' + FormatFloat(',0', CountA ) );
          MemoSequence.Lines.Add( '    T = ' + FormatFloat(',0', CountT ) );
          MemoSequence.Lines.Add( '    C = ' + FormatFloat(',0', CountC ) );
          MemoSequence.Lines.Add( '    G = ' + FormatFloat(',0', CountG ) );

          CountOther := Length(ChromosomeSequence) - CountA - CountT - CountC - CountG;
          IF   CountOther > 0
          THEN MemoSequence.Lines.Add( 'other = ' + FormatFloat(',0', CountOther ) );

          SpinEditUpdateFrequency.Value := LENGTH(ChromosomeSequence) DIV
                                           (2 * SpinEditTraceCount.Value*ImageMultiRow.Width);

        END
        ELSE BEGIN
          LabelSequenceDirectoryComment.Caption :=
            'Cannot find file sequence file <' + Filename + '>';
          ChromosomeSequence := ''
        END
      END
      ELSE BEGIN
        ChromosomeSequence := '';
        LabelSequenceDirectoryComment.Caption :=
          'Cannot find sequence file for chromosome ' +
          RomanNumeral(ComboBoxChromosomeFilter.ItemIndex)
      END
    END
    ELSE BEGIN
      ChromosomeSequence := '';
      LabelSequenceDirectoryComment.Caption := '';
    END;

    TRY
      // Pass 1:  Find out how many, and hide unwanted rows
      count := 0;
      FOR i := 1 TO StringGridCoord.RowCount-1 DO
      BEGIN
        IF   ComboBoxChromosomeFilter.ItemIndex = 0
        THEN BEGIN
          StringGridCoord.RowHeights[i] := StringGridCoord.DefaultRowHeight;
          INC(count);
        END
        ELSE BEGIN
          IF   ComboBoxChromosomeFilter.ItemIndex = StrToInt(StringGridCoord.Cells[colCoordChromosome, i])
          THEN BEGIN
            StringGridCoord.RowHeights[i] := StringGridCoord.DefaultRowHeight;
            INC(count)
          END
          ELSE StringGridCoord.RowHeights[i] := -1
        END;

        IF   count = 1
        THEN StringGridCoord.Row := i;
      END;

      // Pass2:  Load in-memory arrays for charting
      FeatureCount := Count;

      EditCoord1.Text := '0';

      // Max X-axis for charts
      IF   ComboBoxChromosomeFilter.ItemIndex = 0
      THEN BEGIN
        // Whole Genome
        xMaxChromosome  := Genome.Chromosome[Genome.ChromosomeCount].LastCoordinate;

        // Add enough to make complete horizontal grid interval
        EditCoord2.Text :=
           IntToStr( Genome.Chromosome[Genome.ChromosomeCount].LastCoordinate +
                    Genome.Chromosome[Genome.ChromosomeCount].LastCoordinate MOD
                        (1000*SpinEditHorizontalGrid.Value) )
      END
      ELSE BEGIN
        // Single Chromosome
        EditCoord2.Text :=
             IntToStr(Genome.Chromosome[ComboBoxChromosomeFilter.ItemIndex].PlotLength);
        xMaxChromosome := Genome.Chromosome[ComboBoxChromosomeFilter.ItemIndex].Length;
      END;

      // Chromosome coordinates, except Genome coordinates used for "all chromosomes" selection.
      SetLength(FeatureName, FeatureCount);  // feature name
      SetLength(Coord1,      FeatureCount);  // Xmin
      SetLength(Coord2,      FeatureCount);  // Xmax
      SetLength(DS2Ratio,    FeatureCount);  // Y
      SetLength(MidPoint,    FeatureCount);  // XMidpoint

      count := 0;
      ErrorCount   := 0;
      MissingCount := 0;
      skip  := 0;

      ratioMin :=  1E70;  // normally I'd pick the first point, but with bad
      ratioMax := -1E70;  // data it's trickier to get the first good point

      FOR i := 1 TO StringGridCoord.RowCount-1 DO
      BEGIN
        IF   (ComboBoxChromosomeFilter.ItemIndex = 0) OR
             (ComboBoxChromosomeFilter.ItemIndex = StrToInt(StringGridCoord.Cells[colCoordChromosome, i]))
        THEN BEGIN
          FeatureName[count-skip] := StringGridCoord.Cells[colCoordName ,i];

          IF   ComboBoxChromosomeFilter.ItemIndex = 0
          THEN BEGIN
            Coord1[count-skip]   := StrToInt(StringGridCoord.Cells[colCoordGenome1, i]);
            Coord2[count-skip]   := StrToInt(StringGridCoord.Cells[colCoordGenome2, i]);
            Midpoint[count-skip] := (Coord1[count-skip] + Coord2[count-skip])/2.0;
          END
          ELSE BEGIN
            Coord1[count-skip]   := StrToInt(StringGridCoord.Cells[colCoordChr1, i]);
            Coord2[count-skip]   := StrToInt(StringGridCoord.Cells[colCoordChr2, i]);
            Midpoint[count-skip] := StrToFloat(StringGridCoord.Cells[colCoordChrMidPoint, i]);
          END;

          // Skip over any values with conversion problem
          s := StringGridCoord.Cells[colCoordRatio, i];
          IF  Uppercase(s) = 'ERROR'
          THEN INC(ErrorCount);
          IF  UpperCase(s) = 'MISSING'
          THEN INC(MissingCount);

          ratio := StrToFloatDef(s, BadValue);
          IF   ratio = BadValue
          THEN INC(skip)   // skip causes re-use of current index
          ELSE BEGIN
            DS2Ratio[count-skip] := ratio;
            IF   ratio > ratioMax
            THEN ratioMax := ratio
            ELSE
              IF   ratio < ratioMin
              THEN ratioMin := ratio
          END;

          INC(count);
        END
      END;

      UpdateDisplayRange;

      ASSERT(count = FeatureCount, 'problem assigning chart data');
      FeatureCount := FeatureCount - Skip;

      // Adjust arrays in case some values skipped
      SetLength(FeatureName,  FeatureCount);
      SetLength(Coord1,   FeatureCount);
      SetLength(Coord2,   FeatureCount);
      SetLength(DS2Ratio, FeatureCount);
      SetLength(MidPoint, FeatureCount);

      UniformSpacing;
      PlotValues;

    FINALLY
      Screen.Cursor := crDefault
    END;

    LabelWorksheetRowCount.Caption := 'Rows = ' + IntToStr(count);

    IF   MissingCount = 0
    THEN LabelRatioMissing.Caption := ''
    ELSE LabelRatioMissing.Caption := 'Missing = ' + IntToStr(MissingCount);

    IF   ErrorCount = 0
    THEN LabelRatioError.Caption := ''
    ELSE LabelRatioError.Caption := 'Error = ' + IntToStr(ErrorCount);

    LabelRatioRange.Caption := Format('Ratio = %.3f to %.3f', [ratioMin, ratioMax]);
  END;
END {UpdateChromosomeFilter};


procedure TFormPeaks.ComboBoxChromosomeFilterChange(Sender: TObject);
begin
  IF   ComboBoxChromosomeFilter.ItemIndex = 0
  THEN CHeckBoxPeaks.Checked := FALSE;

  UpdateChromosomeFilter;

  TabSheetPeaks.TabVisible          := (ComboBoxChromosomeFilter.ItemIndex > 0);
  TabSheetUniformSpacing.TabVisible := TabSheetPeaks.TabVisible;
  TabSheetATGC.TabVisible          := TabSheetPeaks.TabVisible;

  CheckBoxContent.Visible := TabSheetPeaks.TabVisible;
end;


////  Uniform Data    ////////////////////////////////////////////////////////

  FUNCTION FirstPast(CONST n, step:  INTEGER):  INTEGER;
  BEGIN
    IF   n MOD step = 0
    THEN FirstPast := n
    ELSE FirstPast := n - (n MOD step) + step
  END {FirstPast};


  FUNCTION LastBefore(CONST n, step:  INTEGER):  INTEGER;
  BEGIN
    IF   n MOD step = 0
    THEN LastBefore := n
    ELSE LastBefore := n - (n MOD step)
  END {LastBefore};


PROCEDURE TFormPeaks.UniformSpacing;
  VAR
    filename :  STRING;
    i        :  INTEGER;
    k        :  INTEGER;
    index1   :  INTEGER;
    index2   :  INTEGER;
    outdata  :  TextFile;
    s        :  STRING;
    xIndex   :  INTEGER;
    xFirst   :  INTEGER;
    xLast    :  INTEGER;
begin
  MemoData.Lines.Clear;
  step := SpinEditStep.Value;

  // Let's assume the range for the "uniform" data is from the "left" side
  // of the first feature to the "right" side of the last feature.  This will
  // be true unless there is overlap.
  xFirst := FirstPast(Coord1[0], step);
  xLast := LastBefore(Coord2[FeatureCount-1], step);
  UniformCount := 1 + (xLast - xFirst) DIV step;

  SetLength(UniformX,  UniformCount);
  SetLength(UniformY,  UniformCount);
  SetLength(stepCount, UniformCount);
  SetLength(FeatureIndex, UniformCount);

  FOR k := 0 TO UniformCount-1 DO
  BEGIN
    UniformX[k]  := XFirst + k*step;  // lazy way to keep track of Xs
    UniformY[k]  := 0;
    stepCount[k] := 0;
    FeatureIndex[k] := -1;
  END;

  MemoData.Lines.Add('N = ' + IntToStr(UniformCount));

  FOR i := 0 TO FeatureCount-1 DO
  BEGIN
    index1 := FirstPast(Coord1[i],  step);
    index2 := LastBefore(Coord2[i], step);

    IF   index1 > index2
    THEN MemoData.Lines.Add('Feature ' + IntToStr(i) + ' from ' +
                            IntToStr(Coord1[i]) + ' to ' +
                            IntToStr(Coord2[i]) + ' (width ' +
                            IntToStr(Coord2[i]-Coord1[i]) +
                            ') skipped with step ' +
                            IntToStr(step));

    FOR k := 0 TO (index2-index1) DIV step DO
    BEGIN
      xIndex := (index1 DIV step) - (XFirst DIV step) + k;
      UniformY[xIndex]  := UniformY[xIndex] + DS2Ratio[i];
      stepCount[xIndex] := stepCount[xIndex] + 1;
      FeatureIndex[xIndex] := i;  // for quick lookups on mouse move events
    END
  END;

  IF   CheckBoxWriteUniform.Checked
  THEN BEGIN
    Filename := IntToStr(Step) + 'step.csv';
    Rewrite(outdata, Filename);
  END;
 
  FOR k := 0 TO UniformCount-1 DO
  BEGIN
    s := Format('%.0f,', [UniformX[k]]);
    IF   stepCount[k] = 0
    THEN BEGIN
      // The gaps are sparse enough that they are effectively ignored
      // by just using the last "Y" value.

      IF   k = 0
      THEN BEGIN
        UniformY[k] := 0;
        FeatureIndex[k] := -1;
        s := s + Format(' %.5f,%.5f,%d,Gap', [UniformY[k],0,FeatureIndex[k]]);
      END
      ELSE BEGIN
        UniformY[k]     := UniformY[k-1];
        FeatureIndex[k] := FeatureIndex[k-1];
        s := s + Format(' %.5f,%.5f,%d,Gap', [UniformY[k],log2(UniformY[k]),FeatureIndex[k]]);
      END;
      MemoData.Lines.Add(s);
    END
    ELSE BEGIN
      UniformY[k] := UniformY[k] / StepCount[k];
      s := s + Format(' %.5f,%.5f,%d', [UniformY[k], log2(UniformY[k]), FeatureIndex[k]]);
    END;
    IF   StepCount[k] > 1
    THEN BEGIN
      s := s + ',Overlap (' + IntToStr(StepCount[k]) + ')';
      MemoData.Lines.Add(s);
    END;

    IF   CheckBoxWriteUniform.Checked
    THEN WRITELN(outdata, s)
  END;

  IF   CheckBoxWriteUniform.Checked
  THEN Closefile(outdata)
END {UniformSpacing};


procedure TFormPeaks.ButtonRecomputeUniformClick(Sender: TObject);
begin
  UniformSpacing
end;


////  PlotValues    //////////////////////////////////////////////////////////

// This program evolved using one pantograph per row in the multi-row graphic,
// and a separate pantograph for the single-row graphic.  Most graphic are
// drawn on all pantographs, but some labeling is only placed on the first
// row of the multi-row graphic, as well as the single-row graphic.
//
// The array of pantographs used to draw the multi-row graphic are not
// really independent -- the share the same Canvas.  The current version
// of the TPantograph has no clipping, so it's possible to draw in to
// neighboring space.


PROCEDURE TFormPeaks.DefineNewPantographs;
  VAR
    k             :  INTEGER;

  PROCEDURE SetupBitmap;
  BEGIN
    // Last pantograph is slightly different and maps to a bitmap in this case
    IF   Assigned(BitmapSingleRow)
    THEN BitmapSingleRow.Free;

    ImageSingleRow.Picture.Graphic := NIL;

    // Create new bitmap with fixed horizontal (base-pair) scaling
    BitmapSingleRow := TBitmap.Create;

    BitmapSingleRow.Height := SpinEditSingleRowHeight.Value;
    BitmapSingleRow.Width  := Round((xMaxPlot-xMinPlot) / SpinEditSingleRowBasesPerPixel.Value);
    BitmapSingleRow.PixelFormat := pf24bit;

    DriverBitmapSingle  := TCanvasDriver.Create(BitmapSingleRow.Width,
                                                BitmapSingleRow.Height,
                                                BitmapSingleRow.Canvas);

    // Map this last pantograph to MetafileSingleRow over the whole range
    Pantograph[PantographCount-1] := TPantograph.Create( DriverBitmapSingle,
                   Rect(0,0,
                        BitmapSingleRow.Width,
                        BitmapSingleRow.Height),
                   RealRect(xMinPlot, yMax,
                            xMaxPlot, yMin) );

    ScrollBarSingleRow.Position := 0;
    PanelSingleRow.Height := BitmapSingleRow.Height;
    ImageSingleRow.Height := BitmapSingleRow.Height;
    IF   BitmapSingleRow.Width < InitialSingleRowWidth
    THEN BEGIN
      ScrollBarSingleRow.Visible := FALSE;
      PanelSingleRow.Width := BitmapSingleRow.Width;
      ImageSingleRow.Width := BitmapSingleRow.Width;
    END
    ELSE BEGIN
      PanelSingleRow.Width := InitialSingleRowWidth;
      ImageSingleRow.Width := BitmapSingleRow.Width;
      ScrollBarSingleRow.Visible := TRUE;
      ScrollBarSingleRow.Max := ImageSingleRow.Width - PanelSingleRow.Width;
    END
  END {SetupBitmap};

  PROCEDURE SetupMetafile;
    VAR
      MetafileHeight:  INTEGER;
      MetafileWidth :  INTEGER;
  BEGIN
    // Last pantograph is slightly different and maps to a Metafile in this case
    IF   Assigned(MetafileSingleRow)
    THEN MetafileSingleRow.Free;

    ImageSingleRow.Picture.Graphic := NIL;

    // Create new bitmap with fixed horizontal (base-pair) scaling
    MetafileSingleRow := TMetafile.Create;
    MetafileSingleRow.Enhanced := TRUE;

    MetafileSingleRow.Inch := 1;  // Unclear why any value >0 OK here

    MetafileHeight := SpinEditSingleRowHeight.Value;
    MetafileWidth :=  Round((xMaxPlot-xMinPlot) / SpinEditSingleRowBasesPerPixel.Value);

    MetafileSingleRow.MMHeight := 100; // 2540 * 34 DIV 30;  // 1 inch high, empircal adjustment
    MetafileSingleRow.MMWidth  :=
      MulDiv(MetafileSingleRow.MMHeight, MetafileWidth, MetafileHeight);

    MetafileSingleRow.Height := MetafileHeight;
    MetafileSingleRow.Width  := MetafileWidth;

    PanelSingleRow.Height := MetafileHeight;
    ImageSingleRow.Height := MetafileHeight;

    ImageSingleRow.Width := MetafileWidth;

    MetafileCanvas := TMetafileCanvas.Create(MetafileSingleRow, 0);
    DriverMetafile := TCanvasDriver.Create(MetafileWidth,
                                           MetafileHeight,
                                           MetafileCanvas);

    // Map this last pantograph to MetafileSingleRow over the whole range
    Pantograph[PantographCount-1] := TPantograph.Create( DriverMetafile,
                   Rect(0,0,
                        MetafileWidth,
                        MetafileHeight),
                   RealRect(xMinPlot, yMax,
                            xMaxPlot, yMin) );

    ScrollBarSingleRow.Position := 0;
    PanelSingleRow.Height := MetafileHeight;
    ImageSingleRow.Height := MetafileHeight;
    IF   MetafileWidth < InitialSingleRowWidth
    THEN BEGIN
      ScrollBarSingleRow.Visible := FALSE;
      PanelSingleRow.Width := MetafileWidth;
    END
    ELSE BEGIN
      PanelSingleRow.Width := InitialSingleRowWidth;
      ScrollBarSingleRow.Visible := TRUE;
      ScrollBarSingleRow.Max := ImageSingleRow.Width - PanelSingleRow.Width;
    END
  END {SetupMetafile};

  PROCEDURE SetupPostscript;
    VAR
      PostscriptWidth      :  INTEGER;
      PostscriptHeight     :  INTEGER;
      PostScriptLogFactor  :  INTEGER;
      PostScriptScaleFactor:  INTEGER;
      TextFactor           :  TReal;
  BEGIN
    PostScriptHeight := SpinEditSingleRowHeight.Value;
    PostScriptWidth  := Round((xMaxPlot-xMinPlot) / SpinEditSingleRowBasesPerPixel.Value);
    PostScriptLogFactor   := 2;  // Resolution will be 0.01
    PostScriptScaleFactor := 100; // 10^PostScriptLogFactor
    TextFactor := 1.2;   // unclear why this isn't 1.0

    DriverPostscript  := TPostscriptDriver.Create(PostscriptWidth*PostScriptScaleFactor,
                                                  PostscriptHeight*PostScriptScaleFactor,
                                                  'Stowers Institute',
                                                  PostscriptLogFactor,
                                                  TextFactor);

    // Map this last pantograph to MetafileSingleRow over the whole range
    Pantograph[PantographCount-1] := TPantograph.Create( DriverPostScript,
                   Rect(0,PostscriptHeight*PostScriptScaleFactor,
                        PostscriptWidth*PostScriptScaleFactor, 0),
                   RealRect(xMinPlot, yMax,
                            xMaxPlot, yMin) );

    ScrollBarSingleRow.Visible := FALSE;
    ImageSingleRow.Picture.Graphic := NIL;

    // Since postscript cannot be directly displayed,
    // create bitmap with message that will be displayed
    IF   Assigned(BitmapSingleRow)
    THEN BitmapSingleRow.Free;

    PanelSingleRow.Width  := 300;
    PanelSingleRow.Height := 60;

    ImageSingleRow.Width  := PanelSingleRow.Width;
    ImageSingleRow.Height := PanelSingleRow.Height;

    BitmapSingleRow := TBitmap.Create;
    BitmapSingleRow.Width  := ImageSingleRow.Width;
    BitmapSingleRow.Height := ImageSingleRow.Height;

    BitmapSingleRow.Canvas.Font.Name := 'Arial';
    BitmapSingleRow.Canvas.Font.Size := 16;
    BitmapSingleRow.Canvas.Font.Color := clBlue;
    BitmapSingleRow.Canvas.TextOut(5,5, 'Save postscript file to disk.');
    BitmapSingleRow.Canvas.TextOut(5,5+BitmapSingleRow.Canvas.TextHeight('X'),
                                   'View in GSView, Illustrator, ...');

  END {SetupPostscript};

BEGIN
  // Add 1 for SingleRow graphic
  PantographCount :=  SpinEditTraceCount.Value + 1;
  SetLength(Pantograph, PantographCount);

  yMax :=  StrToFloat(EditDisplayTo.Text);
  yMin :=  StrToFloat(EditDisplayFrom.Text);

  yIntMax := TRUNC(yMax)-1;
  yIntMin := TRUNC(yMin);

  xMinPlot := StrToFloat(EditCoord1.Text);
  xMaxPlot := StrToFloat(EditCoord2.Text);

  DriverBitmap := TCanvasDriver.Create(BitmapMultiRow.Width, BitmapMultiRow.Height,
                                       BitmapMultiRow.Canvas);
  // Initialize all but last pantograph
  FOR k := 0 TO PantographCount-2 DO
  BEGIN
    //  Consider  PantographCount-1 = 4
    //  k = 0, 1, 2, 3
    //  xRange = 0..1/4, 1/4..2/4, 2/4..3/4, 3/4..4/4
    //  yRange = yMin to yMax

    Pantograph[k] := TPantograph.Create(DriverBitmap,
                       Rect(0,
                            MulDiv(BitmapMultiRow.Height,k,  PantographCount-1),
                            BitmapMultiRow.Width,
                            MulDiv(BitmapMultiRow.Height,k+1,PantographCount-1)),
                       RealRect(xMinPlot +     k*(xMaxPlot - xMinPlot)/(PantographCount-1), yMax,
                                xMinPlot + (k+1)*(xMaxPlot - xMinPlot)/(PantographCount-1), yMin) );
  END;

  // Last pantograph maps to bitmap, metafile or postscript
  CASE RadioGroupSingleRowFormat.ItemIndex OF
    0:  SetupBitmap;
    1:  SetupMetafile;
    2:  SetupPostscript
  END
END {DefineNewPantographs};


PROCEDURE TFormPeaks.GetFeatureName(CONST bps:  Double; VAR FeatureCode, FeatureInfo:  STRING);
  VAR
    indexFeature:  INTEGER;
    indexUniform:  INTEGER;
    iIndex      :  INTEGER;
    iIndex1     :  INTEGER;
    iIndex2     :  INTEGER;
    yRatio      :  Double;
begin
  FeatureCode := '';
  FeatureInfo := '';

  IF   ComboBoxChromosomeFilter.ItemIndex > 0
  THEN BEGIN
    // Index into "Uniform" arrays.  UniformX[0] show starting point.
    indexUniform := ROUND((bps - UniformX[0])/SpinEditStep.Value);

    IF   (indexUniform >= 0) AND (indexUniform < UniformCount)
    THEN BEGIN
      indexFeature := FeatureIndex[indexUniform];
      IF   (indexFeature = -1)
      THEN BEGIN
        FeatureCode := 'GAP';
        FeatureInfo := '';
      END
      ELSE BEGIN
        // indexFeature is the index of the likely feature if there were
        // no overlapping features.  To resolve any overlaps, look upstream
        // and downstream three features and check each one for inclusion.
        // This search will always result in the same order of found features,
        // instead of looking first upstream and then downstream.
        iIndex1 := indexFeature - 3;
        IF   iIndex1 < 0
        THEN iIndex1 := 0;

        iIndex2 := indexFeature + 3;
        IF   iIndex2 > FeatureCount-1
        THEN iIndex2 := FeatureCount-1;

        FOR iIndex := iIndex1 TO iIndex2 DO
        BEGIN
          IF   (Coord1[iIndex] <= ROUND(bps)) AND (ROUND(bps) <= Coord2[iIndex])
          THEN BEGIN
            FeatureCode := FeatureCode + FeatureName[iIndex] + '; ';

            FeatureInfo := FeatureInfo + FeatureName[iIndex];
            FeatureInfo := FeatureInfo + Format(' %d:%d ',
                                          [Coord1[iIndex], Coord2[iIndex]]);

            yRatio := DS2Ratio[iIndex];
            IF   CheckBoxLog2.Checked
            THEN BEGIN
              yRatio := Log2(yRatio);
              FeatureInfo := FeatureInfo + ' (log2ratio = '
            END
            ELSE FeatureInfo := FeatureInfo + ' (ratio = ';
            FeatureInfo := FeatureInfo + Format('%.3f', [yRatio]) + '); '
          END
        END;
        FeatureCode := Trim(FeatureCode);
        FeatureInfo := Trim(FeatureInfo);

        IF  LENGTH(FeatureCode) = 0
        THEN FeatureCode := 'GAP'
        ELSE Delete(FeatureCode,LENGTH(FeatureCode),1);  // get rid of final ';'

      END

    END
  END
END {GetFeatureName};


// Needed whenever chromosome is changed, or when log selection is changed.
PROCEDURE TFormPeaks.UpdateDisplayRange;
BEGIN
  IF   CheckBoxAutoScaleRatio.Checked
  THEN BEGIN
    IF   CheckBoxLog2.Checked
    THEN BEGIN
      LabelDisplayRatio1.Caption := 'Log Ratio from';

      IF   ratioMax > 2
      THEN BEGIN
        EditDisplayFrom.Text := Format('%.2f',
                                [ 0.25*TRUNC( (Log2(ratioMin)-0.25)/0.25 ) ]);
        EditDisplayTo.Text   := Format('%.2f',
                                [ 0.25*TRUNC( (Log2(ratioMax)+0.25)/0.25) ]);
      END
      ELSE BEGIN
        IF   ratioMin < 0.001
        THEN EditDisplayFrom.Text := '-10.0'  // fairly small in log space
        ELSE EditDisplayFrom.Text := Format('%.2f', [ratioMin]);

        IF   ratioMax < 1
        THEN EditDisplayTo.Text := '1.0'
        ELSE EditDisplayTo.Text  := Format('%.2f', [ratioMax]);
      END
    END
    ELSE BEGIN
      LabelDisplayRatio1.Caption := 'Ratio from';
      EditDisplayFrom.Text := '0.00';
      EditDisplayTo.Text   := Format('%.2f', [ratioMax]);
    END
  END
END {UpdateDisplayRange};


procedure TFormPeaks.PlotValues;
  VAR
   ClipboardData   :  THandle;
   ClipboardFormat :  WORD;
   ClipboardPalette:  hPalette;
   SmoothCount     :  INTEGER;
   xSmooth         :  ARRAY OF Double;
   ySmooth         :  ARRAY OF Double;


  // Find the left and right "tails" of the smoothed peak.
  PROCEDURE CalcSmoothedPeakStats(CONST ySmoothDelta:  ARRAY OF DOUBLE;
                                  CONST iSmoothPeak:  INTEGER;
                                  VAR iSmoothLeft, iSmoothRight:  INTEGER);

    VAR
      i      :  INTEGER;
      sliding:  BOOLEAN;
  BEGIN
    // Left Tail:  Starting at the peak, all points to the left are "down hill"
    // but have a positive slope (i.e., positive ySmoothDelta value).  Let's
    // slide down the slope until we find an upslope (i.e., segment with negative
    // ySmoothDelta value).

    sliding := TRUE;
    i := iSmoothPeak-1;
    WHILE (i > Low(ySmoothDelta)) AND sliding DO
    BEGIN
      DEC(i);
      sliding := (ySmoothDelta[i] >= 0);
    END;
    // Because we're working with deltas, keep the i-th point as the smallest
    // instead of going back to point i+1.
    iSmoothLeft := i;

    // Right Tail:  "slide" down "negative" slope until we find an upslope
    sliding := TRUE;
    i := iSmoothPeak+1;
    WHILE (i < High(ySmoothDelta)) AND sliding DO
    BEGIN
      INC(i);
      sliding := (ySmoothDelta[i] <= 0);
    END;
    iSmoothRight := i;

  END {CalcPeakStats};


  PROCEDURE CalcRawPeakStats(CONST UniformY:  ARRAY OF DOUBLE;
                             CONST iSmoothLeft, iSmoothRight:  INTEGER;
                             VAR iLeft,iRight, iPeak:  INTEGER);
    VAR
      i   :  INTEGER;
  BEGIN
    // Find "raw" (non-smoothed) peak in range where smoothed peak was found
    iPeak := iSmoothLeft;
    FOR i := iSmoothLeft+1 TO iSmoothRight DO
    BEGIN
      IF   UniformY[i] > UniformY[iPeak]
      THEN iPeak := i
    END;

    // Extend left tail if "raw" data continues dropping
    iLeft := iSmoothLeft;
    WHILE (iLeft > Low(UniformY)+1) AND (UniformY[iLeft-1] < UniformY[iLeft]) DO
    BEGIN
      DEC(iLeft);
    END;

    // Extend right tail if "raw" data continues dropping
    iRight := iSmoothRight;
    WHILE (iRight < High(UniformY)-1) AND (UniformY[iRight] > UniformY[iRight+1]) DO
    BEGIN
      INC(iRight);
    END
  END {CalcRawPeakStats};


  // Plot horizontal grid lines including numeric labels.
  // Optionally, plot vertical grid lines.
  PROCEDURE PlotGridlines;
    VAR
      i     :  INTEGER;
      k     :  INTEGER;
      m     :  INTEGER;
      x     :  TReal;
      xStep :  INTEGER;
  BEGIN
    BitmapMultiRow.Canvas.Pen.Color := clSilver;  // grid
    // Draw horizontal grid lines
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
      // minor visual break between traces:
      // don't bother with first in multiple-row, and not
      // needed for single-row
      IF   (k > 0) AND (k < PantographCount-1)
      THEN BEGIN
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),2);
        PantoGraph[k].MoveTo(xMinPlot, yMax);
        PantoGraph[k].LineTo(xMaxPlot, yMax);
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
      END;

      FOR m := yIntMin TO yIntMax DO
      BEGIN
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        IF   m = 0
        THEN PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1)
        ELSE PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clGray),1);

        PantoGraph[k].MoveTo(xMinPlot, m);
        PantoGraph[k].LineTo(xMaxPlot, m);
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
        IF   k = PantographCount-1
        THEN x := xMinPlot
        ELSE x := xMinPlot + k * (xMaxPlot-xMinPlot) / (PantographCount-1);

        PantoGraph[k].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
        PantoGraph[k].TextOut(x, m, ' ' + IntToStr(m) );
      END;

      // Vertical Lines every specified K base pairs
      xStep := 1000 * SpinEditHorizontalGrid.Value;
      IF   xStep > 0.0
      THEN BEGIN
        PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clSilver),1);
        FOR i := Round(xMinPlot / xStep) TO TRUNC(xMaxPlot / xStep) DO
        BEGIN
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        PantoGraph[k].MoveTo(xStep*i, yMin);
        PantoGraph[k].LineTo(xStep*i, yMax);
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
        END
      END
    END
  END {PlotGridlines};


  PROCEDURE PlotRatioLine;
    VAR
      count:  INTEGER;
      k    :  INTEGER;
      m    :  INTEGER;
      y    :  Double;
  BEGIN
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
      PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);
{$IFDEF POSTSCRIPT}
        // KLUDGE FIX FOR POSTSCRIPT
        Pantograph[k].GraphicsDriver.Control('0.5 setlinewidth');
{$ENDIF}

      count := 0;
      FOR m := 0 TO FeatureCount-1 DO
      BEGIN

        IF   (MidPoint[m] >= xMinPlot) AND
             (MidPoint[m] <= xMaxPlot)
        THEN BEGIN
          y := DS2Ratio[m];
          IF   CheckBoxLog2.Checked
          THEN y := Log2(y);

          IF   count = 0
          THEN BEGIN
{$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
            PantoGraph[k].MoveTo(MidPoint[m], y);
          END
          ELSE PantoGraph[k].LineTo(MidPoint[m], y);

          INC(count)
        END
      END;

{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
    END
  END {PlotRatioLine};


  PROCEDURE PlotUniformlySpacedData;
    VAR
      count:  INTEGER;
      k    :  INTEGER;
      m    :  INTEGER;
      y    :  Double;
  BEGIN
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
      PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clAqua),1);

      count := 0;
      FOR m := 0 TO UniformCount-1 DO
      BEGIN

        IF   (UniformX[m] >= xMinPlot) AND
             (UniformX[m] <= xMaxPlot)
        THEN BEGIN

          y := UniformY[m];
          IF   CheckBoxLog2.Checked
          THEN y := Log2(y);

          IF   count = 0
          THEN BEGIN
{$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
            PantoGraph[k].MoveTo(UniformX[m], y)
          END
          ELSE PantoGraph[k].LineTo(UniformX[m], y);

          INC(count)
        END
      END;

{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}

    END
  END {PlotUniformlySpacedData};


  PROCEDURE SmoothDataAndPlot;
    VAR
      count:  INTEGER;
      k    :  INTEGER;
      m    :  INTEGER;
      y    :  Double;
  BEGIN
    // Create smoothed data whether directly displayed or not.  Smoothed
    // data possibly used even if not displayed.

    IF   RadioButtonUniformData.Checked
    THEN BEGIN
      // Bin Data:  UniformX, UniformY
      SmoothCount := UniformCount;
      SetLength(ySmooth, SmoothCount);
      SetLength(xSmooth, SmoothCount);

      // Select y or Log2(y) values.  Use separate copy since Smooth
      // clobbers the original array.
      FOR k := 0 TO SmoothCount-1 DO
      BEGIN
        y := UniformY[k];
        IF   CheckBoxLog2.Checked
        THEN y := Log2(y);

        ySmooth[k] := y;
        xSmooth[k] := UniformX[k];
      END;
    END
    ELSE BEGIN
      // Raw Data:  MidPoint, DS2Ratio
      SmoothCount := FeatureCount;
      SetLength(ySmooth, SmoothCount);
      SetLength(xSmooth, SmoothCount);

      // Select y or Log2(y) values.  Use separate copy since Smooth
      // clobbers the original array.
      FOR k := 0 TO SmoothCount-1 DO
      BEGIN
        y := DS2Ratio[k];
        IF   CheckBoxLog2.Checked
        THEN y := Log2(y);

        ySmooth[k] := y;
        xSmooth[k] := MidPoint[k];
      END;

    END;

    IF   CheckBoxGaussian.Checked
    THEN GaussianSmooth(ySmooth, SpinEditSmoothHalfRange.Value, SpinEditSmoothRounds.Value)
    ELSE Smooth        (ySmooth, SpinEditSmoothHalfRange.Value, SpinEditSmoothRounds.Value);

    IF   CheckBoxSmooth.Checked
    THEN BEGIN

      FOR k := 0 TO PantographCount-1 DO
      BEGIN
        // This is a bit of a kludge:  For single-row plot don't use wider line
        IF   k = PantographCount-1
        THEN PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clGreen),1)
        ELSE PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clGreen),2);
{$IFDEF POSTSCRIPT}
        // KLUDGE FIX FOR POSTSCRIPT
        Pantograph[k].GraphicsDriver.Control('0.50 setlinewidth');
{$ENDIF}

        count := 0;
        FOR m := 0 TO SmoothCount-1 DO
        BEGIN
          IF   (xSmooth[m] >= xMinPlot) AND
               (xSmooth[m] <= xMaxPlot)
          THEN BEGIN

            IF   count = 0
            THEN BEGIN
  {$IFDEF POSTSCRIPT}
              Pantograph[k].GraphicsDriver.Control(psNewPath);
  {$ENDIF}
              PantoGraph[k].MoveTo(xSmooth[m], ySmooth[m]);
            END
            ELSE PantoGraph[k].LineTo(xSmooth[m], ySmooth[m]);

            INC(count)
          END
        END;
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
      END
    END
  END {SmoothDataAndPlot};


  PROCEDURE PlotPeakLabels;
    VAR
      FeatureCode   :  STRING;
      FeatureInfo   :  STRING;
      iLeft         :  INTEGER;
      iPeak         :  INTEGER;
      iRight        :  INTEGER;
      iSmoothLeft   :  INTEGER;
      iSmoothRight  :  INTEGER;
      k             :  INTEGER;
      m             :  INTEGER;
      Radius        :  Double;
      s             :  STRING;
      x             :  Double;
      y             :  Double;
      yPeakRaw      :  Double;
      ySmoothDelta  :  ARRAY OF Double;
      yThreshold    :  Double;
  BEGIN
    // Keep two rows since keeping only one creates a problem.
    StringGridPeaks.RowCount := 2;

    // Blank the second row
    FOR k := 1 TO PeakColumnCount DO
    BEGIN
      StringGridPeaks.Cells[k,1] := ''
    END;

    SetLength(ySmoothDelta, High(ySmooth)-Low(ySmooth)+1);

    ySmoothDelta[0] := 0.0;
    FOR m := Low(ySmooth)+1 TO High(ySmooth) DO
    BEGIN
      ySmoothDelta[m] := ySmooth[m] - ySmooth[m-1];
    END;

    peakCount := 0;
    yThreshold := SpinEditThreshold.Value / 1000;

    FOR m := Low(ySmoothDelta)+2 TO High(ySmoothDelta)-1 DO
    BEGIN
      // Look for peaks anywhere for now
      IF   (ySmoothDelta[m+1] <  0.0) AND
           (ySmoothDelta[m]   <  0.0) AND
           (ySmoothDelta[m-1] >= 0.0) AND
           (ySmoothDelta[m-2] >= 0.0)
      THEN BEGIN
        // Point m is actually 1 past the peak.
        CalcSmoothedPeakStats(ySmoothDelta, m, iSmoothLeft, iSmoothRight);

        IF   RadioButtonUniformData.Checked
        THEN x := UniformX[m]
        ELSE x := MidPoint[m];

        y := ySmooth[m];

        IF  (ABS(y-ySmooth[iSmoothLeft])  < (SpinEditMinSmoothLeftDelta.Value  / 1000)) OR
            (ABS(y-ySmooth[iSmoothRight]) < (SpinEditMinSmoothRightDelta.Value / 1000))
        THEN BEGIN
          MemoPeaks.Lines.Add('Ignoring Peak (LeftDeltaSmooth, RightDeltaSmooth) = (' +
                              Format('%.0f', [x]) + ', ' + Format('%.3f', [y]) + ')')
        END
        ELSE BEGIN
          // plot peak

          IF   RadioButtonUniformData.Checked
          THEN BEGIN
            CalcRawPeakStats(UniformY, iSmoothLeft, iSmoothRight, iLeft,iRight, iPeak);
            yPeakRaw := UniformY[iPeak]
          END
          ELSE BEGIN
            CalcRawPeakStats(DS2Ratio, iSmoothLeft, iSmoothRight, iLeft,iRight, iPeak);
            yPeakRaw := DS2Ratio[iPeak]
          END;

          IF   CheckBoxLog2.Checked
          THEN yPeakRaw := Log2(yPeakRaw);

          IF   yPeakRaw > yThreshold
          THEN BEGIN

            INC(peakCount);
            StringGridPeaks.Cells[ 1,PeakCount] := IntToStr(PeakCount);

            StringGridPeaks.Cells[ 2,PeakCount] := Format('%.0f', [x]);
            IF   RadioButtonUniformData.Checked
            THEN BEGIN
              StringGridPeaks.Cells[ 3,PeakCount] := Format('%.0f', [x-UniformX[iSmoothLeft]]);
              StringGridPeaks.Cells[ 4,PeakCount] := Format('%.0f', [UniformX[iSmoothRight]-x]);

              IF    ComboBoxChromosomeFilter.ItemIndex = 0
              THEN  StringGridPeaks.Cells[8,PeakCount] := ''
              ELSE BEGIN
                GetFeatureName(UniformX[iPeak], FeatureCode, FeatureInfo);
                IF   POS(';', FeatureCode) = 0
                THEN StringGridPeaks.Cells[8,PeakCount] := FeatureCode
                ELSE StringGridPeaks.Cells[8,PeakCount] := FeatureInfo
              END;

              StringGridPeaks.Cells[ 9,PeakCount] := Format('%.0f', [UniformX[iPeak]]);    // "X"

              StringGridPeaks.Cells[10,PeakCount] := Format('%.0f', [UniformX[iPeak]  - UniformX[iLeft]]);
              StringGridPeaks.Cells[11,PeakCount] := Format('%.0f', [UniformX[iRight] - UniformX[iPeak]]);

              IF   CheckBoxLog2.Checked
              THEN BEGIN
                StringGridPeaks.Cells[12,PeakCount] := Format('%.3f', [Log2(UniformY[iPeak])]);
                StringGridPeaks.Cells[13,PeakCount] := Format('%.3f',
                                                       [Log2(UniformY[iPeak])  - Log2(UniformY[iLeft ])] );
                StringGridPeaks.Cells[14,PeakCount] := Format('%.3f',
                                                       [Log2(UniformY[iPeak])  - Log2(UniformY[iRight])] )
              END
              ELSE BEGIN
                StringGridPeaks.Cells[12,PeakCount] := Format('%.3f', [UniformY[iPeak]]);
                StringGridPeaks.Cells[13,PeakCount] := Format('%.3f',
                                                       [UniformY[iPeak]  - UniformY[iLeft ]] );
                StringGridPeaks.Cells[14,PeakCount] := Format('%.3f',
                                                       [UniformY[iPeak]  - UniformY[iRight]] )
              END
            END
            ELSE BEGIN
              StringGridPeaks.Cells[ 3,PeakCount] := Format('%.0f', [x-MidPoint[iSmoothLeft]]);
              StringGridPeaks.Cells[ 4,PeakCount] := Format('%.0f', [MidPoint[iSmoothRight]-x]);

              IF    ComboBoxChromosomeFilter.ItemIndex = 0
              THEN  StringGridPeaks.Cells[8,PeakCount] := ''
              ELSE BEGIN
                GetFeatureName(MidPoint[iPeak], FeatureCode, FeatureInfo);
                StringGridPeaks.Cells[8,PeakCount] := FeatureCode
              END;

              StringGridPeaks.Cells[ 9,PeakCount] := Format('%.0f', [MidPoint[iPeak]]);   // "X"

              StringGridPeaks.Cells[10,PeakCount] := Format('%.0f', [MidPoint[iPeak]  - MidPoint[iLeft]]);
              StringGridPeaks.Cells[11,PeakCount] := Format('%.0f', [MidPoint[iRight] - MidPoint[iPeak]]);

              IF   CheckBoxLog2.Checked
              THEN BEGIN
                StringGridPeaks.Cells[12,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]]);
                StringGridPeaks.Cells[13,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]  - DS2Ratio[iLeft ]] );
                StringGridPeaks.Cells[14,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]  - DS2Ratio[iRight]] )
              END
              ELSE BEGIN
                StringGridPeaks.Cells[12,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]]);
                StringGridPeaks.Cells[13,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]  - DS2Ratio[iLeft ]] );
                StringGridPeaks.Cells[14,PeakCount] := Format('%.3f', [DS2Ratio[iPeak]  - DS2Ratio[iRight]] )
              END
            END;

            StringGridPeaks.Cells[ 5,PeakCount] := Format('%.3f', [y]);
            StringGridPeaks.Cells[ 6,PeakCount] := Format('%.3f', [y-ySmooth[iSmoothLeft]]);
            StringGridPeaks.Cells[ 7,PeakCount] := Format('%.3f', [y-ySmooth[iSmoothRight]]);

            StringGridPeaks.RowCount := StringGridPeaks.RowCount + 1;

            IF   RadioButtonUniformData.Checked
            THEN BEGIN
              x := UniformX[iPeak];
              y := UniformY[iPeak]
            END
            ELSE BEGIN
              x := MidPoint[iPeak];
              y := DS2Ratio[iPeak]
            END;

            IF   CheckBoxShowRatio.Checked
            THEN BEGIN
              IF   CheckBoxLog2.Checked
              THEN y := Log2(y)
            END
            ELSE BEGIN
              y := ySmooth[m];
            END;

            // Count all the peaks so numbers will be same no matter what
            // the limits, but only plot ones in this desired range
            IF   (x >= xMinPlot) AND
                 (x <= xMaxPlot)
            THEN BEGIN

              FOR k := 0 TO PantographCount-1 DO
              BEGIN
  {$IFDEF POSTSCRIPT}
                Pantograph[k].GraphicsDriver.Control(psNewPath);
  {$ENDIF}
                PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clYellow),1);

                // Need to resolve this difference between Windows and Postscript.
                // This line does nothing in Postscript.
                PantoGraph[k].GraphicsDriver.SetBrush(ColorToRealColor(clYellow));

                // The yPercentDelta adjustment here is to align the circles
                // with the text a little better.  Use yPercentDelta since that
                // is more constant across the chromosomes in a genome than
                // the length of a chromosome.

                // Adjust radius to be about the same regardless of number of
                // trace rows.
                IF   k <> PantographCount - 1
                THEN BEGIN
                  Radius :=  PantoGraph[k].yPercentDelta(SPinEditTraceCount.Value);
                  // 0.75*Radius is KLUDGE adjustment
                  PantoGraph[k].Circle(x,y+0.75*Radius, Radius);
                END
                ELSE BEGIN
                  // KLUDGE adjustment for single-row
                  Radius :=  PantoGraph[k].yPercentDelta(3.0);
                  PantoGraph[k].Circle(x,y+Radius, Radius);
                END;

  {$IFDEF POSTSCRIPT}
                Pantograph[k].GraphicsDriver.Control(psFill);
                Pantograph[k].GraphicsDriver.Control(psStroke);
  {$ENDIF}

                s := IntToStr(peakCount);
                PantoGraph[k].GraphicsDriver.SetTransparency(transparencyOn);
                PantoGraph[k].GraphicsDriver.SetFont('Arial',10, ColorToRealColor(clBlue));
                PantoGraph[k].TextOut(x,y, s, textCenter);
              END
            END

          END
          ELSE BEGIN
            MemoPeaks.Lines.Add('Ignoring Peak (below threshold) = (' +
                              Format('%.0f', [x]) + ', ' + Format('%.3f', [y]) + ')')
          END

        END

      END

    END;

    StringGridPeaks.RowCount := StringGridPeaks.RowCount - 1;
  END {PlotPeakLabels};


  PROCEDURE PlotWatsonCrickIntergenicFeatures;
    VAR
      i1       :  INTEGER;
      i2       :  INTEGER;
      j1       :  INTEGER;
      j2       :  INTEGER;
      jDelta   :  INTEGER;
      LineColor:  TColor;
      k        :  INTEGER;
      m        :  INTEGER;
      x        :  TReal;
      y        :  TReal;
  BEGIN
    // Draw width of segment
    FOR m := 0 TO FeatureCount-1 DO
    BEGIN
      LineColor := FeatureColor( FeatureName[m] );

      // Draw feature if midpoint within plotting range
      x := MidPoint[m];
      IF   (x >= xMinPlot) AND
           (x <= xMaxPlot)
      THEN BEGIN

        FOR k := 0 TO PantographCount-1 DO
        BEGIN
          PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(LineColor),1);

          // Draw ratio value
          y := DS2Ratio[m];
          IF  y > 0.0
          THEN BEGIN
            IF   CheckBoxLog2.Checked
            THEN y := Log2(y);

            Pantograph[k].MapWorldToCanvas(Coord1[m], y, i1,j1);
            Pantograph[k].MapWorldToCanvas(Coord2[m], y, i2,j2);
            jDelta := MulDiv(i2-i1, 20, 100);

{$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psNewPath);
            PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(LineColor),1);
{$ENDIF}

            // Draw one-sided arrows
            IF   LineColor = colorWatson
            THEN BEGIN
              // forward orientation

              // draw in device space to avoid dealing with anisotropic dimensions
              PantoGraph[k].GraphicsDriver.MoveTo(i1,j1);
              PantoGraph[k].GraphicsDriver.LineTo(i2,j2);
              PantoGraph[k].GraphicsDriver.LineTo(i2-jDelta, j2-jDelta);
{$IFDEF POSTSCRIPT}
              Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
            END
            ELSE BEGIN
              IF   LineColor = colorCrick
              THEN BEGIN
                // reverse orientation
{$IFDEF POSTSCRIPT}
                Pantograph[k].GraphicsDriver.Control(psNewPath);
                PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(LineColor),1);
{$ENDIF}
                PantoGraph[k].GraphicsDriver.MoveTo(i2,j2);
                PantoGraph[k].GraphicsDriver.LineTo(i1,j1);
                PantoGraph[k].GraphicsDriver.LineTo(i1+jDelta, j2+jDelta);
{$IFDEF POSTSCRIPT}
              Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
              END
              ELSE BEGIN
                // simple line, no arrow
{$IFDEF POSTSCRIPT}
                Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
                PantoGraph[k].GraphicsDriver.MoveTo(i1,j1);
                PantoGraph[k].GraphicsDriver.LineTo(i2,j2);
{$IFDEF POSTSCRIPT}
                Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
              END
            END
          END

        END

      END
    END
  END {PlotWatsonCrickIntergenicFeatures};


  PROCEDURE PlotGapOverlapBaseline;
    VAR
      k:  INTEGER;
      m:  INTEGER;
      y:  Double;
  BEGIN
    // Draw gap/overlap "time line"
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
      // position of "time line"
      y := yMax - 0.02*(yMax - yMin);

      FOR m := 1 TO FeatureCount-1 DO
      BEGIN
        IF   (Coord1[m] >= xMinPlot) AND
             (Coord1[m] <= xMaxPlot) AND
             (Coord2[m] >= xMinPlot) AND
             (Coord2[m] <= xMaxPlot)
        THEN BEGIN

          IF   Coord1[m] < Coord2[m-1]
          THEN BEGIN
            // Overlap
  {$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psNewPath);
  {$ENDIF}
            PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clFuchsia),1);  // overlap
            PantoGraph[k].MoveTo(Coord1[m], y);
            PantoGraph[k].LineTo(Coord2[m-1], y);
  {$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psStroke);
  {$ENDIF}
          END
          ELSE BEGIN
            // Check for gap
            IF   Coord1[m] > Coord2[m-1]
            THEN BEGIN

  {$IFDEF POSTSCRIPT}
              Pantograph[k].GraphicsDriver.Control(psNewPath);
  {$ENDIF}
              PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clLime),1);  // gap
              PantoGraph[k].MoveTo(Coord2[m-1], y);
              PantoGraph[k].LineTo(Coord1[m], y);
  {$IFDEF POSTSCRIPT}
              Pantograph[k].GraphicsDriver.Control(psStroke);
  {$ENDIF}
            END

          END

        END

      END
    END
  END {ShowGapOverlapBaseline};


  PROCEDURE PlotVerticalTickMarks;
    VAR
      k     :  INTEGER;
      m     :  INTEGER;
      n     :  INTEGER;
      x     :  Double;
      xDelta:  Double;
      XLabel:  STRING;
      yDelta:  Double;
  BEGIN
     // Draw vertical tick marks
    FOR n := 1 TO 7 DO
    BEGIN
      // For now, don't draw tick marks on single-row chart; use only
      // horizontal grid of specified width instead
      FOR k := 0 TO PantographCount-2 DO
      BEGIN
        IF   n MOD 2 = 0
        THEN yDelta := Pantograph[k].yPercentDelta(2)
        ELSE yDelta := Pantograph[k].yPercentDelta(1);

        PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);

        x := xMinPlot + k * (xMaxPlot - xMinPlot)/(PantographCount-1);
        xDelta := ((xMaxPlot - xMinPlot)/(PantographCount-1)) * n / 8;
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        PantoGraph[k].MoveTo(x+xDelta, 0);
        PantoGraph[k].LineTo(x+xDelta, yDelta);
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
        PantoGraph[k].GraphicsDriver.SetTransparency(transparencyOn);

        IF  n MOD 2 = 0
        THEN BEGIN
          PantoGraph[k].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
          xLabel := Format('%.0f', [x+xDelta]);
          PantoGraph[k].TextOut(x+xDelta, yDelta, xLabel, textCenter)
        END
      END
    END;

    // Show Starting line for each chromosome when whole genome is plotted
    IF   ComboBoxChromosomeFilter.ItemIndex = 0
    THEN BEGIN
      xDelta := 1000 * SpinEditHorizontalGrid.Value / 4;
      yDelta := 0.10*(yMax - yMin);

       // Draw horizontal grid lines
      FOR k := 0 TO PantographCount-1 DO
      BEGIN
        PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clRed),2);
        // Beginning line for each chromosome
        FOR m := 1 TO Genome.ChromosomeCount DO
        BEGIN
          x := Genome.Chromosome[m].FirstCoordinate;
{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
          PantoGraph[k].MoveTo(x, yMin);
          PantoGraph[k].LineTo(x, yMax);
{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
          PantoGraph[k].GraphicsDriver.SetFont('Arial',16, ColorToRealColor(clRed));
          PantoGraph[k].GraphicsDriver.SetTransparency(transparencyOn);
          PantoGraph[k].TextOut(x+xDelta, yMax-yDelta, RomanNumeral(m));
        END;

        // Ending line for last chromosome
         x := Genome.Chromosome[Genome.ChromosomeCount].FirstCoordinate +
              Genome.Chromosome[Genome.ChromosomeCount].Length;
{$IFDEF POSTSCRIPT}
         Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
         PantoGraph[k].MoveTo(x, yMin);
         PantoGraph[k].LineTo(x, yMax);
{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
      END

    END
  END {PlotVerticalTickMarks};

  // Originally a Pen Size=9 was used to draw centrometer location. This didn't
  // work in Postscript, so a simple circle was used instead.
  PROCEDURE PlotCentromereLocation;
    VAR
      CentromereA:  INTEGER;
      CentromereB:  INTEGER;
      k           :  INTEGER;
      m           :  INTEGER;
      x           :  Double;
      xCentromere :  Double;
  BEGIN
    // Show centromere location(s)
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
{$IFDEF POSTSCRIPT}
      Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
      PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);    // Postscript
      PantoGraph[k].GraphicsDriver.SetBrush(ColorToRealColor(clBlack));   // Windows

      // Plot all for ItemIndex = 0
      IF   ComboBoxChromosomeFilter.ItemIndex = 0
      THEN BEGIN
        FOR m := 1 TO Genome.ChromosomeCount DO
        BEGIN
          x := Genome.Chromosome[m].FirstCoordinate;
          CentromereA := Genome.Chromosome[m].CentromereStart;
          CentromereB := Genome.Chromosome[m].CentromereEnd;

          xCentromere := x + 0.5*(CentromereA + CentromereB);

          IF   (xCentromere >= xMinPlot) AND
               (xCentromere <= xMaxPlot)
          THEN BEGIN
            PantoGraph[k].Circle(xCentromere,0.0,
                                 PantoGraph[k].yPercentDelta(1.5));
{$IFDEF POSTSCRIPT}
            Pantograph[k].GraphicsDriver.Control(psFill);
            Pantograph[k].GraphicsDriver.Control(psStroke)
          END
{$ENDIF}
        END
      END
      ELSE BEGIN
        CentromereA := Genome.Chromosome[ComboBoxChromosomeFilter.ItemIndex].CentromereStart;
        CentromereB := Genome.Chromosome[ComboBoxChromosomeFilter.ItemIndex].CentromereEnd;

        xCentromere := 0.5*(CentromereA + CentromereB);
        IF   (xCentromere >= xMinPlot) AND
             (xCentromere <= xMaxPlot)
        THEN BEGIN

{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
          PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);    // Postscript
          PantoGraph[k].GraphicsDriver.SetBrush(ColorToRealColor(clBlack));   // Windows

          PantoGraph[k].Circle(xCentromere,0.0,
                               PantoGraph[k].yPercentDelta(2.0));
{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psFill);
          Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
          PantoGraph[k].GraphicsDriver.SetBrush(ColorToRealColor(clWhite));   // Windows
        END

      END;

      PantoGraph[k].GraphicsDriver.SetBrush(ColorToRealColor(clWhite));   // Windows
    END;

  END {PlotCentromereLocation};


  PROCEDURE PlotNucleotideContent;
    VAR
      Frequency:  INTEGER;
      j        :  INTEGER;
      k        :  INTEGER;
      TickDelta:  INTEGER;
      TickLabel:  INTEGER;
      x1, x2   :  TReal;

    PROCEDURE SetupPantograph(CONST index:  INTEGER);
      VAR
        s:  STRING;
        x:  TReal;
        y:  TReal;

      // "Helper" routine to Helper routine:  plot single trace label
      PROCEDURE DrawLabel(VAR   x:  Double;
                          CONST y:  Double;
                          CONST CheckBox:  TCheckBox;
                          CONST xDeltaPercent:  Double);
      BEGIN
        IF   CheckBox.Checked
        THEN BEGIN
          Pantograph[index].GraphicsDriver.SetFont('Arial', 12, ColorToRealColor(CheckBox.Font.Color));
          Pantograph[index].TextOutPercent(x, // Pantograph[k].xPercent(x),
                                       y, // Pantograph[k].yPercent(y),
                                       CheckBox.Caption, textRight);
          x := x + xDeltaPercent
        END
      END {DrawLabel};

    BEGIN
      // Label "Content" on right side
      s := 'Content(' + IntToStr(SpinEditSlidingWindow.Value) + ' kb window)';

      PantoGraph[index].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
      PantoGraph[index].TextOut(PantoGraph[index].xPercent(100) - 1000,
//                      98.0,
                      PantoGraph[index].yPercent(94),
                      s, textRight);

      // Show color code for content curves -- decide from right to left
      // since working on right margin

      x := 98.0;
      y := 88.0;
      DrawLabel(x,y, CheckBoxContentC, -2);
      DrawLabel(x,y, CheckBoxContentG, -2);
      DrawLabel(x,y, CheckBoxContentT, -2);
      DrawLabel(x,y, CheckBoxContentA, -2);

      DrawLabel(x,y, CheckBoxContentGC, -3);
      DrawLabel(x,y, CheckBoxContentAT, -3);
    END {SetupPantograph};

    // "Helper" routine: Plot single content trace
    PROCEDURE Consider (CONST CheckBox:  TCheckBox; CONST target:  STRING);
    BEGIN
      IF   CheckBox.Checked
      THEN BEGIN
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        Pantograph[k].GraphicsDriver.SetPen(ColorToRealColor(CheckBox.Font.Color), 1);
{$IFDEF POSTSCRIPT}
        // KLUDGE FIX FOR POSTSCRIPT
        Pantograph[k].GraphicsDriver.Control('0.50 setlinewidth');
{$ENDIF}
        NucleotidePlot(Pantograph[k], ChromosomeSequence, target,
                       SlidingWindow, Frequency,
                       xMinPlot, xMaxPlot);
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF POSTSCRIPT}
      END
    END {Consider};

  BEGIN
    SetupPantograph(0);                  // multi-row image
    SetupPantograph(PantographCount-1);  // single-row image

    SlidingWindow := 1000*SpinEditSlidingWindow.Value + 1;
    Frequency := SpinEditUpdateFrequency.Value;

    // Use specified scale, or determine scale dynamically
    IF   CheckBoxAutoScaleATGC.Checked
    THEN ComputeNucleotideContentRanges;

    IF   SpinEditPercentRangeHigh.Value - SpinEditPercentRangeLow.Value > 13
    THEN BEGIN
     TickDelta := 5;
     TickLabel := 10;
    END
    ELSE BEGIN
      TickDelta := 1;
      TickLabel := 5;
    END;

    // Change scale of pantographs for Content plots by altering RealRect
    FOR k := 0 TO PantographCount-1 DO
    BEGIN
      IF   k <> PantographCount - 1
      THEN BEGIN
        // Remember only PantographCount-1 rows in multi-row chart
        x1 := xMinPlot +     k*(xMaxPlot - xMinPlot)/(PantographCount-1);
        x2 := xMinPlot + (k+1)*(xMaxPlot - xMinPlot)/(PantographCount-1)
      END
      ELSE BEGIN
        // Last pantograph is always over full range for single-row chart
        x1 := xMinPlot;
        x2 := xMaxPlot
      END;

      Pantograph[k].WorldRect :=
                    RealRect(x1,
                             SpinEditPercentRangeHigh.Value + 0.25,
                             x2,
                             SpinEditPercentRangeLow.Value - 0.25);

{$IFDEF POSTSCRIPT}
      Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
      // draw vertical axis at right
      PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);
      Pantograph[k].MoveTo(x2, SpinEditPercentRangeLow.Value);
      Pantograph[k].LineTo(x2, SpinEditPercentRangeHigh.Value);
{$IFDEF POSTSCRIPT}
      Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}

      // show right scale in each strip
{$IFDEF POSTSCRIPT}
      Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
      PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);
      Pantograph[k].MoveTo(x2, SpinEditPercentRangeLow.Value);
      Pantograph[k].Lineto(x2, SpinEditPercentRangeHigh.Value);
{$IFDEF POSTSCRIPT}
      Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}

      FOR j := SpinEditPercentRangeLow.Value TO SpinEditPercentRangeHigh.Value DO
      BEGIN
{$IFDEF POSTSCRIPT}
        Pantograph[k].GraphicsDriver.Control(psNewPath);
{$ENDIF}
        PantoGraph[k].GraphicsDriver.SetPen(ColorToRealColor(clBlack),1);
        IF   j MOD TickLabel = 0
        THEN BEGIN
          Pantograph[k].MoveTo(x2,j);
          Pantograph[k].LineTo(x2 - Pantograph[k].xPercentDelta(1.0), j);
{$IFDEF POSTSCRIPT}
          Pantograph[k].GraphicsDriver.Control(psStroke);
{$ENDIF}
          PantoGraph[k].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
          Pantograph[k].TextOut(x2 - Pantograph[k].xPercentDelta(0.5),
                                j, Format('%d', [j]), textRight);
        END
        ELSE BEGIN
          IF   j MOD TickDelta = 0
          THEN BEGIN
            Pantograph[k].MoveTo(x2,j);
            Pantograph[k].LineTo(x2 - Pantograph[k].xPercentDelta(0.5), j);
          END
        END
      END;

      Consider(CheckBoxContentAT, 'AT');
      Consider(CheckBoxContentGC, 'GC');
      Consider(CheckBoxContentA,  'A');
      Consider(CheckBoxContentT,  'T');
      Consider(CheckBoxContentG,  'G');
      Consider(CheckBoxContentC,  'C');
    END;

  END {PlotNucleotideContent};

begin
  IF   DataLoadedRatio
  THEN BEGIN
    Screen.Cursor := crHourGlass;
    TRY
      DefineNewPantographs;

      // Clear last drawing
      // Setup for Multi-row image
      BitmapMultiRow.Canvas.Brush.Color := ClWhite;
      BitmapMultiRow.Canvas.FillRect(BitmapMultiRow.Canvas.ClipRect);

      CASE RadioGroupSingleRowFormat.ItemIndex OF
        0:  BEGIN
              // Nothing needed
            END;

        1:  BEGIN  // Metafile
              // Setup for Single-row image (Fill Rect needed for WMF)
              MetafileCanvas.Brush.Color := ClWhite;
              MetafileCanvas.FillRect(MetaFileCanvas.ClipRect)
            END;

        2:  ;  // Nothing needed
      END;

      PantoGraph[0].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
      PantoGraph[0].TextOutPercent(0.5,94, 'Ratio');

      PantoGraph[PantoGraphCount-1].GraphicsDriver.SetFont('Arial',12, ColorToRealColor(clBlack));
      PantoGraph[PantoGraphCount-1].TextOutPercent(0.5, 94, 'Ratio');
      PlotGridLines;

      IF   CheckBoxShowRatio.Checked
      THEN PlotRatioLine;

      IF   CheckBoxUniform.Checked
      THEN PlotUniformlySpacedData;

      SmoothDataAndPlot;

      IF   CheckBoxPeaks.Checked AND
           (CheckBoxShowRatio.Checked OR CheckBoxSmooth.Checked)
      THEN PlotPeakLabels;

      IF   CheckBoxShowFeature.Checked
      THEN PlotWatsonCrickIntergenicFeatures;

      IF   CheckBoxGap.Checked
      THEN PlotGapOverlapBaseline;

      IF   CheckBoxVerticalTicks.Checked
      THEN PlotVerticalTickMarks;

      PlotCentromereLocation;

      IF   CheckBoxContent.Checked AND (LENGTH(ChromosomeSequence) > 0)
      THEN PlotNucleotideContent;    // AT/GC Content curve(s)

      // Show label for individual chromosome; skip for "all chromosomes"
       IF   (ComboBoxChromosomeFilter.ItemIndex > 0) AND CheckBoxShowTitle.Checked
      THEN BEGIN
        PantoGraph[0].GraphicsDriver.SetTransparency(transparencyOn);
        PantoGraph[0].GraphicsDriver.SetFont('Arial',18, ColorToRealColor(clBlue));
        PantoGraph[0].TextOutPercent(7.5,90, ComboBoxChromosomeFilter.Text);

        // Show label for individual chromosome; skip for "all chromosomes"
        PantoGraph[PantoGraphCount-1].GraphicsDriver.SetTransparency(transparencyOn);
        PantoGraph[PantoGraphCount-1].GraphicsDriver.SetFont('Arial',18, ColorToRealColor(clBlue));
        PantoGraph[PantoGraphCount-1].TextOut(
            25000,
            PantoGraph[PantoGraphCount-1].yPercent(90),
            ComboBoxChromosomeFilter.Text);
      END;

      ButtonReplot.Enabled := FALSE;
      ImageMultiRow.Picture.Graphic := BitmapMultiRow;

      CASE RadioGroupSingleRowFormat.ItemIndex OF
        // 2=postscript only displays message
        0,2:  ImageSingleRow.Picture.Graphic := BitmapSingleRow;   // Bitmap

        1:  BEGIN  // Metafile
             MetafileCanvas.Free;
             ImageSingleRow.Picture.Graphic := MetafileSingleRow;  // Metafile
            END;
      END;

      CASE RadioGroupAutoSave.ItemIndex OF
        0: BEGIN // Save Single-Row Graphic on Clipboard
             CASE RadioGroupSingleRowFormat.ItemIndex OF
               0:  BEGIN  // Bitmap
                     BitmapSingleRow.SaveToClipboardFormat(ClipboardFormat, ClipboardData, ClipboardPalette);
                     Clipboard.SetAsHandle(ClipboardFormat, ClipboardData)
                   END;

               1:  BEGIN  // Metafile
                     MetafileSingleRow.SaveToClipboardFormat(ClipboardFormat, ClipboardData, ClipboardPalette);
                     OpenClipboard(Application.Handle);
                     TRY
                       EmptyClipboard;
                       SetClipboardData(ClipboardFormat, ClipboardData);
                     FINALLY
                       CloseClipboard
                     END
                   END;
               2: ;  // Do nothing:  not possible to cut/paste postscript

             END;
           END;

        1: BEGIN
             BitmapMultiRow.SaveToClipboardFormat(ClipboardFormat, ClipboardData, ClipboardPalette);
             ClipBoard.SetAsHandle(ClipboardFormat, ClipboardData);
           END;
        ELSE
          // Do nothing
      END

    FINALLY
      Screen.Cursor := crDefault
    END
  END
end;


procedure TFormPeaks.SpinEditTraceCountChange(Sender: TObject);
begin
  LabelNPoint.Caption := '2N+1 = ' +
                         IntToStr(1 + 2*SpinEditSmoothHalfRange.Value) + '-point';
  DefineNewPantographs;
  PlotValues
end;

procedure TFormPeaks.CheckBoxLog2Click(Sender: TObject);
begin
  IF   CheckBoxLog2.Checked
  THEN SpinEditThreshold.Value :=    0
  ELSE SpinEditThreshold.Value := 1000;

  UpdateDisplayRange;
  PlotValues
end;


procedure TFormPeaks.EditCoordKeyPress(Sender: TObject; var Key: Char);
  CONST
    Backspace = #$08;
begin
  IF   (Key IN [Backspace, '0'..'9'])
  THEN ButtonReplot.Enabled := TRUE
  ELSE Key := #$00
end;


procedure TFormPeaks.ButtonReplotClick(Sender: TObject);
  CONST
    NoValueInt   = -1;
    NoValueFloat = 1E50;
  VAR
    coord1:  INTEGER;
    coord2:  INTEGER;
    ratio1:  Double;
    ratio2:  Double;
begin
  coord1 := StrToIntDef(EditCoord1.Text, NoValueInt);
  coord2 := StrToIntDef(EditCoord2.Text, NoValueInt);

  IF   (coord2 <= coord1)    OR
       (coord1 = NoValueInt) OR (coord2 = NoValueInt)
  THEN BEGIN
    ShowMessage('coord2 must be greater than coord1 (or invalid values)');
    ButtonReplot.Enabled := FALSE
  END
  ELSE BEGIN
    ratio1 := StrToFloatDef(EditCoord1.Text, NoValueFloat);
    ratio2 := StrToFloatDef(EditCoord2.Text, NoValueFloat);
    IF  (ratio2 <= ratio1) OR
        (ratio1 =  NoValueFloat) OR (ratio2 = NoValueFloat)
    THEN BEGIN
      ShowMessage('ratio2 must be greater than ratio1 (or invalid values)');
      ButtonReplot.Enabled := FALSE
    END
    ELSE PlotValues
  END
end;

////  Peak Data    ///////////////////////////////////////////////////////////


PROCEDURE TFormPeaks.SavePeakData(CONST Filename:  TFilename; SavePeaks:  TSavePeaks);
  VAR
    i      :  INTEGER;
    j      :  INTEGER;
    jStart :  INTEGER;
    outfile:  TextFile;
BEGIN
  IF   PeakCount > 0
  THEN BEGIN
    AssignFile(outfile, FileName);
    IF   SavePeaks = spAppend
    THEN BEGIN
      Append(outfile);
      jStart := 1;  // skip redundant header if appending
    END
    ELSE BEGIN
      REWRITE(outfile);
      jStart := 0;  // start with header line
    END;

    FOR j := jStart TO PeakCount DO
    BEGIN
      IF   j = 0
      THEN WRITE(outfile,'Chromosome,')
      ELSE WRITE(outfile,ComboBoxChromosomeFilter.ItemIndex,',');

      FOR i := 1 TO PeakColumnCount DO
      BEGIN
        WRITE(outfile,StringGridPeaks.Cells[i,j]);
        IF   i <> PeakColumnCount
        THEN WRITE(outfile, ',')
      END;
      WRITELN(outfile);
    END;

    Closefile(outfile);
  END
END {SavePeakData};


// Write Peak info out in CSV format
procedure TFormPeaks.ButtonSavePeaksClick(Sender: TObject);
begin
  IF   PeakCount > 0
  THEN BEGIN
    SaveDialog.FileName := 'Chromosome' + IntToStr(ComboboxChromosomeFilter.ItemIndex) + '.csv';
    IF   SaveDialog.Execute
    THEN SavePeakData(SaveDialog.Filename, spNew);
  END
end;


procedure TFormPeaks.ImageMultiRowMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  VAR
    FeatureCode    :  STRING;
    FeatureInfo    :  STRING;
    PantographIndex:  INTEGER;
    s              :  STRING;
    xReal          :  Double;
    yReal          :  Double;
begin
  IF   ComboBoxChromosomeFilter.ItemIndex > 0
  THEN BEGIN
    // Exclude the last pantograph, PantographCount-1, since it's not
    // used in the multirow display
    PantographIndex := Y DIV (BitmapMultiRow.Height DIV (PantographCount-1));
    IF   (PantographIndex >= 0) AND (PantographIndex < PantographCount-1)
    THEN BEGIN
      Pantograph[PantographIndex].MapCanvasToWorld(X,Y, xReal,yReal);
      GetFeatureName(xReal, FeatureCode, FeatureInfo);
      s := 'bp='  + FormatFloat('#', xReal);

      IF   CheckBoxContent.Checked
      THEN s := s + '  Content='
      ELSE
        IF   CheckBoxLog2.Checked
        THEN s := s + '  LogRatio='
        ELSE s := s + '  Ratio=';

      s := s + FormatFloat('#0.00', yReal) + '    ';
      IF   LENGTH(FeatureInfo) = 0
      THEN LabelCoords.Caption := s + FeatureCode  // Gap or Overlap or error
      ELSE LabelCoords.Caption := s + FeatureInfo; // Regular feature;

      LabelCoords.Font.Color := FeatureColor(FeatureCode);
    END
    ELSE LabelCoords.Caption := 'Pantograph Index Problem';
  END
  ELSE LabelCoords.Caption := '';
end;

procedure TFormPeaks.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LabelCoords.Caption := ''
end;

procedure TFormPeaks.ButtonProcessAllClick(Sender: TObject);
begin
  FormProcessAll.ShowModal
end;

PROCEDURE TFormPeaks.WriteSmoothingData(CONST Filename:  TFilename);
  VAR
    outfile:  Textfile;
BEGIN
  AssignFile(outfile, FileName);
  REWRITE(outfile);
  WRITELN(outfile,'Coordinates:  ', LabelCoordinatesWorkbook.Caption, ' (' ,
                  ComboBoxCoordWorksheet.Text, ')');
  WRITELN(outfile, 'Ratios:  ', LabelRatioWorkbook.Caption, ' (' ,
                   ComboBoxRatioWorksheet.Text, ')');
  IF   CheckBoxLog2.Checked
  THEN WRITELN(outfile, 'Log Data')
  ELSE WRITELN(outfile, 'Raw Data');

  IF   CheckBoxGaussian.Checked
  THEN WRITELN(outfile,'Gaussian Smoothing')
  ELSE WRITELN(outfile,'Regular Smoothing');

  IF   RadioButtonUniformData.Checked
  THEN WRITELN(outfile,'Uniformly spaced data:  Stepsize=' + IntToStr(SpinEditStep.Value) , ' bps')
  ELSE WRITELN(outfile,'Raw Data');

  WRITELN(outfile, 'MinYSmoothLeftDelta:  ', SpinEditMinSmoothLeftDelta.Value);
  WRITELN(outfile, 'MinYSmoothRightDelta:  ', SpinEditMinSmoothRightDelta.Value);
  WRITELN(outfile, 'YThreshold:  ', SpinEditThreshold.Value);

  WRITELN(outfile, 'Smoothing:  ', LabelNPoint.Caption, ',', SpinEditSmoothRounds.Value, ' rounds');

  Closefile(outfile);
END {WriteSmoothingData};

procedure TFormPeaks.EditFloatKeyPress(Sender: TObject;
  var Key: Char);
  
  CONST
    Backspace  = #$08;
begin
  IF   (LENGTH( (Sender AS TEdit).Text ) = 0) OR
       ( (Sender AS Tedit).SelLength = LENGTH((Sender AS TEdit).Text ) )
  THEN BEGIN
    IF   NOT (Key IN ['0'..'9', '+', '-'])
    THEN Key := #$00
  END
  ELSE BEGIN
    IF   POS(DecimalSeparator, (Sender AS TEdit).Text) > 0
    THEN BEGIN
      IF   NOT (Key IN [Backspace, '0'..'9'])
      THEN Key := #$00;
    END
    ELSE BEGIN
      IF   NOT (Key IN [Backspace, '0'..'9', DecimalSeparator])
      THEN Key := #$00
    END
  END;

  IF   Key <> #$00
  THEN ButtonReplot.Enabled := TRUE
end;


PROCEDURE TFormPeaks.CheckSequenceFiles(CONST Directory: STRING);
  VAR
    Filename   :  STRING;
    FoundCount1:  INTEGER;
    FoundCount2:  INTEGER;
    i          :  INTEGER;
    IniFile    :  TIniFile;
    ReturnCode :  INTEGER;
    s          :  STRING;
    SearchRec  :  TSearchRec;
BEGIN
  EditSequenceDirectory.Text := Directory;

  // Update INI file for next time
  Filename := AppINIFilename(AppDir);
  IniFile := TIniFile.Create(Filename);
  TRY
    IniFile.WriteString('Setup', 'SequenceDirectory', Directory)
  FINALLY
    IniFile.Free
  END;
  // Flush INI cache
  WritePrivateProfileString(NIL, NIL, NIL, pChar(Filename));

  // Warn if any chromosome files are missing. Format:  chrNN* or chrRoman*
  // Check for chrNN* files, where NN is 01 to Genome.ChromosomeCount
  FoundCount1 := 0;
  FOR i := 1 TO Genome.ChromosomeCount DO
  BEGIN
    Filename := ExcludeTrailingBackSlash(Directory) + '\' +
                'chr' + Format('%2.2d', [i]) + '*.*';
    ReturnCode := FindFirst(Filename, faAnyFile, SearchRec);
    IF   ReturnCode = 0
    THEN INC(FoundCount1);
    FindClose(SearchRec);
  END;

  // Check for chrRoman files, i.e., chri_*, chrii_*, chriii_*, ... chrxvi_*
  FoundCount2 := 0;
  FOR i := 1 TO Genome.ChromosomeCount DO
  BEGIN
    Filename := ExcludeTrailingBackSlash(Directory) + '\' +
                'chr' + RomanNumeral(i) + '_*.*';
    ReturnCode := FindFirst(Filename, faAnyFile, SearchRec);
    IF   ReturnCode = 0
    THEN INC(FoundCount2);
    FindClose(SearchRec);
  END;

  IF   (FoundCount1 <> Genome.ChromosomeCount) AND (FoundCount2 <> Genome.ChromosomeCount)
  THEN LabelSequenceDirectoryComment.Caption :=
       'Cannot find all chr<NN>* or chr<Roman>* sequence files.'
  ELSE BEGIN
     s := '';
     IF   FoundCount1 = Genome.ChromosomeCount
     THEN s := s + 'Found all chr<NN>* sequence files.';

     IF   FoundCount2 = Genome.ChromosomeCount
     THEN s := s + 'Found all chr<Roman>* sequence files.';

     LabelSequenceDirectoryComment.Caption := s
  END
END {CheckSequenceFiles};


procedure TFormPeaks.ButtonSelectSequenceDirectoryClick(Sender: TObject);
  VAR
    Directory  :  STRING;
    Root       :  WideString;
begin

{$IFDEF VER100}
  IF   SelectDirectory(Directory, [], 0)
{$ELSE}
  Root := EditSequenceDirectory.Text;
  IF   SelectDirectory('Sequence Directory', Root, Directory)
{$ENDIF}

  THEN CheckSequenceFiles(Directory)
end;


////  Chromosome Sequence Data    ////////////////////////////////////////////

PROCEDURE TFormPeaks.ComputeNucleotideContentRanges;
  VAR
    Frequency :  INTEGER;
    PercentMax:  Double;
    PercentMin:  Double;

  PROCEDURE Consider (CONST CheckBox:  TCheckBox; CONST target:  STRING);
    VAR
      RangeMax:  Double;
      RangeMin:  Double;
  BEGIN
    IF   CheckBox.Checked
    THEN BEGIN
      NucleotideContentRange(ChromosomeSequence, target,
                             SlidingWindow, Frequency, RangeMin, RangeMax);

      IF   RangeMax > PercentMax
      THEN PercentMax := RangeMax;

      IF   RangeMin < PercentMin
      THEN PercentMin := RangeMin;
    END
  END {Consider};

begin
  SlidingWindow := 1000*SpinEditSlidingWindow.Value + 1;
  Frequency     := SpinEditUpdateFrequency.Value;

  PercentMin := 100;
  PercentMax :=   0;

  Consider(CheckBoxContentAT, 'AT');
  Consider(CheckBoxContentGC, 'GC');

  Consider(CheckBoxContentA, 'A');
  Consider(CheckBoxContentT, 'T');
  Consider(CheckBoxContentG, 'G');
  Consider(CheckBoxContentC, 'C');

  MemoSequence.Lines.Add('Range = ' +  Format('%.3f to %.3f', [PercentMin, PercentMax]) );

  SpinEditPercentRangeHigh.Value := TRUNC(PercentMax + 1.0);
  SpinEditPercentRangeLow.Value  := TRUNC(PercentMin);
end;

procedure TFormPeaks.CheckBoxContentClick(Sender: TObject);
begin
  ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.SpinEditReplotChange(Sender: TObject);
begin
  ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.CheckBoxReplotClick(Sender: TObject);
begin
   ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.LabelStowersURLClick(Sender: TObject);
  CONST
    URL = 'http://www.stowers-institute.org/labs/Gerton/2003/cohesin';
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', URL, NIL, NIL, SW_NORMAL);
{$ENDIF}

{$IFDEF LINUX}   // In case ever ported to Kylix
  // Assumes KDE is being used
  libc.system('kfmclient openURL ' + URL');
{$ENDIF}
end;

procedure TFormPeaks.SpeedButtonSaveChartClick(Sender: TObject);
  VAR
    Filename:  TFilename;
{$IFDEF GIF}
    GIFImage:  TGIFImage;
{$ENDIF}
begin
  IF   DataLoadedRatio
  THEN BEGIN

    Filename := 'Multi' +
                Format('%2.2d', [ FormPeaks.ComboboxChromosomeFilter.ItemIndex ]);
  {$IFDEF GIF}
    FileName := FileName + '.gif';
    SavePictureDialog.DefaultExt := 'gif';
    SavePictureDialog.Filter := 'GIFs (*.gif)|*.gif';
  {$ELSE}
    SavePictureDialog.DefaultExt := 'bmp';
    SavePictureDialog.Filter := 'Bitmaps (*.bmp)|*.bmp';
    FileName := FileName + '.bmp';
  {$ENDIF}

    SavePictureDialog.FileName := Filename;
    IF   SavePictureDialog.Execute
    THEN BEGIN
  {$IFDEF GIF}
      GIFImage := TGIFImage.Create;
      TRY
        GIFImage.Assign(BitmapMultiRow);
        GIFImage.SavetoFile(SavePictureDialog.FileName);
      FINALLY
        GIFImage.Free
      END;
  {$ELSE}
      Bitmap.SaveToFile(SavePictureDialog.Filename);
  {$ENDIF}
    END
  END
end;

procedure TFormPeaks.ScrollBarSingleRowChange(Sender: TObject);
begin
  ImageSingleRow.Left := -ScrollBarSingleRow.Position
end;

procedure TFormPeaks.SpinEditSingleRowChange(Sender: TObject);
begin
  ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.ButtonLoadGenomeClick(Sender: TObject);
begin
  IF   OpenDialogGenomeIndex.Execute
  THEN BEGIN
    LabelGenomeIndex.Caption := OpenDialogGenomeIndex.Filename;
    ResetEverything;
    LoadGenomeIndexFile(LabelGenomeIndex.Caption);

    // Assume sequences are in same directory as Genome Index File
    CheckSequenceFiles(ExtractFilePath(LabelGenomeIndex.Caption));
  END
end;

procedure TFormPeaks.ReplotEverythingEvent(Sender: TObject);
begin
  TRY
    StrToInt(SpinEditHorizontalGrid.Text);
    PlotValues
  EXCEPT
    ON ECOnvertError DO ;  // ignore conversion error
  END
end;

procedure TFormPeaks.SpeedButtonSingleRowClick(Sender: TObject);
  VAR
    Filename:  TFilename;
begin
  IF   DataLoadedRatio
  THEN BEGIN

    Filename := 'Single' +
                        Format('%2.2d', [ FormPeaks.ComboboxChromosomeFilter.ItemIndex ]);

    CASE RadioGroupSingleRowFormat.ItemIndex OF
      0:  BEGIN // Bitmap
            FileName := FileName + '.bmp';
            SavePictureDialog.DefaultExt := 'bmp';
            SavePictureDialog.Filter := 'Bitmap (*.bmp)|*.bmp';

            SavePictureDialog.FileName := Filename;
            IF   SavePictureDialog.Execute
            THEN BitmapSingleRow.SaveToFile(Filename)
          END;

      1:  BEGIN // Metafile
            FileName := FileName + '.emf';
            SavePictureDialog.DefaultExt := 'emf';
            SavePictureDialog.Filter := 'Enhanced Metafile (*.emf)|*.emf';

            SavePictureDialog.FileName := Filename;
            IF   SavePictureDialog.Execute
            THEN MetafileSingleRow.SaveToFile(Filename)
          END;

      2:  BEGIN
            FileName := FileName + '.eps';
            SaveDialogPostscript.DefaultExt := 'eps';
            SaveDialogPostscript.Filter := 'Postscript (*.eps)|*.emf';

            SaveDialogPostscript.FileName := Filename;
            IF   SaveDialogPostScript.Execute
            THEN DriverPostscript.List.SaveToFile(SaveDialogPostscript.FileName)
         END;
    END
    
  END
end;

procedure TFormPeaks.RadioGroupSingleRowFormatClick(Sender: TObject);
begin
  ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.CheckBoxPeaksClick(Sender: TObject);
begin
  ButtonReplot.Enabled := TRUE
end;

procedure TFormPeaks.ButtonResetClick(Sender: TObject);
begin
  LabelGenomeIndex.Caption := 'Genome Index:  Filename';
  ResetEverything;
  PlotValues  // clear graphics
end;

end.
