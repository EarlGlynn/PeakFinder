object FormPeaks: TFormPeaks
  Left = 213
  Top = 30
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PeakFinder'
  ClientHeight = 925
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCoord1: TLabel
    Left = 10
    Top = 31
    Width = 72
    Height = 13
    Caption = 'Plot Coord from'
  end
  object LabelCoord2: TLabel
    Left = 148
    Top = 31
    Width = 9
    Height = 13
    Caption = 'to'
  end
  object LabelDisplayRatio1: TLabel
    Left = 10
    Top = 55
    Width = 69
    Height = 13
    Caption = 'Log Ratio from'
  end
  object LabelDisplayRatio2: TLabel
    Left = 148
    Top = 56
    Width = 9
    Height = 13
    Caption = 'to'
  end
  object LabelGapShow: TLabel
    Left = 412
    Top = 33
    Width = 20
    Height = 13
    Caption = 'Gap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelOverlapShow: TLabel
    Left = 442
    Top = 33
    Width = 37
    Height = 13
    Caption = 'Overlap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelMinPeak: TLabel
    Left = 802
    Top = 23
    Width = 84
    Height = 13
    Caption = 'Min Smooth Delta'
  end
  object LabelMinYLeftDelta: TLabel
    Left = 802
    Top = 37
    Width = 18
    Height = 13
    Caption = 'Left'
  end
  object LabelMinYRightDelta: TLabel
    Left = 802
    Top = 61
    Width = 25
    Height = 13
    Caption = 'Right'
  end
  object Label1: TLabel
    Left = 926
    Top = 23
    Width = 47
    Height = 13
    Caption = 'Threshold'
  end
  object PageControl: TPageControl
    Left = 5
    Top = 81
    Width = 1001
    Height = 841
    ActivePage = TabSheetRawData
    TabOrder = 0
    object TabSheetRawData: TTabSheet
      Caption = 'Raw Data'
      ImageIndex = 4
      object LabelCoordinatesWorkbook: TLabel
        Left = 129
        Top = 64
        Width = 160
        Height = 13
        Caption = 'Workbook:  Coordinates Filename'
      end
      object LabelWorksheetCoord: TLabel
        Left = 129
        Top = 82
        Width = 55
        Height = 13
        Caption = 'Worksheet:'
      end
      object LabelWorksheetRowCount: TLabel
        Left = 16
        Top = 783
        Width = 33
        Height = 13
        Caption = 'Rows='
      end
      object LabelGap: TLabel
        Left = 567
        Top = 103
        Width = 20
        Height = 13
        Caption = 'Gap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelOverlap: TLabel
        Left = 592
        Top = 103
        Width = 37
        Height = 13
        Caption = 'Overlap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelRatioWorkbook: TLabel
        Left = 588
        Top = 64
        Width = 134
        Height = 13
        Caption = 'Workbook:  Ratios Filename'
      end
      object LabelWorksheetRatio: TLabel
        Left = 588
        Top = 82
        Width = 55
        Height = 13
        Caption = 'Worksheet:'
      end
      object LabelRatioIndex: TLabel
        Left = 821
        Top = 82
        Width = 35
        Height = 13
        Caption = 'Column'
      end
      object LabelNotFoundHeader: TLabel
        Left = 720
        Top = 103
        Width = 101
        Height = 13
        Caption = 'Not in Coordinate List'
      end
      object LabelRatioError: TLabel
        Left = 615
        Top = 780
        Width = 28
        Height = 13
        Caption = 'Error='
      end
      object LabelRatioMissing: TLabel
        Left = 666
        Top = 780
        Width = 41
        Height = 13
        Caption = 'Missing='
      end
      object LabelRatioRange: TLabel
        Left = 615
        Top = 796
        Width = 111
        Height = 13
        Caption = 'Ratio = <min> to <max>'
      end
      object LabelRatioName: TLabel
        Left = 907
        Top = 82
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object LabelGenomeIndex: TLabel
        Left = 129
        Top = 10
        Width = 120
        Height = 13
        Caption = 'Genome Index:  Filename'
      end
      object LabelSequenceDirectoryComment: TLabel
        Left = 453
        Top = 32
        Width = 56
        Height = 13
        Caption = '<Comment>'
      end
      object ButtonLoadCoordinates: TButton
        Left = 5
        Top = 64
        Width = 120
        Height = 25
        Caption = '3.  Coordinates'
        Enabled = False
        TabOrder = 0
        OnClick = ButtonLoadCoordinatesClick
      end
      object StringGridCoord: TStringGrid
        Left = 16
        Top = 120
        Width = 686
        Height = 651
        ColCount = 11
        DefaultColWidth = 40
        DefaultRowHeight = 16
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
        ScrollBars = ssVertical
        TabOrder = 1
        OnDrawCell = StringGridCoordDrawCell
        ColWidths = (
          40
          70
          56
          56
          50
          85
          56
          54
          71
          64
          53)
      end
      object ComboBoxCoordWorksheet: TComboBox
        Left = 190
        Top = 80
        Width = 166
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = ComboBoxCoordWorksheetChange
      end
      object ButtonLoadRatio: TButton
        Left = 460
        Top = 64
        Width = 120
        Height = 25
        Caption = '4.  Ratios'
        Enabled = False
        TabOrder = 3
        OnClick = ButtonLoadRatioClick
      end
      object ComboBoxRatioWorksheet: TComboBox
        Left = 649
        Top = 80
        Width = 166
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = ComboBoxRatioWorksheetChange
      end
      object SpinEditRatioColumn: TSpinEdit
        Left = 861
        Top = 80
        Width = 41
        Height = 22
        MaxValue = 10
        MinValue = 2
        TabOrder = 5
        Value = 2
      end
      object MemoRatioProblems: TMemo
        Left = 720
        Top = 120
        Width = 259
        Height = 651
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object ButtonReloadRatio: TButton
        Left = 907
        Top = 98
        Width = 50
        Height = 19
        Caption = 'ReLoad'
        TabOrder = 7
        OnClick = ButtonReloadRatioClick
      end
      object ButtonProcessAll: TButton
        Left = 871
        Top = 1
        Width = 120
        Height = 25
        Caption = '5.  PROCESS ALL'
        Enabled = False
        TabOrder = 8
        OnClick = ButtonProcessAllClick
      end
      object ButtonLoadGenome: TButton
        Left = 5
        Top = 1
        Width = 120
        Height = 25
        Caption = '1.  Genome Index File'
        TabOrder = 9
        OnClick = ButtonLoadGenomeClick
      end
      object ButtonSelectSequenceDirectory: TButton
        Left = 5
        Top = 28
        Width = 120
        Height = 25
        Caption = '2.  Sequence Directory'
        Enabled = False
        TabOrder = 10
        OnClick = ButtonSelectSequenceDirectoryClick
      end
      object EditSequenceDirectory: TEdit
        Left = 128
        Top = 30
        Width = 318
        Height = 21
        TabOrder = 11
      end
      object ButtonReset: TButton
        Left = 871
        Top = 33
        Width = 120
        Height = 25
        Caption = 'Reset Files'
        TabOrder = 12
        OnClick = ButtonResetClick
      end
    end
    object TabSheetChart: TTabSheet
      Caption = 'Multi-Row Chart'
      ImageIndex = 1
      object ImageMultiRow: TImage
        Left = 4
        Top = 28
        Width = 985
        Height = 780
        OnMouseMove = ImageMultiRowMouseMove
      end
      object LabelCoords: TLabel
        Left = 9
        Top = 14
        Width = 56
        Height = 13
        Caption = 'Coordinates'
      end
      object ShapeCentromere: TShape
        Left = 10
        Top = 2
        Width = 8
        Height = 8
        Brush.Color = clBlack
        Shape = stCircle
      end
      object LabelCentromere: TLabel
        Left = 25
        Top = 0
        Width = 54
        Height = 13
        Caption = 'Centromere'
      end
      object LabelWatson: TLabel
        Left = 93
        Top = 0
        Width = 37
        Height = 13
        Caption = 'Watson'
      end
      object LabelCrick: TLabel
        Left = 147
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Crick'
      end
      object LabelIntergenic: TLabel
        Left = 187
        Top = 0
        Width = 47
        Height = 13
        Caption = 'Intergenic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButtonSaveChart: TSpeedButton
        Tag = 2
        Left = 931
        Top = 2
        Width = 57
        Height = 22
        Caption = 'Save'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButtonSaveChartClick
      end
      object LabelTraceCount: TLabel
        Left = 833
        Top = 5
        Width = 27
        Height = 13
        Caption = 'Rows'
      end
      object SpinEditTraceCount: TSpinEdit
        Left = 866
        Top = 2
        Width = 41
        Height = 22
        MaxValue = 12
        MinValue = 1
        TabOrder = 0
        Value = 2
        OnChange = SpinEditTraceCountChange
      end
    end
    object TabSheetSingleStrip: TTabSheet
      Caption = 'Single-Row Chart'
      ImageIndex = 6
      object LabelSingleRowHeight: TLabel
        Left = 70
        Top = 49
        Width = 67
        Height = 13
        Caption = 'Height [Pixels]'
      end
      object LabelSingleRowVertical: TLabel
        Left = 6
        Top = 49
        Width = 35
        Height = 13
        Caption = 'Vertical'
      end
      object LabelSingleRowHorizontal: TLabel
        Left = 6
        Top = 17
        Width = 47
        Height = 13
        Caption = 'Horizontal'
      end
      object LabelSingleRowBasesPerPixel: TLabel
        Left = 70
        Top = 17
        Width = 62
        Height = 13
        Caption = 'Bases / Pixel'
      end
      object SpeedButtonSingleRow: TSpeedButton
        Tag = 1
        Left = 931
        Top = 2
        Width = 57
        Height = 22
        Caption = 'Save'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButtonSingleRowClick
      end
      object PanelSingleRow: TPanel
        Left = 4
        Top = 103
        Width = 960
        Height = 300
        TabOrder = 0
        object ImageSingleRow: TImage
          Left = 0
          Top = 0
          Width = 960
          Height = 300
        end
      end
      object ScrollBarSingleRow: TScrollBar
        Left = 4
        Top = 81
        Width = 961
        Height = 16
        PageSize = 0
        TabOrder = 1
        OnChange = ScrollBarSingleRowChange
      end
      object SpinEditSingleRowHeight: TSpinEdit
        Left = 153
        Top = 45
        Width = 55
        Height = 22
        Increment = 10
        MaxValue = 1024
        MinValue = 64
        TabOrder = 2
        Value = 200
        OnChange = SpinEditSingleRowChange
      end
      object SpinEditSingleRowBasesPerPixel: TSpinEdit
        Left = 153
        Top = 13
        Width = 55
        Height = 22
        Increment = 50
        MaxValue = 10000
        MinValue = 200
        TabOrder = 3
        Value = 500
        OnChange = SpinEditSingleRowChange
      end
      object RadioGroupSingleRowFormat: TRadioGroup
        Left = 230
        Top = 6
        Width = 129
        Height = 65
        Caption = 'Format'
        ItemIndex = 0
        Items.Strings = (
          'Bitmap'
          'Enhanced Metafile'
          'Postscript')
        TabOrder = 4
        OnClick = ReplotEverythingEvent
      end
    end
    object TabSheetPeaks: TTabSheet
      Caption = 'Peaks'
      ImageIndex = 2
      object LabelYSmoothDelta: TLabel
        Left = 387
        Top = 37
        Width = 64
        Height = 13
        Caption = 'Smooth Delta'
      end
      object Label2: TLabel
        Left = 810
        Top = 37
        Width = 47
        Height = 13
        Caption = 'Threshold'
      end
      object StringGridPeaks: TStringGrid
        Left = 25
        Top = 54
        Width = 952
        Height = 619
        ColCount = 15
        DefaultColWidth = 32
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        ColWidths = (
          20
          35
          60
          70
          70
          60
          70
          70
          70
          60
          60
          60
          60
          60
          60)
      end
      object ButtonSavePeaks: TButton
        Left = 25
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Save Peaks'
        TabOrder = 1
        OnClick = ButtonSavePeaksClick
      end
      object MemoPeaks: TMemo
        Left = 25
        Top = 696
        Width = 684
        Height = 105
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object TabSheetUniformSpacing: TTabSheet
      Caption = 'Uniform Spacing'
      ImageIndex = 3
      object LabelStep: TLabel
        Left = 123
        Top = 20
        Width = 48
        Height = 13
        Caption = 'Step [bps]'
      end
      object MemoData: TMemo
        Left = 20
        Top = 62
        Width = 953
        Height = 600
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object ButtonRecomputeUniform: TButton
        Left = 20
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Recompute'
        TabOrder = 1
        OnClick = ButtonRecomputeUniformClick
      end
      object SpinEditStep: TSpinEdit
        Left = 182
        Top = 20
        Width = 50
        Height = 22
        Increment = 50
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 100
        OnChange = SpinEditReplotChange
      end
      object CheckBoxWriteUniform: TCheckBox
        Left = 288
        Top = 20
        Width = 169
        Height = 17
        Caption = 'Write Uniformly Spaced Data'
        TabOrder = 3
      end
    end
    object TabSheetATGC: TTabSheet
      Caption = 'AT/GC'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 8
        Top = 24
        Width = 681
        Height = 425
        Caption = 'AT/GC Content'
        TabOrder = 0
        object LabelSlidingWindow: TLabel
          Left = 20
          Top = 35
          Width = 105
          Height = 13
          Caption = 'Sliding Window [kbps]'
        end
        object LabelUpdateFrequency: TLabel
          Left = 20
          Top = 95
          Width = 114
          Height = 13
          Caption = 'Update Frequency [bps]'
        end
        object LabelPercentRange: TLabel
          Left = 20
          Top = 155
          Width = 72
          Height = 13
          Caption = 'Percent Range'
        end
        object LabelPercentRangeComment: TLabel
          Left = 20
          Top = 173
          Width = 116
          Height = 13
          Caption = '(Range for all selections)'
        end
        object SpinEditSlidingWindow: TSpinEdit
          Left = 165
          Top = 35
          Width = 50
          Height = 22
          MaxValue = 2000
          MinValue = 0
          TabOrder = 0
          Value = 30
          OnChange = SpinEditReplotChange
        end
        object SpinEditUpdateFrequency: TSpinEdit
          Left = 165
          Top = 95
          Width = 50
          Height = 22
          MaxValue = 10000
          MinValue = 0
          TabOrder = 1
          Value = 200
          OnChange = SpinEditReplotChange
        end
        object SpinEditPercentRangeHigh: TSpinEdit
          Left = 165
          Top = 155
          Width = 50
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 2
          Value = 45
          OnChange = SpinEditReplotChange
        end
        object SpinEditPercentRangeLow: TSpinEdit
          Left = 165
          Top = 185
          Width = 50
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 3
          Value = 35
          OnChange = SpinEditReplotChange
        end
        object CheckBoxContentAT: TCheckBox
          Left = 328
          Top = 32
          Width = 50
          Height = 17
          Caption = 'AT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = CheckBoxContentClick
        end
        object CheckBoxContentGC: TCheckBox
          Left = 439
          Top = 32
          Width = 50
          Height = 17
          Caption = 'GC'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 5
        end
        object CheckBoxContentA: TCheckBox
          Left = 328
          Top = 64
          Width = 40
          Height = 17
          Caption = 'A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = CheckBoxContentClick
        end
        object CheckBoxContentT: TCheckBox
          Left = 370
          Top = 64
          Width = 40
          Height = 17
          Caption = 'T'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = CheckBoxContentClick
        end
        object CheckBoxContentC: TCheckBox
          Left = 483
          Top = 64
          Width = 40
          Height = 17
          Caption = 'C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = CheckBoxContentClick
        end
        object CheckBoxContentG: TCheckBox
          Left = 439
          Top = 64
          Width = 40
          Height = 17
          Caption = 'G'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = CheckBoxContentClick
        end
        object MemoSequence: TMemo
          Left = 24
          Top = 286
          Width = 641
          Height = 121
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object CheckBoxAutoScaleATGC: TCheckBox
          Left = 20
          Top = 191
          Width = 113
          Height = 17
          Caption = 'AutoScale'
          Checked = True
          State = cbChecked
          TabOrder = 11
          OnClick = CheckBoxReplotClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Setup'
      ImageIndex = 7
      object GroupBoxMisc: TGroupBox
        Left = 8
        Top = 10
        Width = 681
        Height = 191
        Caption = 'Miscellaneous'
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 82
          Width = 146
          Height = 13
          Caption = 'Horizontal Grid Interval [Kbase]'
        end
        object SpinEditHorizontalGrid: TSpinEdit
          Left = 170
          Top = 79
          Width = 55
          Height = 22
          Increment = 50
          MaxValue = 15000
          MinValue = 0
          TabOrder = 0
          Value = 50
          OnChange = ReplotEverythingEvent
        end
        object RadioGroupAutoSave: TRadioGroup
          Left = 10
          Top = 22
          Width = 625
          Height = 41
          Caption = 'AutoSave to Clipboard'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Single-Row, Constant-Scale Chart'
            'Multi-Row, Variable-Scaled Chart'
            'None')
          TabOrder = 1
        end
        object CheckBoxShowTitle: TCheckBox
          Left = 10
          Top = 148
          Width = 97
          Height = 17
          Caption = 'Show Title'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = ReplotEverythingEvent
        end
        object CheckBoxVerticalTicks: TCheckBox
          Left = 10
          Top = 116
          Width = 127
          Height = 17
          Caption = 'X-Axis Tick Marks'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = ReplotEverythingEvent
        end
      end
    end
    object TabSheetAbout: TTabSheet
      Caption = 'About'
      ImageIndex = 5
      object PanelAdvertisement: TPanel
        Left = 288
        Top = 5
        Width = 425
        Height = 340
        TabOrder = 0
        object LabelLabName: TLabel
          Left = 10
          Top = 160
          Width = 407
          Height = 24
          Alignment = taCenter
          AutoSize = False
          Caption = 'Gerton Lab'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelStowersURL: TLabel
          Left = 10
          Top = 203
          Width = 407
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'www.stowers-institute.org/labs/Gerton/2003/cohesin'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelStowersURLClick
        end
        object LabelPIName: TLabel
          Left = 10
          Top = 181
          Width = 407
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Jennifer Gerton, PhD'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object LabelProgrammerName: TLabel
          Left = 10
          Top = 233
          Width = 407
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Scientific Programmer: Earl F. Glynn'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object LabelProgramName: TLabel
          Left = 10
          Top = 105
          Width = 407
          Height = 36
          Alignment = taCenter
          AutoSize = False
          Caption = 'PeakFinder'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object LabelProgramDate: TLabel
          Left = 10
          Top = 140
          Width = 407
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '<Transfer Date Version from Splash Screen>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object LabelAbout: TLabel
          Left = 10
          Top = 257
          Width = 407
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Artwork:  Jeff Nevinski'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Image1: TImage
          Left = 97
          Top = 6
          Width = 228
          Height = 96
          AutoSize = True
          Picture.Data = {
            0A544A504547496D6167658E8B0000FFD8FFE000104A46494600010201004800
            480000FFE10BF74578696600004D4D002A000000080007011200030000000100
            010000011A00050000000100000062011B0005000000010000006A0128000300
            0000010002000001310002000000140000007201320002000000140000008687
            690004000000010000009C000000C80000004800000001000000480000000141
            646F62652050686F746F73686F7020372E3000323030333A30383A3235203130
            3A31383A32370000000003A001000300000001FFFF0000A00200040000000100
            0000E4A003000400000001000000600000000000000006010300030000000100
            060000011A00050000000100000116011B0005000000010000011E0128000300
            00000100020000020100040000000100000126020200040000000100000AC900
            00000000000048000000010000004800000001FFD8FFE000104A464946000102
            01004800480000FFED000C41646F62655F434D0002FFEE000E41646F62650064
            8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
            131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
            110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0CFFC00011080036008003012200021101031101FFDD
            00040008FFC4013F000001050101010101010000000000000003000102040506
            0708090A0B010001050101010101010000000000000001000203040506070809
            0A0B1000010401030204020507060805030C3301000211030421123105415161
            1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
            3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
            85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
            B7C7D7E7F7110002020102040403040506070706053501000211032131120441
            51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
            250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
            94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
            8797A7B7C7FFDA000C03010002110311003F00BFFF003BCBE861A9AD6D87E9EE
            13AF1EDD51F23AE66D94536636D658F9DD5403F44B9B2EDFF458EDAB836E409E
            61DD87F7146AECB99B6C0659331F110F615270ACE27D2335D9E7031B3B04870B
            19BEC635A6C1B8B5AD15BC377BF636D36FFD72B67AB622F4FCDC7CC6EC1A5EC6
            35D6D7CF23DCFACFE757B9727D27EB3D1553F62EAD47DB703DD0F89B6BDC23DB
            AB3D567F23F9EABFC17FA35D08E8745753333A36606572DC9A378758C7482C67
            EB15BDB73EBB37FF0086AEFF007A61046EBC1076759F41E1A35531821DF9DA46
            BF15CE7FCF4762DC29CEC563B6C36D7E3D81DEE8FD26C04BEB76CFF43EAB16D1
            EA74DD84DCBC1BDAF6D87687B7520F3B1D53FDD4DBB7F9C659F4134990A4800B
            75C3171603A0D8EE0727E699ED0ED7C566B2C758F0FB000E81A81A93FBEEFE5A
            D0A4CB639275F3412193431A20043734124C6A514D71A9D0043A98E2007E8402
            49F8140903729ABE888C8517DF5D4D9B0C780EE7FAA15835B66791DA395CC646
            697E4DA5EEDDB1EE6827C012006A31903B20821D5FDA0F3310DD74F1FEAABB55
            E482D780DB1A48734198FBA573ACCB6CCBC4FC395670F21D65BB69B600692E69
            3B7DBFBA3F94F44923A28005DB2E693F4879A8907B2CCB338BED0D7550C6176E
            9303C03DC55EC12F7B1EEDFB81D5B3C811F9DAFB7DA99C75D1770F8BFFD0E3F7
            EA3C02B35DFEC23520F20680C713CFB9AA9FC149AEEDD94F4C36DB6E437C448E
            C7B2D4E99F5872F031DD4D241ACBB7861305B3EDB9ACB5BEE6D5737E9FE7B2CF
            D354B04BA4C8EC0414EDB0801BC0E67B843855C4F4D9FD5B0F20BAE66DF5AB78
            654C652D6E3D81AEF5BED2FA8BBF45BDAED9762EFC9FD37E9B7FE96C55E8EA0E
            A9CFB71DFF0064B0EADA592E6924CB8B7D5DFF00A26ED6FEAF6BDFFF0002B229
            C9706B41F7D6C25C2A33B35FA5EC9F6EE8F7A6F5B496925BE0790521109323BB
            DBE07D65C5BA199318AF2603899A8F11EE3EFA777FC2FE8BFE197498D73316C1
            65E4B1A241906648D1ADFDF73BF71ABCA5B74F9F88F2EEB431BAE67D0D631B7B
            9F5B1BB2B65849D8D3F994BBE9D3FD8FF8B4C962BD970CBDDF58A0BAF21E58E6
            57C9DD1C7EEF2A19797D329796DD6B28DA3DDA7BA3F34680FF0098BCEE9FAC3B
            AA6E35B5ECA5C3F4C373DFEAB81DCCF5438EEF4777B9D4D5FCEFF85F5119FD56
            BB21C039C3F78B8973A3E8B5B3BBD2ADBB7FAE99EC9EABFDD0F4B9FF0058B1B1
            C39988C3659B7F46E7C16349FCFB9BF4BF94CAD735265D6587DCF3B8F89250DB
            9209DF68FEAD6068A3F6B6924BD9A7682477EFB93A38C0D820E4B6C56DB6C21A
            D9F7E9278041D7FE8A25367A5607540B23E893CB8FEFEAABD19B531C0BB748DC
            76B7B6E6ED3EEFA3EE7207ED2C761DC5CD6EBA92635FDDD4A2628127A6A72B75
            26BB5B009105BA0F0FD27D273959A29A9D8EF654EDCDB1A77B3500F6F7BA172F
            4F5FA9F0CAAC6D9330C69078F9A9D9F5968AA31EB05B7B8CBCB24F7F6FF219B5
            466046DA3209C4EFABFFD1E2B73408041F0F0FBD271F1D14ABC7BDF4078A2C7B
            377A62DAD8E7B4BA03BD2DEC6B9BEB6D7FD041739AC76C2E878D0D6F96BC7C58
            E4FF0070B1F004A0E93C8E74489E3E33F11F34F85899795915D38CC7DF7BF71A
            F1EA1B9E4346F2EDA3F92158BFA5F51AAA2FC9E9F97430CC59663DAD6CFD12D7
            4B11F73C15C081AEDA4F9F0A73B4C1FB8AAAD7482D638380FA4DE08FE4B9A542
            6B2E25D3AF87E40025EE1E811C3E2DD6DAD9FA5A8E12396C69220C8E6383F054
            86AE2048601267B0F8A7274DE0E9E24803E4971CBC15C21BECB3A8DB43EFA71D
            EEC6AE77DE2B7BD8C23E96FB583D36FA7B9BEA6F77B1337AAE4B5A4D61B5CF27
            57FF00576B47E72DAC1EBB88CC2E9B4D808A2BB5ADEA2C02C71650286F4F7370
            75AE9FD6EB7752BB33F47EBD6FEA76BF12CFB47E9D3D1D67EAED25B926AFD645
            F4DEFAEAC2AAB6FEAF6BAE63319FEA3BEC75E4558D82CB3D1FF4B9B6647AFEAF
            EACDE33DD770871EF3D51995F65BADB8E613B4D15B83DC1FAFE87D3C4759FA76
            EDFD263FF3D57F85AD0B270FA9343ACCAA725AD686EE75EC7B7471F4987F4CD6
            FD3B5BE9B7FE116AD795854F5DAF3EC752DE979BB1A7D16B4DC296FD9F2B22BB
            71B19F5D95665CEA3F6767E459E9FAFEB667E8FD1B126759C37D36E4F51C7A6E
            EA16DF9374B71996564D98EEA29707DEFDF5EECFC8B33EFA7FD233FC0A1AF74D
            395854675AE7558B63B7105F64D82B606361A6CBAEBADAA9A2B6EFD9BECB3E9D
            9E9FF84620115BA24832091D974FFB5FEA8FA96B1AC7B71733243F2A9188C603
            4B2EC8C8A29DD5BB7B717F47D27D4C5A3FD1E559E97DAAFF00D5F1FA8F52AF3A
            966362D1451BDD6DD997371AAA249B08C76FE8BD4B2BC7A71ABAACF4AABFFA45
            F6FF003C96A4A8D00DB1F527ADFEC4775E35346336BF54D7BFF4E298DFF68D85
            8E6EDF4FF4BE97ABEAFA7FF6DAC663C321CD71F8011F916F5DF5FF00AC5DD13F
            61D4D6578ECAC51F68209B9D4B5A2B0CB3E8D5EA39BF4DECABFF005273A0BC80
            E68907CF403E691F05A09EAFFFD2ECFEAEB316BE8D8D5F4A79BF15A6D9BDA36E
            EF7D9EB7E8C7D07FAE53758661FD867AB5947D9C0F7B73057F463D85DEB0FA5F
            EBFCE2F9E1245675EAFB47D4CC7FA9F5757C8B7A2653B2729F8EE1650E6B9943
            2AF52A363E9F56BF737D6F41BFCFAEB1ADBCD841758DB36016B9927C761885F3
            5A490EAA3B87DC3EB2FF00CCF6070FACDF647DBA7BBFED5FF67ECBE9F50FF3D7
            1F91D2FEA0DE0BFA4F59BB0DE492DAF2687DD57F5777A54E435BFD775ABCFD24
            0AEEDFB5DAB4318E2D259643B47B4BB618D3DBEAB6AFA5FD44E5A5C007BDAC1F
            9A6CDDE1F9BE932C588924B5DB6877ABB0386DE0D80388E07BB5DBFF0050AF65
            E06257436CABA9E36459CFA22BC8AECF84FA2FA3FF00045CB249283D6F40C5E8
            9957DADEA998EE9F432BF6BAA6FA96BEC276B7745776DAEAF758FF0051BFA4FA
            152D5B3A2FD55D8EF47EB1D8200F50DD86F731C7C6B157A2E67FD5AF3D4925C1
            E8B3F1EBC6B7653934E734F16638B59FF6E33229A76FF63D555EB16BA60EDF1E
            E562A492D3BBB07E97203A4FC67E4A72F048709F31E0B112454FFFD9FFED10B4
            50686F746F73686F7020332E30003842494D0425000000000010000000000000
            000000000000000000003842494D03ED00000000001000480000000100010048
            0000000100013842494D042600000000000E000000000000000000003F800000
            3842494D040D000000000004000000783842494D04190000000000040000001E
            3842494D03F3000000000009000000000000000001003842494D040A00000000
            000100003842494D271000000000000A000100000000000000013842494D03F5
            000000000048002F66660001006C66660006000000000001002F6666000100A1
            999A0006000000000001003200000001005A0000000600000000000100350000
            0001002D000000060000000000013842494D03F80000000000700000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF03E800003842494D040000000000000200023842494D04020000
            000000060000000000003842494D040800000000001000000001000002400000
            0240000000003842494D041E000000000004000000003842494D041A00000000
            034900000006000000000000000000000060000000E40000000A0055006E0074
            00690074006C00650064002D0033000000010000000000000000000000000000
            0000000000010000000000000000000000E40000006000000000000000000000
            0000000000000100000000000000000000000000000000000000100000000100
            00000000006E756C6C0000000200000006626F756E64734F626A630000000100
            0000000000526374310000000400000000546F70206C6F6E6700000000000000
            004C6566746C6F6E67000000000000000042746F6D6C6F6E6700000060000000
            00526768746C6F6E67000000E400000006736C69636573566C4C73000000014F
            626A6300000001000000000005736C6963650000001200000007736C69636549
            446C6F6E67000000000000000767726F757049446C6F6E670000000000000006
            6F726967696E656E756D0000000C45536C6963654F726967696E0000000D6175
            746F47656E6572617465640000000054797065656E756D0000000A45536C6963
            655479706500000000496D672000000006626F756E64734F626A630000000100
            0000000000526374310000000400000000546F70206C6F6E6700000000000000
            004C6566746C6F6E67000000000000000042746F6D6C6F6E6700000060000000
            00526768746C6F6E67000000E40000000375726C544558540000000100000000
            00006E756C6C54455854000000010000000000004D7367655445585400000001
            000000000006616C74546167544558540000000100000000000E63656C6C5465
            7874497348544D4C626F6F6C010000000863656C6C5465787454455854000000
            01000000000009686F727A416C69676E656E756D0000000F45536C696365486F
            727A416C69676E0000000764656661756C740000000976657274416C69676E65
            6E756D0000000F45536C69636556657274416C69676E0000000764656661756C
            740000000B6267436F6C6F7254797065656E756D0000001145536C6963654247
            436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C6F
            6E67000000000000000A6C6566744F75747365746C6F6E67000000000000000C
            626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F7574
            7365746C6F6E6700000000003842494D041100000000000101003842494D0414
            000000000004000000073842494D040C000000000AE500000001000000800000
            0036000001800000510000000AC900180001FFD8FFE000104A46494600010201
            004800480000FFED000C41646F62655F434D0002FFEE000E41646F6265006480
            00000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813
            1315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E1411
            0C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0CFFC00011080036008003012200021101031101FFDD00
            040008FFC4013F00000105010101010101000000000000000300010204050607
            08090A0B0100010501010101010100000000000000010002030405060708090A
            0B1000010401030204020507060805030C330100021103042112310541516113
            22718132061491A1B14223241552C16233347282D14307259253F0E1F1637335
            16A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485
            B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7
            C7D7E7F711000202010204040304050607070605350100021103213112044151
            617122130532819114A1B14223C152D1F0332462E1728292435315637334F125
            0616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694
            A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757677787
            97A7B7C7FFDA000C03010002110311003F00BFFF003BCBE861A9AD6D87E9EE13
            AF1EDD51F23AE66D94536636D658F9DD5403F44B9B2EDFF458EDAB836E409E61
            DD87F7146AECB99B6C0659331F110F615270ACE27D2335D9E7031B3B04870B19
            BEC635A6C1B8B5AD15BC377BF636D36FFD72B67AB622F4FCDC7CC6EC1A5EC635
            D6D7CF23DCFACFE757B9727D27EB3D1553F62EAD47DB703DD0F89B6BDC23DBAB
            3D567F23F9EABFC17FA35D08E8745753333A36606572DC9A378758C7482C67EB
            15BDB73EBB37FF0086AEFF007A61046EBC1076759F41E1A35531821DF9DA46BF
            15CE7FCF4762DC29CEC563B6C36D7E3D81DEE8FD26C04BEB76CFF43EAB16D1EA
            74DD84DCBC1BDAF6D87687B7520F3B1D53FDD4DBB7F9C659F4134990A4800B75
            C3171603A0D8EE0727E699ED0ED7C566B2C758F0FB000E81A81A93FBEEFE5AD0
            A4CB639275F3412193431A20043734124C6A514D71A9D0043A98E2007E840249
            F8140903729ABE888C8517DF5D4D9B0C780EE7FAA15835B66791DA395CC64669
            7E4DA5EEDDB1EE6827C012006A31903B20821D5FDA0F3310DD74F1FEAABB55E4
            82D780DB1A48734198FBA573ACCB6CCBC4FC395670F21D65BB69B600692E693B
            7DBFBA3F94F44923A28005DB2E693F4879A8907B2CCB338BED0D7550C6176E93
            03C03DC55EC12F7B1EEDFB81D5B3C811F9DAFB7DA99C75D1770F8BFFD0E3F7EA
            3C02B35DFEC23520F20680C713CFB9AA9FC149AEEDD94F4C36DB6E437C448EC7
            B2D4E99F5872F031DD4D241ACBB7861305B3EDB9ACB5BEE6D5737E9FE7B2CFD3
            54B04BA4C8EC0414EDB0801BC0E67B843855C4F4D9FD5B0F20BAE66DF5AB7865
            4C652D6E3D81AEF5BED2FA8BBF45BDAED9762EFC9FD37E9B7FE96C55E8EA0EA9
            CFB71DFF0064B0EADA592E6924CB8B7D5DFF00A26ED6FEAF6BDFFF0002B229C9
            706B41F7D6C25C2A33B35FA5EC9F6EE8F7A6F5B496925BE0790521109323BBDB
            E07D65C5BA199318AF2603899A8F11EE3EFA777FC2FE8BFE197498D73316C165
            E4B1A241906648D1ADFDF73BF71ABCA5B74F9F88F2EEB431BAE67D0D631B7B9F
            5B1BB2B65849D8D3F994BBE9D3FD8FF8B4C962BD970CBDDF58A0BAF21E58E657
            C9DD1C7EEF2A19797D329796DD6B28DA3DDA7BA3F34680FF0098BCEE9FAC3BAA
            6E35B5ECA5C3F4C373DFEAB81DCCF5438EEF4777B9D4D5FCEFF85F5119FD56BB
            21C039C3F78B8973A3E8B5B3BBD2ADBB7FAE99EC9EABFDD0F4B9FF0058B1B1C3
            9988C3659B7F46E7C16349FCFB9BF4BF94CAD735265D6587DCF3B8F89250DB92
            09DF68FEAD6068A3F6B6924BD9A7682477EFB93A38C0D820E4B6C56DB6C21AD9
            F7E9278041D7FE8A25367A5607540B23E893CB8FEFEAABD19B531C0BB748DC76
            B7B6E6ED3EEFA3EE7207ED2C761DC5CD6EBA92635FDDD4A2628127A6A72B7526
            BB5B009105BA0F0FD27D273959A29A9D8EF654EDCDB1A77B3500F6F7BA172F4F
            5FA9F0CAAC6D9330C69078F9A9D9F5968AA31EB05B7B8CBCB24F7F6FF219B546
            6046DA3209C4EFABFFD1E2B73408041F0F0FBD271F1D14ABC7BDF4078A2C7B37
            7A62DAD8E7B4BA03BD2DEC6B9BEB6D7FD041739AC76C2E878D0D6F96BC7C58E4
            FF0070B1F004A0E93C8E74489E3E33F11F34F85899795915D38CC7DF7BF71AF1
            EA1B9E4346F2EDA3F92158BFA5F51AAA2FC9E9F97430CC59663DAD6CFD12D74B
            11F73C15C081AEDA4F9F0A73B4C1FB8AAAD7482D638380FA4DE08FE4B9A5426B
            2E25D3AF87E40025EE1E811C3E2DD6DAD9FA5A8E12396C69220C8E6383F05486
            AE2048601267B0F8A7274DE0E9E24803E4971CBC15C21BECB3A8DB43EFA71DEE
            C6AE77DE2B7BD8C23E96FB583D36FA7B9BEA6F77B1337AAE4B5A4D61B5CF2757
            FF00576B47E72DAC1EBB88CC2E9B4D808A2BB5ADEA2C02C71650286F4F737075
            AE9FD6EB7752BB33F47EBD6FEA76BF12CFB47E9D3D1D67EAED25B926AFD645F4
            DEFAEAC2AAB6FEAF6BAE63319FEA3BEC75E4558D82CB3D1FF4B9B6647AFEAFEA
            CDE33DD770871EF3D51995F65BADB8E613B4D15B83DC1FAFE87D3C4759FA76ED
            FD263FF3D57F85AD0B270FA9343ACCAA725AD686EE75EC7B7471F4987F4CD6FD
            3B5BE9B7FE116AD795854F5DAF3EC752DE979BB1A7D16B4DC296FD9F2B22BB71
            B19F5D95665CEA3F6767E459E9FAFEB667E8FD1B126759C37D36E4F51C7A6EEA
            16DF9374B71996564D98EEA29707DEFDF5EECFC8B33EFA7FD233FC0A1AF74D39
            5854675AE7558B63B7105F64D82B606361A6CBAEBADAA9A2B6EFD9BECB3E9D9E
            9FF84620115BA24832091D974FFB5FEA8FA96B1AC7B71733243F2A9188C6034B
            2EC8C8A29DD5BB7B717F47D27D4C5A3FD1E559E97DAAFF00D5F1FA8F52AF3A96
            6362D1451BDD6DD997371AAA249B08C76FE8BD4B2BC7A71ABAACF4AABFFA45F6
            FF003C96A4A8D00DB1F527ADFEC4775E35346336BF54D7BFF4E298DFF68D858E
            6EDF4FF4BE97ABEAFA7FF6DAC663C321CD71F8011F916F5DF5FF00AC5DD13F61
            D4D6578ECAC51F68209B9D4B5A2B0CB3E8D5EA39BF4DECABFF005273A0BC80E6
            8907CF403E691F05A09EAFFFD2ECFEAEB316BE8D8D5F4A79BF15A6D9BDA36EEF
            7D9EB7E8C7D07FAE53758661FD867AB5947D9C0F7B73057F463D85DEB0FA5FEB
            FCE2F9E1245675EAFB47D4CC7FA9F5757C8B7A2653B2729F8EE1650E6B99432A
            F52A363E9F56BF737D6F41BFCFAEB1ADBCD841758DB36016B9927C761885F35A
            490EAA3B87DC3EB2FF00CCF6070FACDF647DBA7BBFED5FF67ECBE9F50FF3D71F
            91D2FEA0DE0BFA4F59BB0DE492DAF2687DD57F5777A54E435BFD775ABCFD240A
            EEDFB5DAB4318E2D259643B47B4BB618D3DBEAB6AFA5FD44E5A5C007BDAC1F9A
            6CDDE1F9BE932C588924B5DB6877ABB0386DE0D80388E07BB5DBFF0050AF65E0
            6257436CABA9E36459CFA22BC8AECF84FA2FA3FF00045CB249283D6F40C5E899
            57DADEA998EE9F432BF6BAA6FA96BEC276B7745776DAEAF758FF0051BFA4FA15
            2D5B3A2FD55D8EF47EB1D8200F50DD86F731C7C6B157A2E67FD5AF3D4925C1E8
            B3F1EBC6B7653934E734F16638B59FF6E33229A76FF63D555EB16BA60EDF1EE5
            62A492D3BBB07E97203A4FC67E4A72F048709F31E0B112454FFFD9003842494D
            042100000000005500000001010000000F00410064006F006200650020005000
            68006F0074006F00730068006F00700000001300410064006F00620065002000
            500068006F0074006F00730068006F007000200037002E003000000001003842
            494D04060000000000070008000000010100FFE11248687474703A2F2F6E732E
            61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567
            696E3D27EFBBBF272069643D2757354D304D7043656869487A7265537A4E5463
            7A6B633964273F3E0A3C3F61646F62652D7861702D66696C7465727320657363
            3D224352223F3E0A3C783A7861706D65746120786D6C6E733A783D2761646F62
            653A6E733A6D6574612F2720783A786170746B3D27584D5020746F6F6C6B6974
            20322E382E322D33332C206672616D65776F726B20312E35273E0A3C7264663A
            52444620786D6C6E733A7264663D27687474703A2F2F7777772E77332E6F7267
            2F313939392F30322F32322D7264662D73796E7461782D6E73232720786D6C6E
            733A69583D27687474703A2F2F6E732E61646F62652E636F6D2F69582F312E30
            2F273E0A0A203C7264663A4465736372697074696F6E2061626F75743D277575
            69643A36313564646137352D643730642D313164372D626633332D3864303565
            61336663363063270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E
            732E61646F62652E636F6D2F7861702F312E302F6D6D2F273E0A20203C786170
            4D4D3A446F63756D656E7449443E61646F62653A646F6369643A70686F746F73
            686F703A36313564646137322D643730642D313164372D626633332D38643035
            65613366633630633C2F7861704D4D3A446F63756D656E7449443E0A203C2F72
            64663A4465736372697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A
            7861706D6574613E0A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020200A202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            200A202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020200A20202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020200A2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020200A202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020200A20202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020200A2020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020202020200A
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020200A202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020200A20202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020200A2020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020200A202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020200A20202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020202020200A2020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A2020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020200A202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020200A20202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020200A2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020200A202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020200A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            0A20202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020200A2020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020200A202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020200A20202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020200A2020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020200A202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020200A20
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020200A20202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020200A202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            200A202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020200A20202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020200A2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020200A202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A3C3F787061636B657420656E643D2777273F3EFFEE000E
            41646F626500644000000001FFDB008400010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010102020202
            0202020202020203030303030303030303010101010101010101010102020102
            0203030303030303030303030303030303030303030303030303030303030303
            030303030303030303030303030303030303FFC0001108006000E40301110002
            1101031101FFDD0004001DFFC401A20000000602030100000000000000000000
            070806050409030A0201000B0100000603010101000000000000000000060504
            030702080109000A0B1000020103040103030203030302060975010203041105
            120621071322000831144132231509514216612433175271811862912543A1B1
            F02634720A19C1D13527E1533682F192A24454734546374763285556571AB2C2
            D2E2F2648374938465A3B3C3D3E3293866F3752A393A48494A58595A6768696A
            767778797A85868788898A9495969798999AA4A5A6A7A8A9AAB4B5B6B7B8B9BA
            C4C5C6C7C8C9CAD4D5D6D7D8D9DAE4E5E6E7E8E9EAF4F5F6F7F8F9FA11000201
            0302040403050404040606056D01020311042112053106002213415107326114
            7108428123911552A162163309B124C1D14372F017E18234259253186344F1A2
            B226351954364564270A7383934674C2D2E2F255657556378485A3B3C3D3E3F3
            291A94A4B4C4D4E4F495A5B5C5D5E5F52847576638768696A6B6C6D6E6F66777
            8797A7B7C7D7E7F7485868788898A8B8C8D8E8F839495969798999A9B9C9D9E9
            F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C03010002110311003F00BF6DB3
            F253AE37160177253E7A91282D3F92099EF5D1494D4F054CB00A587CB2CD314A
            85D010319092002411ECDCC454D0E0F4580D4D0647AFF9FA0CCFCE2EB093334D
            8F8319B89E81AABEDABEBE7FB2A2ACC7C6C03A56C9859656AAFB5F1DDFF71E29
            34A9F4DF8F7422869A491EB4E95AC2A54FEA0D5E9FECF4B1EC1F93183DB7B5F1
            3BAF6B5026EBC3662892BE9F30F5DFC3F150C12A0748A48D639B253D7853730A
            A269B105C11EF74A61412D4FF57E5D51231DDE23528698CF41EFC7EF98186EE6
            DD31F5FE53114D83DDB5B4B97C86224C654CD5389CBD1E191279E075A92D5141
            92FB56791632F209238CB704806EB1B94D4CB81FEAC75B95A346528FC4D299AF
            F2C74B1F915DDD9BE983B2A9F0F82A6C955EE1C94F5B93932C1A1C7D2ED3C349
            46738292A4D65204CF56C555A68C9F2A07524A31D23DA59264578D15AB9C8142
            69FCFA516F11912676421694526A006F53C2A29E59CF974A3E82EFBDA3F216A3
            79526D886AF1753B36AB1C26A5AFACA3A8AAADA0C9356C74B908E1A562F04425
            A231C88F72923017F6FC8EB14492B2D351A7E7D27D0DE2347E2D682BD1A7A6C1
            D3985A360598293A9AC19998B5AC7FB3F4F65735CB789556A0A74B23810A10E7
            1D447C0144663AAD622C2E4D870A07A7F1FD7DEFEB6AC318EB66D48AD7FD9E92
            F558E646D1C1B9B2EA0750F513A49B8BFF00B1FCFB328645916B5A50745F3218
            9A94AD7A9B55B472B0534354D0978A50194C776602D705C116D3636B83EFD0DF
            DAB48635968FF3E9A9AD6E11164D155C74E189EBBCD646551352CD470B68BB4D
            1B2FEDB589655FC90BF83FD7DD2EB7AB3B75EC70EFE80FF87A72DF6BBBB86AC9
            1155F53D0DDB57A931504EF5151AE6542BA0542ADF5281C050006B1FC91EC377
            5BECD380A9D829922BFE7E3D1D47B5C16CC19BBBE58A74B1CB51E2B14BF65430
            C06A031F295B13113627C801B97B7E3D95ACAF23D598D2B8CE3A3458502D5547
            41665312B3F903AABEB704A3A8B13FD42DAC6C07E3DAE8EE1A33A95A94C74D49
            6AAEAC0E6BD43A0DA38D6A8A7AB7D378995BEDC0B2706E3573F4E3E838E7DBE7
            7294C6F1EAA96F33E5F674C2EDC9AD18E1474BD5A2A5821760904719B073A428
            0A383A998F1A6FFE27D978B8766035D7FC9D2E16D18074AD3A0FF7062292B665
            0B0A4822D4449CD8AB5BE8A0AA95B0BFB30B7BD9E00FA65A13C7ECE924B6114A
            D565C8E93B350880054708BFD9B1014D96E4FA493CFF00BDFB67C6F11CF755BA
            71210840A629D37480D985CBE924DDAFA75585AD6371FF001BF77A9ED15F2EB5
            2350900529FCFAE315446A515C3DC9BF07D3A540F4B13C9BFF004F6F8504020D
            31FEA3D325C015A8E9FD2AD664200509650C38BE95E2E3F1F9F6D10CA41031D6
            83A35457A496E6DE18EDAD0C4F50CEEF3CE23A7A688A09A5416F248A18AAAC71
            01C926DC81ED42CAC74A9634FB7A68C684E2801E92751DBD450180E3A2138D61
            27479424BA48D42C54B471817BDEE6E4722DEDC32B3BAA94AD079F5A581550D1
            FBFE5E9E7D081B5F7E617714E946950532669BEEBED5980591118A540A77E167
            34EE06B160406F6AA37925D691A8523D456A3E47CBA4D2C42321D98B0E38AE3A
            11457150044D66B72C6E48FE9CF3FD7DB135B385345C8F4EAF15CAEAAD3F33EB
            D36D54A58B39881626FA9813A7FC41B1FF007A3ECA64574254D40E8DE3950A0A
            71E9A2682798492A2AC51AA5EE470FAB9B0B016371FE1EDB53A2B56AFCBAB020
            92699E93D2AD90FA483C920FEA1CDF9B7016FF00EF5ED4A82C4538F0E923706F
            2EA1DE4D7AFC9E9D1FA753DED7BDB4FD3DADF09F4FC5E5FE4E1F6D7A4BF539D1
            5C7F93AFFFD0207B03BF7776D9A1ACC3BE42B65A0A8AAA5ADA790CADE7C75751
            7114D1B2396B283C716E05C7B1DDCC30960DA416008A7A83FF0015D04219A600
            80C4034E1C71D08189EE1FE29996C956E42A298B2B54D4D6CADE595E40D1A34C
            8B254D39A895DC86F186D5F5B5C7B4CD1460762F9F0F4E942DC4808D4D9F33C6
            BD1D6A6F937D6ABD21B436A1ADFBCAEC4CB97C7663233514B4B4D454D535D2D5
            505755C8B5321FBFAA9AAA4442C4A345159B49B7B4296D7935CC9AA30B180282
            B96F5A0E141E7E75F5E96B5D59C3044E92969189D58C2FDA6B827CBCBA17FE20
            EF6DA7D77DFDD4FBE70D5559B937360EBE25AFA4C4D552CD8CACDADB8B1B3E37
            72C294192C5E3EAA7C8E370F59395D33089A7894ACDA01251DE998C33C6CBA61
            35AFA820E3FC1D2CB5F01E4899652D2F103CBEDE1D5F67CA0A1EA5DEFB676C6E
            6C9F61ED5EB7AEC75155556DECA6ECC6E2AAB61EEBA7DDD4F8EAE8B6EEFDA096
            2FE235DB7F24F8C89D850CF0D4472233A970AEAC122B2A16658EBF2F3F5A83EA
            3CBA11C728A18B502BC4D7E58A1F2A1FDBD509C9D93B67AA77065576E762D4E6
            73B3255C5057EC8DA5B7A9B1555959E9EBE4A9DB0B162E5A6CFA2E13318FA7A7
            9A6AB32F80CA240E44AEBECFEDA2B89D02C90698F0724F9675F77AE7871CD3A4
            37525BC1296D6A4D7F0A8A702348A671839FB7AB80F8A9F21B27D8FB7F6FEDFE
            C75C6E2F7FE4E1A88F055714894F1EF718A8677CCB5263E40A53318014CF1D67
            84352CD2C52B40DFB6E8A86F2DE35791A324A8E3C702B406BF3F2EB703B1035A
            52A7E5C7D3F2F3A7478A7A08E4A3D31C91B545BD4A0FAC5F9202F06D73ECB526
            A38D4B8E964884A931B8D7D42A4DAF8D69A39EB55E7616261FD2A597E8A4D870
            4FFB0F6ECBB8C8958E11A45283A6576F567124A75127A13A8A7A573053CD1532
            42B24652328BA6109CAC60E9FEA07D7D943B3D59CB9D7E67A38541A687A5C038
            D2249D846B04280CD50D64A787904992572B1A2003F2793ED2558914AFD9E7D3
            6C5954D31D163ED2EFFA5A15C9E27663C1AF1F56D8FC857CC48AA984522C75CF
            8F8D0D928A112053293E5D40FA1459BDAFB7B296468A49310B57FD47CC754699
            23593B834EA323CBFD93FCBA81B2F73D664698E5323534271F33A78A78EA5A59
            599ADADAA7CA35C720FA95E4DBEBEFD3C423D343DA3A72298CA42FF87A12A6F1
            141246AB209115964235232B0B8653F9366B83ED2EA6734AD074FE056BC7A826
            D1C840252DFEC383F41F8E38FF00603DB8A08193D6BA815555E52D0BC9A911B5
            052D65038FE848279FF5F8F6E2A5003A295E9991C13A6BD33CE85AE526163C01
            EA1603E8A0FE3FE29EDD19F85ABE5F9F540E40D278F504D3C46CF392E74B009C
            94041E0924EABAFF00B1E7DDBB94D028AF5A3DB9271D27EA62F1DC5C95B9D27F
            D40FC2DB83F9F6B6289DC5699C748A59A3566A9C74DCB03332D9353036246A24
            83C00003C9F660891A03AC600FDBD17C923310470AF410EFCEE4C3EC9ADA8C1A
            432643271D33B168668169A86A9D58414F52E5CB1956DADD1412AA45FEBEEC15
            640C30475B5570410D43FE4F5E8AC64F7866370CCD95A8C85557D4C518591D94
            86A78545FD2235F0C51163F4000B9F6C85546F0DC0CE7F674615A8EC26B4CF58
            20DC4F1C461B992A4B278845342605121B9151231508FA9B9BB00A3FAFB7005D
            4AC48A713F67CBE7F2EA87287483AFF3FF008AE87CC0E4F6B62A5C2D46DF39AD
            D192929125CACB571A53D3E1ABA19D804C63C4F4C669C49FA8994C4C38BDC9B2
            09B70FA63206915233F6EAF97E5EBD2C82C1AE02D57530FD87E5D198C166EB72
            988C7E4619A992292BD296A67AE7A78A59D96393EEE06A64954D3180A6A6700D
            AEA2C435FD95B7334914B4B821D47953247F448C7EDAF4A5B97A09518404A3D7
            19C03F9D4F5267DCF245364695A81ED89A09AB2B6B3CD1C946F22AC72C5052BD
            D24918C0E49361C8B7F89D9E60B5B95770AAAB80B9C96A806BE9D506C5716863
            5F10B1AF71A500143EB9C9E9B29F7DE2ABE66C7D3D5C0B3B789E67924D02286C
            F61F9BB4EEC140BF3ED36F5B9C1B7BE848CC8D4A9A70AFA57FD54E9FDAF6F9EF
            91A472116BE75AFDB4E9EE2805716681C4DE365590A104A97B9506D71626FF00
            9B1B7B55B6EF763731C6BAB4CCC6815A95AF1A01E7F2F5E916E3B45E5BC8CDA4
            B4205750E14F53E9D4BFE033EAF158F934F96D6E7C77B6BB5AD6FF0078BFB39F
            AB8F568A63F2A57D7A2AF024A5741EBFFFD1A3CA1CF53D6CE571F2CD1CF134C0
            D34CE7EE0C0246D323B222433369B6BB28B9BFA471EE4968DA35D6F4A5067E7D
            001255D6CAB5A57D7CBFCBD3F36E17A750892B46ED178DD01316B462010E1C69
            68EFFEC41FF0F6D784AC38D73FB3A71A703038D33F3FB7AC54792DD34D51598D
            846424A6AFA4A832507DCB430490D353CD5B29785A58E097C5042EE07A896034
            DDAC0AC852224332A92B9048C8FB0F913FCFA48F24C032248C15B88AE0FDA386
            3A1DBAFF00B02A46DFC7D02648C395C453144A946963965A3852567A3F2A3092
            7865406DF98DAC1BD3ED15EC11995E4315626F2F2AF97ECE95DA5C48B0468AFF
            00A8A70DF21FE4F975B097C28FE6C7B56868B6474CFCA54C44B8338CA1DB9B5B
            B6ABB0F0D7C38F1427ECF0F8FEC9C5D547928853C543A604CA53A93168513C4D
            A9A6015DC36392769A5B55EE06A5787DBA7FC34E85161BCC51AC71CEDC452BFE
            7FB7AB13ED6F801F1B7E41D266BB23604B47B477AEF1A48F29B7F7E6CDCC4D9F
            EBBAEC86AA49E0C8D66CAA7C91DA792A2AB7A50B3AD37841672E55A45B1205B9
            BDB41E003FA40E54F103E44E479D3A3B686DAE5BC429FA94C11C2BE581C7E7EB
            D13BECDF84FF002AFAF327B3FB3B11B57A8BB7323D6B8796A565EBA4CD61F72D
            34D063E89920A0D86D161A9725361AAA9A45A09319AAB25F26A910B9F56E2BE8
            504B1F892A4326083461C4F9F11E55C5074E496C6431B7831B325694AA9A53D3
            CCD7E7E7D287667F3523B3F015F4DDDBD65361779613701DB9344D92ADC24F57
            3D2403EEBF8CE2F2B8E9F21B77293D606893CAAD47A94EB9F827DDDB6C173A16
            CEE03D4549C1A0F3E1C719FF00274DA5EC76FE33DDC663D269435C9A798E23E5
            EBD1D0E8DFE621F1BFBBF374BB3B1F99A9D8BD89928B1A988DA5BF1F1F8FFE39
            59918A7228B099CA2ABACC55554C33D2B208666A6A8995A378E3612000BAEF67
            BCB65694A178856ACA3853D7A5F6DB958DCB787E285928280E2BC703D694E8E6
            7DF2498DCD64A549239B10C69169E162FE5C9811934A56C923F88CA84D872A7E
            B6BFB0CDEDE084AC2A3BDC57EC1EBFE6E8E6DA0129A90740343D12CDF5DC1BF6
            2DC72D2CDB8A69B1D4B2D2C2D82B53D3C31D3D284934CF0D146111E79F53A8BB
            481B4B37D00F679B6DBA49046F2A56422A5BCAA7D3D69D175FCAF14CCB081A09
            A53CCFAD7A8AFBAAB37DE7EAB234F8BA2C346DF6C69B1540C16A259228129C55
            4D573428D575D522CF33DD448D7213DABD12C1198BC7A8AF963FD43A461A1796
            BE153856B9FF0051E860C12CCAA9E5895DE588C6F09D242CC9A558E98885793C
            6BC9E0F3ECB25326BEFC8FB6BD2F84C417B0019E875C34C2A7194D1B0F19897C
            3A0B125514D949D42F6D3FD6FEE91C45AA40F3E9C790015E34EA44D46594589B
            7F85F9BFD6E7EBF4F6AE388290DF8BA4734C4FC3E5E9D456C6F908062FA7E9FE
            A09FA5EC3E86E3DBECAB404B768CF49F5B6A054648E837DBF3A22E7A17925916
            2C9D7D7BCF2CAF31686A7252D39946B66F0D3C322E88D56CAB1A036E7D8576BD
            FACA32FF0059269532A851FE98B549F90C54FCFA12EE9B3DD49E11B54AB0424F
            CF480401EA4E40E840A4DBAEF109A59808D9A02BEAB8657BC87D4AC010F18E0F
            D181F6A39A37C366B6F0EDCC3C53DCCC0034523B7F6F11F2E906C9B6ACCD34BB
            806D030AA7D41C923E5C3A835D81916B3C2D03C709A7F224C236B35434B6108B
            B7E23B9BFD2E3FD87B23DB79BEEED6031DC832814C9F880CD4934C9F99E8DEFB
            97ACEE9C4D03F85E440C8AFD9E5D01BF21ABE5DA1D4BBA7318AAC928ABA2C5C2
            E6A2290C1534AB57594D4602489768AA1FCF6E2CC3D8D13708EF96DCC126A85E
            847D9C7F23F2E83ABB7BDB3CA265A3AD453E7F6F9F551B49BD66AA9649357DC3
            44EE2795E532C9232E9FDF90B17652DAFD44DCF3CFB3BA3322D05011F6748A80
            166F3E9C5B7C2A2F84D4B46658F49D2DFA7559AC403A7E97B0F748E1624B797C
            F8D3ADBC8157867A5EE177760A63E2ADA84A37411E9A875BC7308ED649AC78D5
            7FF58F3ED2DCC13A92E8B507CB87E7F970E95DB4D0D3433D1BF91E9EAB676A85
            98E2F26AA8CC447351D50115D341642B130D3AC35AD71FEBF3ECACC871E2C648
            F4233D1A0503FB371F91C7D98E848EACDC3958EA586431D93936EE3A4D590C9D
            0CEF21F2B168D28CCCECF1AD4D6CA964B91E9527E83923DD2050D1149809BC94
            FF00AB80F3E8D6C27243A347D9E4C322BE99E854DE3DFF00B729A87358CA2908
            AB829E3A2831E2092290E856578E6964D4B24D34B2220E58BE9BF007B2DB6DB2
            E0F86F26232C0D41FF00570E9F9EE1589119FD400E0FA0E993696EBC1E6B6C63
            A0A581067E38AA6BF2D95ABA98696115AAB296134CF15A4C6E3D02246897691A
            D6B1901F6D6E092DBDCBBC8C7C1F2033507FC04E73E5E7D396AC9344B46A3532
            7E7FE5E85EE93FE313C8D1C81A582A1B5CD50CD2A41253A236BA97249F1471EB
            6F1A9009BF1C9F686F992520C5A96443823883EB8F3E9E89648D74C8C082335E
            047A53D3FC3D193F3E4BF89FDDDE3F05BC1F736FDAF078F4E8F15EFF00E73D3F
            D75FF8FB5BFBFEE7E92951F5FC381A69FE2FB7FE2F8745FF00BAE2F1FE1FF16E
            3F3AF1A7D94CFF00B3D7FFD2D761D676A59ABDAAA3A134E3C9088F53D43190B3
            42F24BE4D7180A0DAC49B1F72A865F1044B5727A8C8A1642FAF495E1FEAFB3A7
            CDB9909EBBC50D7D6B4AC62BC333217670DCB47249216BDAFF0091EF52A68F81
            7031D560D6CA4349DD9CF1E8C96D5185C9D2BE0774560A09169C36DAC8BA97A7
            927D7718BAB9028F044349682472C013E33FD9F69039562D171F3F974AF46AA2
            C8D423874C1F6DF6D520D3CCB4B3C324ABE62FE26731B9D57507946B8E7FD87F
            51EED24834F70A83E9D3B0A1FC2F4E955455B514C93B680F34CBAA581668C46E
            18583C6A6C81C8E45AC49FF1F69BC4145565341E74E9408882594F71F2A8AFE5
            FEAAF569DFCB7BF983E47E216E8CDF5EEFC4FE2FD25D835B8CA8C953D40782BB
            61E7A2A638BA6DCF8B9E49C8186680AAE569194B490A79E23E48F44855B9EDCB
            B8C6268540B95FCC1FB47F97CBA5FB7EE32D83B41302623EBE5F9F5B3E7FA718
            AAF0D0D162AB321B47372621B796DBCB63E8FF008ED0E53194B40D97445C4C12
            4755BA2872D8C73E15A56324D2B44D19660A1C1D75B604477F1010A4023CF383
            F67A742BB0DD14CCB178246A048F434CF1FB78FA8A8EA907E61F5AF6BEEC852B
            709B0BAE319D1D8CA47CAF58EE4D9B9EAADF9B83B02AFB1B3F430BE19376E336
            8D04A99DCBE7738924384AC871F438FA98E55A2924B38F76B2305A9D6D2C8B75
            51552005017D093902993C4D785074A2ECCB76348443064EA26AE49C52807993
            4007EDEAA2A8BAC77F673723E2B6952E537C54506333596AB8B0116472396C6E
            336E4714F5F555D458CA79F2F2CF8C791157442CCB2800016240CADF71B69212
            F247E138A608A035E057CB49F53D02E4B0B886E1349F116A72A4D469F23E75E1
            8F2CF56F5F0E7F9A7F666C5DB196EB6EE88B1FBDB6D6D2A1A2C1E23399AAD4C4
            76B6DEAAA8AD8F6FE3A8EA282AA0FB9DFF00FC2AA2A123AE49BC593A3A78DA46
            964D223F611E60E4DB5DC268EF6C9DA3B8938802A840AB1A1FC15A1A5307A136
            CDCD735BC6F6B7681A38FF001574B6702A0FC54F3F3F3E8E66CFEC0DBDBF6AAA
            7378DDC545B926A3CA4F47B8443286AEA1C9D348639F1D96C6CEB157E32B69A6
            528D0D44719056C011ED335B4B650852BA148ED07FC8781F9F4602E12E66662E
            19AB923C8FD9E5D0E54593C77922913EAD26922FA5D3C6A47D780081CFFAFECA
            27F1806690D471C67A3045898AAAFC4714E847C2EE88A8CC533AD4BAB542912E
            B0C4AB16D44C7705B520FEBF4E6FED206AAB62849E96988FCABD189EB9DC50E7
            B370628F9162A9A395E226210AC5242BE52ABC92CAF1291726FF004F7E13E8A8
            5E99683B0026807F33D18A930B4B4B0300C2FA753B923F4AF2CCC5B8B28FCDC5
            80F6D9B9673DE689D3688831A2B5E996B319535112263C69A897C335358D379A
            A202C05A9A291BCB2B54282B10D00CA4FA2E2E7D975F5F5E2AAC5682ACC0E707
            1E807A9F5E975BDBDA87D7390154FCE80FCCD283A6097AFB70D062E6961DAF90
            96AF2EAE831FA61333D3B133792A05399BC1253900B2B73EAB7D7D84E6D9AFD1
            16396D242CC09002D69FB3FCB4E8EE3DDEC9A6D4976834F9D683F9F1FCBA855F
            55518BC653E35E2FB0AAC7D1D343918A292366A3920A78E33046CE1CBBEB5605
            882059AFED3DC33BCCE266A95017FDE46903EDF5E9444A8D5923CA31241F5A9A
            D7ECF4EA38AE57C63D454DD5258E086294C8E5891F8F231B34CF7B9D3F5BDFFA
            7B4C502AD7C8E3A780D4CB9C5493E9D12FF9BEF3E1BE3EEEFC94ACB8D932B51B
            728601505962A84A8DC948DE24D62E2B678E9A42A8C09F1C4C4806DEC41CB131
            8F7482D81FD272C48F3C29229F9E491D16EF2911B39A56F890018F991FEC7F3E
            A8730FBB2B17F894718655AAAB96456917419174C62F196BEB899458016B9372
            38F7324C8AA91EAC10A07AF51FC321769286A9AC91F3E9FA2DC241D556C91CCC
            A1E3D47D31A2FADB591708CABC5CDF8E3DEA00A6A1739FDBD5E62550331A66BF
            674E91EE746A359FEED4C72248F1E97B9740C08291D91949FA0E38F6A8C543DC
            B9AF491650C0306143E63A67A4DFD9C8AACD2E2A3AB96695FF006423B49C3682
            06AB048980F55C9D2A2E491F5F7E6B3490076028307F2EBD1DEC88CC8A482785
            3D3AB0EF8FFDA465D8EFB4E57A58E8F1F5B5393CE64E3A486ADA49E79115EAD9
            645F04E21F108294190A93A383ACDA32E68B02B7C2E106A2D40AB5A53D28470A
            F1E879B05CAC96A22619526A7D7D7FD5E7D29A8FA7A6DE3927A9A299F1D475F5
            13D5354D7C96A8A6A01219E7ADD605A7AD9229004450029205C7D7D94C3BBBC4
            562700D07970AF98FDA38F4672D944124910B06639F5E3FEAC749DDCD889764D
            5A633015144F8986A62FBE88C2F3D5CCD00658A9A7955F51D3A4492C6A54B3B2
            DEF65F6670E9DC9B5BA9F13803C067CC1A7A79F9745A1E5B25A020283C0F1FB3
            ECFF003746D3A1FB0AA727F7D459AA1A6C040628053AAC8F1030C40EB96AFD65
            60696562C10C85F902C00B9A4BCB66355313977F3FF20FF67AA7EFB0DAB5A855
            F2CFF87A54FF00B3218AFF004BDFDC6FEE67FBF3BEDBF877F7EBF894BAFCFF00
            69E2F3FF0008FB4F1FF07FB9FF007779356BF5DB4FBF7F53AF7C1FABD5FADFEF
            BA6695FE2F5FE8F0A7CFA67FAC36BABC0D5DBC75E295F4FB3CBFD8EBFFD3D6FA
            BB231494553E191A42F1488559101121642CA486B06448AC38161F4F72DC48E8
            E8481507A8AA47531B2D7071D67C7D6243E38C9D0AEB118E44255D4951675200
            039B9FE9EEC56A2BC5AA71D68322D33D0BD83DD14EF41F695F2C75B1B6A44328
            292D33E9FF00372336A50B71C37279E3FC504F092DAE2ED7F3E97DBDCAE96492
            8CBF3F2EA656EF1A5B50534D8B8A962A7A2FB192BA961A88EAABC47316A6ACC8
            C33D43C7355A23F8DA64485A5550CEACE0B35560662E7C4A9AFE5D3AF2C6BA02
            251463CEB4F9FD87A7BA7CC474F4DE6350935314044D0BC72C7A0DFF00B21FF3
            F91FD7DB2CA19A854EA069D3C270A9A89C1F4EA5D2EF0F0D4AD1D653C9350483
            D15285E6D11C9704BABAB488220C2E49B588FC7BAADB060CD1352507ECF3F3EB
            4D7190248EA847AF0E8DEEDCF961DB9B4F69EC6DB74D9E1BBB17D799D8F7175F
            0DD4F599AC76DD2352D56DDC9E3DAA4B6636765A0730FD94FA69E000A05F1BB4
            6522DB4134D2788854B02182E3579D41F2238FCFA5A6EA68510C326B0B4209FC
            20791A1CA9E1D1EFCFFCB35ABA1DADB0FB7F71EF2EEBEA1EF2EBFDA94FB964C5
            C5B4FA5E9BA477D6E2CAD2E4E5CCED7DBFD7193A0D91D8B5BB537A54A6435E6D
            292A9608258A43179659DCB7F74C6CF3B408B15C42C74E5A42EA01F8B5645455
            4D2A2A6BE5D1A7EF692286DCDC485E19477001542134E1A4E726B9A114E8A777
            67626C0EB7EC1C3E3BE3A6F6EC4C6E77AAA7C8ED7C9EF7A84DB7B76B73FB976C
            E56AB153EE9DB190D89939C4D8ACF534523C924D333D544E15DA52CEECFD858D
            CCAAF35EC2863940216A70A457490D8C7F2E926E3B85AC4C89652389636356C7
            71F514F23E67CFF3E90F3F6547DCDB8F0549D95B9369ECFC864AB29A8B23DBD9
            6C0564958D4712D5167EC5976AE26AB35BA6B6AAAEA03CD98960AAC8B98D44CC
            F1FE834161F4C18DAC6EDA56BE18383E856A7141514E1D15B5FF00D6154BA68D
            598E64A0D43E4D8CD4D33C7A5D61FB6735D37D8BFDE0EBACFD3C3B8B1389AEC1
            65B2704BB82A307BDE5696B238F37590EE5A5827CB51D5452C15B02D4C1021D0
            8C1524D57482D3EB6D8A4F191033020102ABF234E1E75A67A54D75F41761E097
            54AA086F8B4B71A1CE4F9795318EAD1BA2FF00980ECEDF74588A1ECAC556F5DE
            E3ACAF830555B9BC627EB5A8CB0A35A95273550E8F8292B501269E7124706B52
            6628C080C6E7CBB736C2496CA92C542429347A7D838D3F9F425DAF98ADEEF4A5
            CAF85254027F0D48E35FC35FDBD59B6D9A9A6CA63E96AA1AA5A9A2A945AAA7A8
            A59E3AAA39E190FA2A692781DE9E68A58F9528594FF5F60E9E30BABB48C50FCB
            F6F0F4E85F148582D387EDFCFA333D5F96830BBA7033BC9F790FDD1A79CC6575
            471D5C2F0991900BAF87CBAB9F4587FADED0D070098F5E944A495F8B27F3E877
            6EEBDA3B972590C06DDA8A8C9FDA6466C0D54B8FA46C8C155561E28646A49A24
            9A3AAC7C5233AB4A8D67D0DA6E2C7D956E6B7AA3C210B884A9248E27CC7D9F3E
            95D8C56EA048D3A196B8A9C0F2FDBFE0E86BEB6C6C395AC5DCFA2BA8E9229888
            E2A9A6A8C74F5535144B47046D4756AEF1D2440B82C563058923EA486764B096
            39A3B99E42116A695CB13FE6E99DE6EE3101B68A85DB89C10079FE67A1573B9F
            A018EABD15F0D0D1B7EC499896A63A78E29CD9963C61660325908E41608ADA03
            8B1BD88F621BDBB492DE511C948FCDC60823F83F89BCBD07AF443696922CF16A
            4AC9E4B4AFFBDFA29FDA7D3A07F2397EA9C260E2CFEEDCE6DDA0A99A3AEFB6C7
            64371D3BCD31A6496470D2A3FDD56559A787C93685601D8AA7E09278F6FB09A2
            138819A760468A9D433E6DC6A789FD9D1CBDDEE31CAD0C6F48948AB05D20FF00
            A507141C079D057A20FDB5F34BAA3604D81CB4FB6F2959B6E78B20B86A6C6412
            39AA963D5E3AC8AA32FF0066723593CEC599954C512A801EE2C1B4E55BFBE90A
            DBC488545154934A1E259B2C4F9FF2E959DE2DACA3FF0019B96766352C00AFFA
            50B5000F4EA983E4FF00C9EDE3DFDBC9B233C992C1ECA8A282876E6C08B23535
            58EC7C147E468B29948214869325B8EBA49353388CAC1731C6748D4C36D8794E
            DF68B7FD421EFB8B3903CF1A52BC147AE09F3E3D05F73DFE6BC7022056D4634F
            FCFC69C4FCB80E800C76221A2A72D5AC6201924AB12584E649A3B22EA6FD90EC
            0FA52E5B482C401EC46D09978D08F97DB9E89D26488F60A9F3EA0CB90A1394C6
            35552838C6A98D2AA08E46866928FCBA6422A4A4AD1E808081A792492071ED55
            B5A040ECAB9A1E3EBD26BABB2E630CE74934FF008BEB96169B25902FB5A9A6A8
            8653585699A35FF244334AC0C75050099E99959583331B3DD6DC8F6AA608A44A
            5413F3E93C2E4831834E34F4AF4B5CBD72ECEA7A8DB7053B54665A18A1CBE4A4
            9165FB0D4D1F97118F8419229EBEA99943DB53A7E8BFEB1ED0E8329F1298F2FF
            0064F4BCC9A2A8A334E3FEC7CFA53EDBC9CB8A823896B6BDEAA5A8818E3682A2
            65596B69DC7FC09456FDD6809B20B0BBEA606C3D935E5909DAAB1AFDA7FC9FCF
            A35B6BAF0450B9C8E00FF9BD3A397D5DDA9BA711958B215995ACAFA4481681A8
            7C92B4341484F95E1A79668E596AAB8DD86B1A6346B1E42AE90DDD6C166CAE91
            A28909AEAA7138FC80F97DBD1FC3BBDC13ADD98A5294FF00571FB7A1FCEE2DBB
            BB64F3E3F6FD0E071B4B183A2BEBA91321515353AE4A8AD799CC816ADD97FA7D
            4FD6E6FECB5ADBF7710A642C7CA8387FB1FE0E8C6293EAD598A81F6D38742EED
            9DABB7969F175D4799C6247571554AD49149F72630DA513EFE355BFDC19EE07A
            815552790D7F7B8F7F9ECE421A32E40E07853D6BC7A6A4D920BC40012B53C47F
            AA9D43FEEDE43FBDBFC43F81527F0EBFF0AF3F925F369F2FFC5D3C5A2FF6D7F5
            69BFD38BFF006BDADFEB63F85F51AD78D74D314A7C3F6D7A43FD5A8B5F83DDA6
            9C6A2B5E35FB3FD54EBFFFD4D6725631B595446F762564E5640C0D948B5C3E95
            B1E6FF00E37F72FAF7703D44A001DA463ACAD2B6B850065B47120B31D2A541B1
            5D44FF0080E0FE79F6E4406926B5A9EA8F834F974A9C2E57C11CF4AC1592617F
            DC5472AE9E9578D829642ADF51F436FC7D7DB33C25A8C314E9CB79746B5FC24F
            F3E9C96A24C8D42A4B54B0A228A7ABA88D59A5692462FA2392405FF6E1B12C48
            D207D2DED21091A92AA4BD703CBA58AE656505B80A1FF579E3A657A8FB3AFADF
            B2A9AA558C6868DB4379233CBAB12A037363C0B9F6A82168D0B8019BFC1D2560
            893378721A0C7FABE7D4FA2CDCDF770A534950B1C3202D234F790A48C8592369
            AC84145B686B8B8FEB7BEDA0AA17A669E9D3724ECAC02B12350F3FB3A10A7DC3
            0E31A258B2155574156B2F8E6B3C12D0B5896F34525A1974B9D4118AC8B71A4B
            023DA05533075318041FDBFF0017D2D92E45B9D51B968883F2A57F974ACEBFCD
            ED8C5EEAA2CC6F8DA749D8DB45682BC1C3D36E9CAED11595D3523C7472E4F2B8
            277CAD1C78FAE292490909E7894A074B87574C92A44E904DE1CD51C57563E40D
            075457865991AE63592DA84E18824FF488E19E95D8AC436E297289B7A5C0E297
            198BACCBD6D1E7374E270B4694D4F50D2253E0AA33F5B8F35A4D3B46B4B4C92D
            555D4B2B156909E34D2AC6A8F36A6058014524D7E616BE792780FB3A7522F14B
            7821030A920B01F60049F4FDBD35B6E9A4AA2D4D50810587DBBC60468CE14235
            2491A2AAC261753A1C120DEF6BDCFB511C4E08653FF147A2D96E92BE1BF9F0FF
            0031FF003F9F4F747B9E6748696A6A269E04A7514A6595DA5A780485248230CA
            6D0C4DC143FA6FC7D7DB86DD54EA5501AB9F4FF57CFA712E43550B9FCF8D3D3F
            2FE43A54D16E7AA8635A78AA1FECA498B9A5F33AD234FE309E7487578054844D
            05F4EBD3E9BDB8F75300A0F393ECEADE3B2B310DDB5C0E8FDFC3AF9CBB93E36E
            65F6EEE1C7A6FEEA3CCD540990DAB90CD57D0556D2A99AA607A8DC5B3F234F4D
            90968258A9CC9E6A130C94757FABC6B2D9C87F77E5E83748CC8068BC030C07C4
            3D1BD73C0F11D08368E60B9DB64085B5DA96CA9FC39C91FE51E9D5A9517CEFEA
            FEF6ADC843B5F3557D7DB6B150D2C4361C35671BD93BF26A81346B8F8EBDA78E
            89719576D353253CDA29A3219C331BFB23B5E57FA0556962F12E48E3F857F2F5
            FB7F2E8FE4E635BC6D304FA611E5C19AA4FECE879E8EF969D95FDE0C76D8EB1E
            B68ABF0D1514D27D90A9ABA6A094868C24D99CBBAC31E1E829521D1AE790BD5A
            A7A000CC9ECA775E5D8EE354D35D956078018F2FDB5E8DAC37E11911C56C181F
            33C41F5AF01D1ABED0FE61BD995389C3F5CF4FC3B1AB3B572915555EF6C84553
            164B64F5260319510D3BB4F5B31868F3D55955AB2CA4CA117C5A512427827B6E
            5CBB9BC75BCB875B00001A55433F1ED5AD481FC478F4B67DCEC63307D3461EF3
            3504D42D08AB1FB3F08FF2745B7B57E56F65F69536DBC5FF000295B2B8B4C8B4
            99AC7E4AB29319578DC7C54B026727A0A3862C26216A1A17916149A48D125264
            6BE950A2D7952DA1BA6B89652C9A6814FE11E4A3D69E74193D5A5E616F0BE9E0
            8BC3626A4AD4D7E64F11FB7A25B9CDE190CE55D1512E52A32B534D03CF32D3E4
            03E0A926AD77726AAB534BBC294FFB6F12309252C6FF0040184706DB0C45B446
            A14E2A46683FCBD11CFB9492305672596A695E15F326BD039BD77653E5B2E27C
            A65D3259545686AE47A8068E8E8E1FDBA4A1C7409188B11454CCA42C102A39E3
            E849F6B56DE3881112D07AF99FB7A46D726462657A93FEAC7A751317839FECA7
            CB3C427AC960D7454E1224112D416FF299588D3420C4A0C682F3370028BEA157
            45F318E9C424A8A71E9B2BD2BDEA9696A2591DE24265829C79DA294441088A9A
            98C8C2A1FC2416009D26D7B025AC816A2A29F963A6A4F1464D33C7D7A4F54521
            A7C7FDE54413466865A7AEAEA5A9A27A668E91EAA1A4886B91D666F379557803
            93CFF5F6AA30A59063B8D07492438123701D184D9596A68BB471D5A208E2C3D7
            C716568853C11D2DAA31784D31A49F6D125C8ABA52B2A4814ABA93C93708A68E
            96CF9EE18FCABC7A30B7602762300FA7CBA0F770CB5D16667F1505253D4544B2
            54B57D781257C7E6250111483450D749E4D491A969628C86203B1B368A30AC4D
            7D070FF8AEAC598C950BF99FF27F9FA95B5628B1B56B1554AC652DA12313032B
            A6A5D5E40E256861979D4EFEA65E00B71ED89829D5A0823ECFF2F4A633A5813C
            7F98E8D6ED3DE3B6B1B02A64898244B78AA6201A3D0F6470C80310AABF5207D3
            D86AF6DAE589F08541F2FB3FCBD082D2E6D946994D1BD7CBA564B91C365175D1
            64E94EA7FB84225D26E824216789892A86304FD0FE483CFB282972B50F09E1E7
            E55F9F46EB240DDE92AD079D3FC20FF2E86BEB5DD395C0E3E2DC799C6D1D7EDF
            BBD3E21C4AB0C724F1DBCF2C8BFA4D3D028E0B028D2717E1AE1CDC6D6392E4C7
            0C8C2E29907FD5E7E9C7A39B4BC6586B2E9F0F1A48C7ED1D49FF0066F30BFC4F
            F4D76BFE25ABEE34D27DAF8F4FDB7DB5F578F4783D5E4B78EFF8F76FEADCFF00
            4FF18A71F3AD3A63F7CDBF8B5FC54A7CAB5F5FF57A57AFFFD5D661E492A557CB
            21594857566B80F63E96527804A0FA13F5E3DCB85C475A2F5132A34801D400EB
            CEB2432B3461E788B0D64690CAC6DA8F8F95E7FC09BDFDD62B92569E1D3A7258
            2995901FCBA931C9A079093E96E18300A178D4415D40B7FB4FB55A83D6A314E9
            31AA3804F4F51E4A08D442C8CA24576824494E9D2DFE715958308DF48FA7A6E3
            FDE5208C925837E5D29595400B5EA089DE59EBA637BB5424973724248965E38E
            41FAD87E3DBE31E106E0011D341949762389EB089D0104A07136BF5A28035936
            B691C0BFD6DFD47B7C0EDAD294E98600F118EA552E5AA29E492266F353A05135
            3CDA67A77D2A551DE193F69C461BE96D4BF823DD1E0068FC3AAF8847C20915E1
            D3BD056D099E696288C42508A8904863F11646244524AECC63949B156BE9BF16
            3EDA7824A156C91FCFA7478659811C7D3CBF3E97D06E19B09117C4B388CA98EA
            E59FFCB69C3A1611C0D1572CD4E4C4E38645041E458DBDA516A93D04AE4357C8
            914FCC53A5EB706D93544A34F993DC3F9D475923CEC1B954254AA63AA9636485
            A9208515AB22002ACA2244063A966BDB82BF83F5F6AA2864B42544A592A389AE
            3F3E915D3457A819902C94A0A00323ECF23D41A7CC5424AA4311353B392A5836
            9949D32F1F475902FA87D0DEFED7F61A1390C3FE2BA236D6AD5248914FF3E971
            0E615D54F9961F295649232B324528500B30B80CBC03C00DF5FAFBDB213434AD
            38FF00B1D29F19B4EA386AD71FECF4A4A3DCF5B492263F2815A1A35996162907
            921FBB2B2B334D1A07A9864D571A8B69B9D361C7BA9B78DD4346C4FF00ABF953
            CFAD25CCF0B3C530ECAD7ECAE7CB041E9430EE08E3647323C4F1113515752C8E
            8F0C80968C9D25640CA6F62A6EB7F7AF06A38835C10456BEBD69EE593B8390A7
            208E86AD8FDEBDA3B3E599F6A6FADDD86FBFA5295C7199BC8252642011B24D16
            6683CB2516460F1311FBF11D209B1009F68E6DBAD6405CC4A429E0470C797469
            69BADD0016391AA7CC1E341E638743D7597C9CADDB71D663F71AD564A9B33242
            D93C9629A9A9B352C0B319A285C4F1CB04905354CCD2EA8D564660AB7161ED14
            F64D20501476F01FEACF4BADB7211172D51ACE739F9F43DC3F2432D9FA1AA836
            ED5260B6F54525261B359B88CCD9AAAA28DCB8C74D50EF23509AE54D52535324
            5E720B4A58127DA53B6A2692F961903867E7D2C5DD1DEAA884463049E27F3E1D
            27F21DB99A7C726DDDB267C662035A699513F88D7EBBEA696A1C3BC6B6721147
            0B7E757D3DD059283AA539A70EB46FDC8D318C019A8FF3F5EDB795C76161393C
            A53CD59246E1E491C6AA2A3F29062595BFCD35448C6CB700A73617360C490992
            88800FCFFD5FE5E954530440CE0963FB0759F71F686572D03086B5E8E9D1A4D0
            28D0A3A4ACCACECDE2B3C975B5DC924FD2FF005F7E4B315D2C31D7A4BF76CA9F
            D95F2E1F9749FC4F656530153E6A2C944F34B190B3D7C0EF32D43AB6B9238CCE
            19A628182B336900703EA7DB86C83AE9514CF97A7FABF3EA91EE0D192C581AF1
            A8EBA8BB4DAAA499B2B5DF798E92926A6AAF48827AA30B4724914883C8C2A125
            41327246B4E0F3EF5F40E80151DE0D47F83AA2EE28C5B51AC743F99E853DABF2
            062C5E46833581A27AA969A8AA456CB9067828A0C89A7A8A482B69E429A648E5
            A4915A4455BB140090C1484B3D8B00E9210AA4E0023F67EDE8C137250434609A
            8C93FEAE07A0AB2DDE023ADAD8CE5A920ACA8B544F90AE7095EC93C8E0FF000D
            A298BCD0472CD1B59953C8CC0816FA7BF1B58D14191C0F979F5537ECC7F481FB
            7CBF2E99D3BE36DE175354EE0A2A296EED3495798A4A69DCC704950ED325455A
            D51658632CC0806C7DB7F4F03619D547CCF5617B2211A158BD380A9269D72C4F
            CA9DAB918A4A8C66E8C1E416109098E97334551024AE8EF4C2493CEFA04B146C
            591ACEA2E481F5F6E0DB21901F0E543F3A8FF557A6C6F32A9D4F1B0E22841E84
            6DBFDE39EC8D3C355492AD2D22078565A29454355A3AF9C3061AA021239400EA
            595B83C5BDB371B4468C5882C48F4FCBA550EF524828AD435A63A4D764FF0031
            0AADB34F06C2A993339138BA1A7A3A6C1E0E549A990B998A51E4B22B2F8A9AA4
            AFEE4BAD75699356824DBD8567DB769B5BA918B06BA39A0CD09FF07D9C7A3F4D
            D374B8B745484AC34A56873FCB3D071FECD66E3FEEA7F78FF8353F8BCFABF87F
            96A3CBA6D6F1797FCEE9BFA6FE1FAF36FC7BDEA34AF86BF6757F1BF4ABA9ABF9
            71F4A75FFFD6D6068E458C2ABB168B5301742CC9660DFD6E878E47D3EBFE1EE6
            03A4861C1CF0AF510C6FC287EDF974ED048B24ACE35063A94A1D56248FC102E4
            7A41E45FDD955748AD303AB3390C73D70BBF8AA60B6997C3E6E011AEE7D4A39E
            75037F77EDC018A9EAAD5AE474DF0CF2A1D2EA18005083A83DD802596C6E585A
            E3FA8B8F756A1C03D510D1A83E21D3BC72B181BD5E41278F46A004968C8661CF
            A8F8C923824FBA8502503CC0E9E620A5479F5D34A54440D9751D6EA033005782
            47E54DCDC7E6DEDFA13E7D358229E7D60A99B456C684B08CAC6B200DA752BD80
            60E41003023920FF008FBAB16CD067CBA6C8D3A47A9E3D736768273725155D01
            897F537D415500FD755AEC38F764358EAE7BFADD34528703A5DC559AB1BE0663
            28788166B7A6305B504446640A037D093FEF5ED231512EA068474AAB580239AA
            91D43A1AB6A2974231FDD2AD0B30FD2EA49058DB4026C3FD722FF9F6F3B232D7
            881FB7FCFD2747589C25307A7892A29DD649EEF4B910A8ED1807EDEB3D76768E
            C078650A795FD3C7079F7E8A4C84AFE99FE5D269E28DD598AD251FB0E7F3CF59
            E1C83CC88231A5A16E62D442D88BDD40B704FE3FA7D3DAD572A74D71E5D17D0B
            518F1F4E95347934AF8A182A2768AA114C54953296D3A755CD2D5724B421D894
            7FEC83FD3DEBBA3ABA202B5C8FF2F561FA8111CD180C1FF21F975392BE6A567A
            5A9521D1F942481653A85CB1E626D47E83FD8FB7D02CA4491D785387FAA9C3A4
            E75C4ED1C83F2F518E1F2E3D3A45BC2870F285ADADA78F5A34A94EF2ABCD2451
            7AE52B10BC8DA509E6D6FEBCDBD965FEF5B5D832C57571490F9282C78F985068
            3CB3D1B6D9B4EE7768F35A423E9D49A966080E334D441247C81F4EA2D5F716C6
            8616C853E6A790411BBBC749435F33CA23D0ACB4F6805E54E03C77FA0FAFB483
            987692597C7627FD230FCB3D289364DC45258E30457C987E4680E3E6389E851C
            2764D0533C195A0CFD052452411D47DD2E429FED1E2F0ACAC2BE9E59975C4D1B
            5C065574078B1F6BCCF6260D5F5511880E3A87F235C749E3FAA32AAB5AC8B28C
            614E3EDC6474A4CBFCC8D93B6E8E09A822A9DC591844A0D2E335434924E102F1
            90AA89E392376562A12395B48B9B8FA866EB76B0899D20D5237CB007DA4D2B5F
            970E8476D6776D1F892B220031E64FECAD3EC3FB3A0732BF34BB77295421DBDB
            73018DC7CAB14F4E95D4D5D9296D2190CF2CB24D350D34B2225816088CDF4516
            E0114BBD3461899234A0A69035119C66BFCE9D1B45645C2AAA3B3D335345F980
            28387DB5F4A749D7F979DEA1922583665579DEA02D40C5B407ED222978CB256A
            E2D2A91B93C316046A5B8B96FF007FC9A082EA0AE2BA0FF9FF00C9D59B6C412A
            958EB193C35F97A5719AE6953C3A07B35F207BAB3357513546E8CBD09FB895FE
            D692BE9E868E6A79E9E485D21A58A189D16289CE82B28018DFF5004EC6E12B80
            5AFDAA7EC03F9507553040AC0AD8A62BE75AD7CF49AD4FCEBD233FD3276C62E3
            6A7C7EFADCB8896A6486683F89D72657C8B1452253D3C126569EA5E25532DD55
            5C0663A8DAD7F6A63DD27881D376581F4353FF0015D257B3B73C6D8AFA7A13F2
            C743C60BE5E76760B0947B7EA73FB6E6C9D3C4C95398C9E155AB2A2AE5555155
            5CAB510D18AAA78C685D0A55B482C356A2534DBD5FCD845514FE8E69F3AE2BF9
            74BEDEC2C620A19CEBF3A93424F1EDA0A5385351E9019FEC6DCFB97332E5B31B
            96B65C8C82273924AB82212078B5D3C1470534AB0438EF10660A81501B920124
            92832DC333CB34ACF2FA548A7E5E5D1948228C22C51844078E9193F6FD9F3E83
            2AEA5CDD6C935754E4A6AA8C549920AB48A09A48A49232CE8F51AC551F37D0D9
            8A1FC737F6FA5CC2145613F3F5FD9FE5E90BF8E4D4CC7E581FB2BC7F2E98B21B
            7F295C8AB510A64A29655D53D11A546A7A992329EAE62791406F5D8B580B0B5F
            DBBF5F0A8AA82BFE9B87FC5F4CF812C9E48C0FA531FCBA122933BBF70188A7C2
            514FBA976F63E27A28A9F1BB9E48E18619583CF153D22E4E396186A2562DA5B5
            6AD648B13ED13EE1E3B687BC35FB588FC870FCBA328E0302A016828282A34D7E
            79C31AFA924D31D751673314B5CF042959ACAC029E178611353C93C4269A4A86
            A8AB9A1FBB4B69E786D5EDA8FE91549254FCEBC7FCBD393CD70C4AC75A8F2E14
            FB6A69FE7F4E85FF00F487BA3F827F0AFB58FC5E3D7F6BE587EE6F6F17E8F2DB
            4DB9D3E5D16E2FEDCFAAB4A53C5C578F97D9D534DCEAF813857E7FB3D7F3EBFF
            D7D5DA0DC54B32EBA480C7158F85991054C724808D2A549BB2F1FD4104FF005B
            FB16B5FBCA4B3DC767982D8FD80E3FC3D03D2281147856CB51E6066BF69F4FE7
            D6383214395770E2B29EB699AD2CD485A48E675FDB90CB24215525522CDA80FC
            9FCDFDBB1DEDB2A8D77402F966A7FD5F3E933C12CEC49B5AC8BC68050FDA3CBA
            77AC8DC2354A486065FDBD6D30920935FEEDE94BB3166754B10BA880793F51ED
            BFDFB0DBB948EED98F1E1FE523874E9D9A49D7C47B411A81EA38F1C50F1F974C
            C2AE48A6A715D03428F1EBF33208E611EA62AD292C61952C2E2C41FA7B570F31
            236A0EBA88F4C67FC9D207D8A40E9593429F33FEAFF2F4F6A94EE228629CACD2
            AB4D0492B8FB667470AF4E175065974B000DD8136FC303EDDFDFB2575784347C
            C9D5F23F67E5D285D960D3E19B93E21C838D3F31EA0F5CD3F88324D4D5D49141
            50B7484354B2FDC5EE7F61D934EA51A4017BB5F807DBA37D7C37840AFA8E03A6
            46C720D6A65024F207CFECE1D354F93A70552B0352BC71246D33C6CE8AC8B703
            4212ECAADE92C07FC53DAF8F7481C0043A9F53FE5A7455716134628D4FC8F4E1
            1D5FDEC292C7353548D0BA5D1D5A491117EA1579568C01726CC3EA7D98C4E8C9
            A95C693E7FF17D179D7F0B0229FEAA74E70D4A454C82AEA129A38CDCD554B886
            10AADE3F5CF2158D7E9A79FCFB2CBCDE76CB43FAD729AFD14EA6FD82BFCCF463
            6F657D74A34DB1118C558845FDAD41F674E393C9E3E08984D91A46F0B58A4151
            4BC00408CC523BC50BEA040575728C6E013ECA1B9AAD10B9B7B695FED5D3FE1C
            FF002E8C1B97EEC2912DDC2A69F85B57F3183F91E9B06E9A448E06302CC64904
            54FE3C8432896501F589129C4CD12AD9AD73703FC083ED23736B772AD836A1EA
            7FCC33D5FF0070D02996E850F0FF00557AF43BC62499927A2D11B93E2104CC64
            0B71E250E63FDC8C7FAAB5F9E07BAFF5B6EC29D36683ED663FCA83AA0E5DB20E
            04B732683E807F84D7A70AFDDF4890492D37DC45385D31453C0F692700ADA394
            2A884AB11712017FAFB6939BB793A90C7067810A71F95727A53272DECC155D25
            B801464120EA23D08514FB3A41B6F6DD35902D3D654D6544C8937867FBD9EA26
            7A455458A26862310866509A54AF03E9617372E96FAFAE18BCB7D2683F100748
            FE540474B238ED608F4C361178AB5A353537CB8F023CA87A52757F57F68779EF
            48BAF3ACB6DEE9DE1BD339475B3E3B0D8A95279E2A1C5D24D90CCE5F226458E8
            B09B77038E866AAC864AB27828286922967A99A38627915333C6BA5B4822B93E
            BF9F134F9F4EAACB3EA55D55A6322800F90029FB7A393D8BFCAE7E60749ED8DF
            3B9337D75D7B9987AAB68627B2FB4B09B3FB6BA9F7E6FDDA1D779CA85C645D8F
            51B5F6E6F5AECBE77ADE2CC3B53CF9EC1D2E4B0D4F550C9E4AB0B1BB0D6AF10D
            598D787A0FF8BE9D104B00C4519A65BCCE71EBF0FAE38F9F55F38CC4BBD44EB4
            553907AB9BCF4F50A921A78E1822887EE4B2CF2CAC5D90907C6534A8FA0E3DDE
            49C22E155787971E93C50BC8E523762D91C7F6F464FE37F41EE5F903DB7B53A6
            3642E0768D466E97716E9DC3BB32D256BE03656C4D89B5F31BD3B03B077654D3
            4591CB1C2ED5D9DB7EBABE68618A59AA8C4B0411BCD2C68C8C869B5995C91E55
            FF000531D18A9D3A218E158C81E5E8064B71FB7A87DC796EA4DB9B928713D05D
            ADBEBB4B6636D9C6CF92DC9D8FD4B8AEA0DC14FBB26A8AD5CB62E8F6C52762F6
            6C52E229E0869E482B5B24934A2668DA04112B48C3D92290D415AF97F2E1D5C6
            EB2D150480A53CD0035AFE7FEAC7460B647C0BF961D9FD5F94EE0C5F5C6CDDBB
            D7D88D9DB7F7ED76737C776743F4D57E1F64EE6CC536076EF6164B69F68F676C
            BDC94DB0375657250D361F30D8EFE1F92796334B3CD70DEEBE0CBA81D46B535A
            E6A29C3CF874A7C579A372D02052ABA48A295F5232050F018F4E839DD1F1477B
            6C2A5DEB43D8DD9DD1DB5EBF6C74DE07BC7158AA8ED1D9BBBFFD23E0F7266309
            84C26DAEB1DC5D7B94DD9B6F776FEC94599FBEFE1B057695C5D354554922A443
            5B9A9C388D60012993534FD94E3D24681446ED2CF4602A01193F98C7E5FCBA2D
            30535444AAD515B078276FB88E0A8492B268DA35F4A96F10B102E503951C5B83
            6F747646501548F98C57FD8EAA88F1953AC69E343563FC81A7CBA379D05D138C
            EE3DA9DB7D9FD89BE727D55D03D0D16C89FB57B1287AF97B0F291E63B2770FF7
            67636C7D89B14EE2DB4DBAF78EE1A9A2C857B413E5F1149062F115F34B56AF1C
            115426489832C8C4538713D2C13248AC199BB082718F953CC9E8BC6FDA9EBAC7
            EF3DD1075E57E67746CC8B3B92A2D97B9371E0E9766E6F3BB7A96B65A6C465F2
            BB52973DBAA876CD657D02249252264AB1207629E57B6A2EAC6E574898923AD3
            3C209D286AC3CBFCDC07FC5F485A5C8D24D14FAD678AB226D3A0911C21496087
            4C4C89210C9F506C6DF4B7B7F4C91C8A8EF5C7E7FF0015D26530C8AE33E20F5A
            01F2EB758FE52FFC8B3E3DEFAE8ADA3DC1F22F6CD1F6B6ECEDDDA180DE71415F
            92CFD06D7D8FB7B7263A1CC62F0D84A0C45761FF008A6E3A9C55744727595225
            4A6958474814A999E47169B2F2EED16575BA582DC6EF3296D0F42AAAD5D35538
            18E072C5AA415000315A5DF30F38EFD7F65B36E46D362B67D3E220A33BAFC455
            B89EEC100840B4A872C69507FCF5FF0096CF5CFF002FCEE0EBBC9744D564A4EA
            AEE4C4E572B41B537056D6E732DB0773E06A5B1F5F8CC7EE1AC92A2BB25B7329
            0C62A680D5996AE1659637924088FEC1BB86DF108BF79C31F870B4A5742F05AA
            AB802A49C82464FE13E5803CB0DC244986D3712196EE38B5F8840D4E03142485
            0170403851861E79EA8BA5DC39431A073A1E60B13B34513CCAA5942B012D9E77
            9350FCD8FD3EBC7B235863A14208FB3FCC3A3F373230518C8F31FE4F3E93FF00
            7794F1783ED20D3F71E2FBEFB493CBFE7B4F83C76D5ABCBCE9D5A7FB3FE1EDFD
            16FAB46B3E1D3D315FF8BFE7D24F124A787F4ABF171A1AD7D3FD8EBFFFD0D5AB
            65D4E26B923C6569489D18D453D72C30B2433B23281246C4BAC26C14D980FC9B
            9F6CCFAA32645A7A11E74FF2FF0087A2DB07B796B6F2922B9AF903F67F2E3D4C
            C96DED7592C31D4C14CF0C8E16793CA94B50A0E8708A5FC2557FB17054FF0080
            37F7647768E22B98C8C01C47DBFE5EAB7165591D2AA08F338073C07F9FA609A2
            AFC697F34756618C0123D32382511790AC5FC6C9F93F45FEBEEC04675043927F
            D30CF45FA64B73DFAB48F4E9A6BB214F3C6D551D412608C26B78219A648435E3
            50352A3C4BA8822C6E7902DCFB5516B4621295AFE5D372BAC8BAC31D2079F1FF
            008AEA3E39773E6E685290BC3493C4EA8F2504C686A916C161A58F42C95152D2
            3280DE511A11724587B7DB7036E0B391F3F9638F5A8AD2E2E48540D461834C37
            91FF005701D0E3551A981A3A9C7BD73C7147053319E1A798D4128B74966A8559
            044ACE642DC024690DAADECAFF0078DD3B131CFA416A90063CEBE5F670E84CD6
            71786A27B60EC28327CFD01AE4F5C733B6E83214D36470DE3AA8128928EBA9E1
            9D127A39ACC27A8F048A9514F1D484249572C2E4EA17E351EE17874C334CE096
            A8AF98F911823D3CF8755B8DBADE587EA2D951828D2C0711F320E479D4F41624
            190C648B3D042E94CB20095B053471491BAD92559AA0B4B33B3EA1C12BA87D49
            E7DAA79E694B2B3B06A601D47ECC1271D103C2F177C09D81A95D2388F9D2B5F4
            27ACA331553C89F713D338863488525498E38A4F0BBB8823A4024A362C490C74
            6A607D4DF4F6D246169A16A6A4D57D69C4D73FEAC74E8BB99F49790500A00703
            F6703D3057D2C792C8D5CF57513D54D57A24823A77A0A58698FAA4A682389210
            828950D9785B2ADBDBE8CF1AA85155AE49A9E92485659A4690125BC942A81E94
            1C29D3DC9B368E44A5A9932152C9510F8C39A7A7926801513426CD50B05453E9
            5B1F14A64F1FFBAFEBEEFF005540404EEFF579F4E1B28D82B194D34E702A3F9D
            0FEDAFCBA4589EA69A58E2850E4608E34A8A6970EF2C221D6DFAAA61B014CD18
            055A373A45BF51FAFB5028EA4B2D091D2092B132F76A5A5415F2FB47AF4A68F1
            D5B1A4B4C9958A24CA4AEDE4AE815A5591A3669D239296A09A9458613EA55FAD
            EDF4F744963042AA9A0AFF002E9DEF1AD56E3487E35FF60D0FE5D3598EB68C96
            9AB3C733BAA4754247968E55553E8124729713042B6570080391FD1EA07A5054
            1E9A60C847EA01E8470FCBFD9EACBBE05636B3B9FAE7BEBE2F75C6E9A8DAFF00
            227E42F62FC58D95B166C66DFDDD91ACEC3EA57DF9BB709DCFD4F4D95DAB8EAE
            830B8F9B71EEBD99BCB28D979E8B11263364547966122C2A692462320F019E1E
            47C8F4B6D58B2CB1A9FD4254568722B91FCC13E58EAF676EF78EC2F927FCDEBB
            EBE22759F53EEDDADD77DCB4DB87E2C771F666777BD56EBDCBBAFE19FC34D8B9
            9A4DE7D3FF001D366E13696C39768E3BE4447D010E3F213CB57BAB36E2A26928
            E6A026668582DE1AAEA2357103E67CFF002E96094DC5D3C0B1D2235527CF4AF1
            03038D3E67A0A37A7C66DD7F20B71EF4EC6D8BF0B3038ADCFF00127A77A7B677
            5CF4ECDD23D73D3D59DA3D87F26BB937FD5EC9EDCF94DD1FD395D2D2752F55F4
            4F5D6D1CACB4DB7B77D4CF93ADC1E3F0D5DB9B295B4392A89AB5A2F1B7C48585
            7F3FCABFEAF9756114C1CB4274954A0A0D352C49A9038003C8FCAA73939545D1
            DB3FAA7E6BFCE9CA767ECFEA2F8F3D53B6BE32F407F2F9EA9C863FA6711B3FAD
            771F657CAEDC388EAFDDDD9D5DD6DB0737D5E29F68EF9DF1B277ED454D533525
            226DEC93D74F4F90A3B4751B5D2D4C12D9AE7C874F156479415554D2141D3E67
            04E08C713F9D4F5AC47CF1DDD4FBB3E53761E3721D23B6BA1F21D73FC07A473B
            B0711B53AF369E8DE1D35B731DD77BA775EF0C2F56ED7D93D7D49BCB796E4DB5
            5593AE4C0E2E831104955E0A689A1856475F147D8081DBC7F2F97D9D20942B4A
            C25A7A701C40E2694A578E053AB88ECBEE4D8FB37E20FC95F963BFBE33E5B7B6
            C4FE66FF0039765D3EDBE9BECCCF6EFDA1162FE2AFC5FDB549BAF11060777F59
            6476A2D1E0B03D93BE71F80C002E6866A4C253FDC4754F4F1114F0C3B246A7E0
            5C91EA7EDE9D9158472B3A022490501269A4670453CCE3ECE99BA47A8CF66FC0
            AF8F391DB3F133A5AAB39F297F999D36CDC76F0CB6CA932EF82EB5C767715B37
            0181CCEEECB66E3CA8953B27B92829719B570B538EC2D46DDD895153538AA9A6
            FEF1554DA7450EC9A8E90B5FF57E438FCFAA84716E8B41A9A5A67F653F69C0E1
            41F6F471BB4BE377597CF0C6EE8D9FD1BF1C3A43A6BACBE40FF36AA5E87D9DDC
            7B33AEB676233DB3FE3CFC74DBE9B6FB2B7B607772E3E831D4399EC8CEEE3A7A
            6DADB331428A9A4A2C2554AF49512AE5B29227781401A8D6880FD84F97D9EA7A
            70BB5C622455469F483FD15C13F69E007CBED3D33D7FC4EEC8EDAE95F843F13B
            71FC7BA7F8A3D23F2D7F992EF3DE797DAB89D8FB73ADF79F59FC6EEA0D9F8BD9
            5D61D7DDB9BC3218EC76F8DEDF21B7E536E9DDD91A43BB6AF279EA96A7FB94A1
            8A9A99608DAF0D007EEA8031FEAF974E7EA7F8BC6916847735C705000A1F3D46
            A695F4AF48EC06ECE92C7FCC9DA34FBEBF97B7546CCE87F879F15BE64FCA7CAD
            2F6EF47758F54F6CEEFEB3C18AF9BABB139AE88C5D6EE59F0B86C2EF4FEEF6DF
            DA399ED2A7DD1B93708CA64338244ACC8C4D47531E15864F0A75513159F43C20
            46A8CC780C796057E4056A4F1EB59DEFEEFF00DD3F22775E2730FB2F62E0719B
            7F6EE376075E75F752ECCC1ED4DBFB3B6462323919F6D6D2C7D36269FF008E6E
            6C8632AF3F22CB97CE55E4F3D95A890C95B5B51236A0AAC36DBBBDB98ADEDE12
            D72C68A00AD7D49F4007124D00C9E8B2F37286CEDDEE6E258D615C96028147A6
            338FCC93C38F5B66FC1EFF008510747FC68F8F9B3BE357746073DD93D83D17D7
            583DA78CEC8E9F8E5C7EC7DED4D8AC5A5351E032EBBA31F479BC76676A514306
            22AF294B4B554795A8A3927A58963684CC2CB8F0EE2F25B6DCB7289658822333
            C7232EA41A485D00B1D2450EA5019B511DA40E82BB7ACF6D60971B4ED339491A
            470A92441B448C594B176551A81046963A63D20F7035A0BFE67FFCCD377FCF8E
            DDA4DCF97C40DB3B1B05535876CE305364054FDAD55150E3A8608034D51494F8
            BC353D3155791C49532CD3D548236A8F04255BC5DD95C45058ED8AC6DA02CC64
            7ED69646A6A728090AAA0698C65A9524D5B4A98ED16BB9DADC5D6E1BBE84B99C
            2AAC68752C312D74AABD01766AEA95B0B5A05145D4D56A95D118AB2A9E49929E
            945C7DC2C4A26445264780B70CA8EFA884373C11FD3D870C74C8209F97476245
            71231AAA8CE7AE3FC6E8FED35F82B7C7A35783C12EBD7E4F2F9BFCEDBC7E5F5D
            B55F4FE2FC7BBF83F86BDDD57C68FC3A687A7F2FF4D5FF002F5FFFD1AEEFE5ED
            FCA73B33E6EE67B223C9BE37A73AFF00AC3114749B977CD4E0AA3335126FBCEA
            1976C6CCA5C3D1E5F0B2D554D463E9A7ADAE9BCEB1D1D346B7D524F129B25B89
            9D5011AABE7C29D123DCC56A85E446F0C8E0A057EDF21FCC7479735FF0996F91
            3454F909AA3E4DF49E3308FE2A1DAD95382EC2C9D6E665A98DD60A5AEC756523
            1C1BC2B00FDC8EA6AC313C7B685BDCF88624452E2A680F90FB057ADBCF078024
            96E1D62340095CD0F9658FED1D14AECBFE419FCC87AF8D7D0E1B07D4FDA38980
            1A98F23B677FBE2ABE2D280C72B52EF1C4E0A48239E0075421C8E2FABEBEE8AF
            34675E815C8A0A67ECF5FB474E9D7A044B386539A952A47CEB91C3CBAA7FEE2E
            82EE1E88DC630BDEBD4DBD363562D4EB6199DB9578AC7D6EAD4C171F91587F82
            5653C8F1DF54352F75371EEE263200B42A69F9D7FD5C3A4B35AB2488D326B4A8
            3DB4A11E98FF002FECE8DAFF002F2F8B3B8BE7EFCA5EBCF8ED82CA7F7676D3C5
            92DE1BEB3F054475351B6FABB678A7ABDD6D86576956AB3D5F14915063A171E1
            35F531BBFED2B9F758A1504A9CC8D8FCFD4F4612EE23C14089A514E003F3E1F6
            134C75B28EE8FF0084C47446573159B8F69FC9EEEDD8DB329FF88566636AE676
            7EC8DCBB9562A489E58FF84EE645DB91354A2D3A2BB5463A6BA8FADF9F6FCF6E
            D1BAAC5720AB500A0A64E3CB1C7A490DD8956599A078C8075286F415A8AAD6B8
            A8E3D177DD1FF0997DCA9443707C7EF98D4F538AAD92B19A8BB53ADCA99119CF
            DFD1E5F37B5773D4431A491BB230FB389C1B580B5FDA7B9B3996468A7652CA41
            18233E5C2B9C7963D7ABD95DC6621736524A03541CAB038EE0D5A1A50FAFCC75
            593F223F91F7F310E88191C8ED7D8589F919B668BCCF5D59D1F945CCBD245152
            99A712F5FE59F11BC5440FF5304557E565D4A4822FE69AE1093708429F31C48F
            407CBE7FB3AB98DE45FF0017B8590E6B1FC34C570385381049AFCBAA61DEF255
            6CBAC7DB1BE764EE4DA9B9E851E9B2384CF61F23B5F37455B0078BC898FCB535
            356C74FF0070A7CA92A3036B5EFCFB530BC2FA7C2E27CC91FEAAF45B70A22611
            CF6CC187A608FB3E5D2068722D9B901C7D3192711B467526AB694D520925D7A4
            4434B1B936E40FF0F6A18C31001DE809FF000745E43CB25154D40E958B89CF8A
            6A5ACAE393A6871E92FDA51D32BC8A934C5A9A79AA2A5C7DB53D38899D54A9D4
            AD6FC5EED2CA85CAA8F8BCFCA9C787AFDBD28FA6BBD224935841E5FE135E02BF
            2E992969F1543299AAEB2D8EA78C8FB6598484B12101AA95258DE75D37044643
            DC81702FEDE776602348CF88DC0F0CF9E3A615630C431EC1FEACF99E9EF1F5D3
            6733150F4343474F87F11786BEA238A8608C53A2A892289AA1C33698CF8D3592
            EF7BB736F7E7090C475B92F5C819FF0050EBC87C7B8A44AA22F5200A6388F4FB
            3D7A72CECB0E1D29609B1DFC7321920C6550A4A989534218AA8B858995802EFA
            0ADC7D7DD612D26A61314414FF00553CFE5D5E74588AA9412487F67CBF3F5E9F
            7AB7B1B73EC0AE9B7360B796E5D8354B4EF8BFBBD9FB8B33B7AA2AE96AA686AA
            AF112D5E0EB292B27C5CD594914DE076689E5815DC16553EED3D5C688EA5BFC3
            FB7875AB575525E46A2AF90247E58CF462737DEDBCB31BA76C762527667612F6
            06D082869F0DBDDB786E49778E2FEC4D54B471E13784D9219FC3C18E4A8D3008
            A553134921455B9F65912491B486750CDC47CA9C3EDE844F3D9C822F08E92054
            FF00B04F4835ED3ED0C57F786AB13BE7B071B36F29E9EB777D463B75E7A96A37
            5CB4194398C754EE0929AB206CED4D1656F550C9502464A9FDC5B30D5EDFD6B4
            02831F2FF579F49DE60A2AA1E873C6A7A446E5ED4DE9BB8E7E7CF6FCDE39FAAD
            C59987736E6973FB872B96AACFEE1A28EA63A7CEE69EAF2120CC6768C55CC16A
            AA4C93A2CCEAADEA605E8C32B76D351A7D9D23926132D558FE7C7A367DCBF382
            2F935B7F766E0DF1F1FF006DE63E4CF64EC5D83D6FBF7E4BD5E66B9F15967EBE
            CD6CFAE87B4E97ADE2DB01707DEBBB36C6C5A7C1E772B439B5C6E5282B6B99F1
            4955592D4FB77EA4DB0AB30D23CBE47FC9FE0EB6BE2DDD0A444B3E35D0D2A33C
            3D682868739C74184FD93DA15BB171BD7FBA77CEFDDC1B371587C5D0A6CFC9EF
            0CE4BB6E9930F0C2B86C7D1E12B7352E269E2C6494B0FDAC0A821A68E2162A50
            7B2F7DC67924778250A49C102B5E07D0F91E8FE2B254B548AE60D415456A703F
            9FEC1D63A6CFEF0185DA749B677AEECA03D7F5791CE6136F63F7764E923DAD9F
            CAFDBFDF67F6CD0C754B4D8BCCCC238D27ABA32925478949E147BA7D7DD06916
            595B4B9C13C31F3F4E383C33D5CEDF04F086B7551347928388AFC8F120902A3A
            0BF1FBEBB4F698C326D5DF1BEF1549B4773D66F1C02E2373672886D5DEF5D1D1
            C75DBBF0B2C1942711B92B29B194E92E429847572AD3C61A5B2200B0CCECCAAD
            50380AD73FEAAF441241247A8C0A485353806848FDBF2AF5327EECEDAAEAEDB1
            5790ED0DEF257EC9C9E432FB42BB21BCB3E6AB6A65F2D9C9773E432DB6EA8E4A
            5970D97C96E4A993232D45398E792BA469CB19599BDD02E380627D29FE5F9FA7
            555B9948019C0A7E5FF17D25737BDF7766737BA73D93DE7BB2AB37BFE92A2937
            AE53FBCB907CA6F082A2AA9EA2A20DD35F2D5BD56E5A69B214913CB1D5B4AA64
            4563CA821F576543A5493FE0CF4C4A55A425AB53C74D057E75F3E941B724A0DA
            FB5A6ADC279977764DA4A192B6558D930F40E8D1544F8C9D655824C8D54AFA03
            378CC4819154962F28AED3986CF66DA0C7B5238DFAE2AB2CA453C3404D12239A
            161425B041CF109A43173CBB79BBEEC24DC8A0D961D2638C1AF88FE6D20C0A29
            C05CD47C8B06002B22A982BEB64AAAAAB9204350D3BD1B3C73D44B1C9A1964D4
            44C8F2C83F57E4126F7F640A55D578173EA7A38923F0C920F60F2AD3874A68A6
            ABC8D3539C3641E2961581425500C59E6B1542A58BC8547EAD40DB823DB3E0D1
            98BFECE94A079155639687E7FE0FF8BE94629716F047439585BCA7409622C244
            9EA9F5132A19679114792424AF28B6FEA2FED878C07D5521BCB879E0F4A0450A
            8F0E6075D73FEC7597ED36FF0087EC7EC17ECF45BC5F7157E0FB8F36BFB8D5E6
            BEAD7EAD1FE6FF00D871EDED0F4AF88D5FCA9FE7F9F4FF00816DABC2A2F87C6B
            534FB38D2BFCBAFFD2D9AFE0EFC72DA1F0F363EF2D99479B97766437DEFF00CC
            760E6F2F262863296A249F0B88C263F13F68F5F91D46868F1674B16019A663A4
            7E6F4710CA052A48FB7FE2874465563B8818EA228DC684127C8FCF029D0D124C
            DBAF03BA68F71CD3240FB9A0AEA31E97349450D0CEBF6F05292862875CD61A40
            4041BDBD9ABD22B8B17B3405844431F524F1AF9E3CBA0CC6F24D69BA26E72322
            19D5971F0AAD714F2C93C31D41ACD999DCF6D4AA97139CDC35F578B68FF83E22
            B7254F27DFD0A24AB5ABA648DA6919069588492B0B1D23DB124A96B72827B74D
            0C7B98038F31F2C9C9A7467685EFAC9DAD2590BA5342922AC071FB7E55FB3A24
            1DBBF16317DFF8F4D83BCB2B538EC0D5B30CE63331B531999C85197B7ED63A5C
            833E2CBB2B7A59CCA22FA78EF71ED9BB114A04C8A98E054935F5A8E965989636
            10B3C80FF0B0A50FC8F4D5F077F954FC62F809DC1BC7BD3AC2AFB0774EF2DEDB
            35F6355C5B96A36C52E0F0186AFDC189CEE52B3058DC16DCC5F82AAA26C2D3C7
            20333AB42A4000927DA0B427C7A9900AD40C79FA7CABEBD28BD8425B3C8B6E58
            82091AA8680D6BC3C8E69E7D595E6B2391AEEC3A9C8D5C5326DE7DAF93C4534D
            324E29655ACA78E242B22AB471CF23339F500030B1B0E7D9A4215B6B36E807D6
            78CAC7854509AFDA294E1D104F2DCFEFDFAF9431DB3E9D941CD0EA14AFC88CD4
            1E1D24B01B2F6BE5EBB218F6A69E8A85A3A8A6A8D55F5B0CD515E565828DE5A7
            A392089D69AA486F5865B7B51762F628639C306948AE00200E2727E5D31B45CE
            DF3DC4966B194B753424B1A9638151F6F9F418E4F6A6EFD83959818F2C2BE27B
            536570195966A6931D0BEA57CA53155781341052FE50083751C5D9FACB7BD4D2
            5902F9AB2FCBF09F3A11FCFA365B3B8B47A321320FC48D5C0E058796287EDE92
            DDABD1DD13F2376E51D3FC89EB5E9CED9C446C450B7656D9C3EE4C8D0D44E83C
            BFC372190A28EBF172CA0589A796362473EC9E6B68DA52B1C0DE2818A7A0F3FB
            3A3B8E76F0409E641157CCE3F3AF9F551DDBFF00F09EAFE5CFDA55F5B5DD6792
            DFDF1EAB6B2178A6C0F5BEE0A6CFEC59270C1E3AA8F6CEFAC667EA292112005E
            1A5C953C2F61E9523DA37B6BA526425FD7BB34FF0057974E28DBA42C1628F51F
            E124548F323AA25F9BFF00C8ABE5A7C4AD959EEC3EB1DC747F26FA971992692B
            713D7F80DCB41D8BB770869E6997706E1D8745056C35787A2929E386A9B195D5
            B286955BC023D6E94177344C8245210FE21C2BC73F3EAD259B3228B572E3CE33
            51C3D29839F2E27AA43C953E6368355D26E2D9F93C064B24BAD86736DCF8AAB8
            495B4738A7C9D1D35753A4551FD97452481AAFF5F6A9263230A3D7F3E8B5E29A
            DC112DA152C3895A7F84749E1981548AD5D3E41E7769E18D52AA828A9EBD028F
            DB114861AB9E34D6012E6DC5C0BDBDAB0CE30A8A079F13FCCF4905252753C9AE
            A7D287E54A548FCFA53E3F657646E0514F80D85BC37A3565DDE0C06D5DCF99D6
            D2EB0B234B88C7E4637294EDC1527D44F37B7BBF8B0A057696847CC60FD848C6
            3E7D69EDAEC90A2DE4707D14FF00847DBF6F52372F57F6575DE3E6977575A6EE
            DB53D4CE95B4ABBC362EE7DBF418F14E863748EAB3789A586A19564208258063
            AADCFBA8BA82731832768F3A824D739A1EB6FB7DDD9C4EEF68C2426B953DB4F9
            D29C3A6BD858DDC3BFF3AD86C5D450257D64ACF532D3D14DFE4E0CC0972C2289
            221E460058AFA545FE9ED43AC31856F26E0491FF00179E9246D3CCCC02D49F41
            C3FC9D5BA6C2FE4E1F3CF7EECDA7DD5D75B7F63EF7C46568D6614953BAAA36EE
            62380296826A7FE3F8AA6C7AC8AE0731D438606C0FD0FB46EECAE4AA8ED3EA33
            FEAF4E3D1C4514D147A59EA5BC8823F3D59033D10AEFFF0089BF233E3A6525A1
            EF7E9CDE3B42213787F8D0C24955B6AA929E514F2498FDD3894ABDBF90120FD3
            21A95327D48E7DF84E5C69652AD53C47FAB1D37716AE155DE8E87CD7D2BE7E75
            FB69D3CFC64EA6DE1F2A3BBBA93E33F567D8E2B7076B6EFC66D3C0D4E4EB09C5
            600D4472566633F94689E59E1A3C2E1A9AA6B2A2388179123D0BEB23DD522559
            35BD4B9F5E247974BBEB912D8C3147A235F43FCFE469C7ADB4374FFC2617A237
            364289F60FC96EEAD86B46B8FA3DC316E8DA3B2F760CEC70C091D757622A615D
            B151899EB647925A786435F1C024D24B8172FCD018111D2E070C80335FCB8D3E
            7D2686ECDCCCDAAD9A37069F161879715F3F2A13D17EDC7FF099A8EB20ADCF7C
            7AF9959D8ABA9EB0432C1DA1D698FADA98EBE188247F7190DABB969851533AC6
            09D74257431B5EFED8BAB29D2915C3A98D92BC08C7AF9FAF967AF595E43217B9
            B39275995A84EA526A0E2A081F9F0EABBBE40FF213FE60BD4495197EBEC7EC5F
            917491A45535B89E9BCEAE3F350AC923B3236CEDE32E23239677805CBD1D454F
            0DA02EA16F7A325D4601913F4E940DE94E34F304F91F2E9FA34D5315CAF8B5A9
            8FE106BE9C41F4352057AA48ECAC0EECEA4CA54ED2EE0EAFDE5D7DBAE8EB2A20
            C86DFDDBB6B33B3F262D31671450E669A0AAFBA815957529923239E411EDE865
            85C031FC7EA48343F3E8BAE10C202DCDA915F4FF009F4FCBA0769331165E78E0
            A2A69249E293C712BAF96452CC5631AD1805D4A5757D00B1361ED637851A9D6F
            407A2C72647544535CFF00B1D2B29F0DB825A44352B5D49434B506B3C14513D4
            B54D440AB35318C00D4D0D3231567D46FA49B7ABE8CF8D16BECCD703D3FCFD28
            5B5BB65A9D4235CFDBF6790A7A9EA2888B2CC29EA55643E4768EA18D5B99A425
            9EEEAC56DE46BE9E6C39FAFB71DD450B2D47ECFF0050E9AF0EA68A73F3C9E3FC
            FACF15066E29AD12D34E6588010D0B38AA2CF1A92F02AA0BB047FD2C758238FA
            7BBF8F00014302C7E7FE4E9D482E4E5143003CB8FE5D770652AE095A9F2F0C55
            0C913F827969CA562A12CCCB342F71AA32396502E1AFC7BB34B09EE032070EBC
            659A134963A9E02A3CBA9DFC5A96FAB53DFF00E04FDBF8B8B5ADF71A6DFE6B4F
            F6B57D3F37F75F163A713C3F9FF9BA7358D5FD93D7ECC57ECF4A75FFD9}
          Stretch = True
        end
        object PanelStowersNameLogo: TPanel
          Left = 108
          Top = 284
          Width = 208
          Height = 43
          TabOrder = 0
          object ImageStowersNameLogo: TImage
            Left = 4
            Top = 4
            Width = 199
            Height = 35
            AutoSize = True
            Picture.Data = {
              07544269746D61703E520000424D3E520000000000003600000028000000C700
              0000230000000100180000000000085200000000000000000000000000000000
              0000ECF0F0EBEFEFEBEFEEEAEEEDEBEFEEEAEDEDEAEDEDEAEDEDEBEFEFEBEEEF
              EAEDEDEBEDEEECEFEFEEF1F1EDF0F0E9EDEDE7EBEBEAEEEEECF0F0ECEFEFEBEE
              EFEBEFEFEBEEEFECEFF0EAEFEFE8ECEDE9EDEEEAEEEFEAEDEEEAEDEEE9EDEDE9
              ECEDE9ECEDEAEDEDEAEDEDEAEDEDEAEDEDEBEDEDEAEDEDEBEEEEEBEEEEEBEDEE
              EBEDEEEAEDEDEBEDEEECEEEFECEFEFEBEFEFEBEFEFEAEEEEECEFF0EEF2F3ECF1
              F2E9ECEDE7EAEBE9ECEDEBEEEFEBEEEFEBEEEFEDF0F1EDF0F1EBEFEFEBEFEFE9
              EDEDE9EDEDEBEFEFEAEEEEE9EDEDEBEEEFEBEDEFEAEDEEEBEDEFECEDEFECEFF0
              EAEDEEE9ECEDEBEFEFEBEFEFEBEEEFEBEEEFEBEEEFEBEDEDEBEDEDEBEDEDEBED
              EDE9ECECE9ECECE9EDEDEAEEEDECEFF0EBEFEFE9EDEDE9EDEDEAEEEFEBEFEFED
              F0F1EBEEEFE7E9EBE9ECEDECEFEFEAEDEEEBEDEDEAEDEDEBEDEEECEEEFEBEDEE
              EAECEDEAECEDEAECEDE9ECEDE9ECEDE7EAEBE6E9EAE9EDEDEBEFEFEBEFEEE9ED
              EDE9EDEDEBEFEFE9EDECE7EBEAE9EDEDEBEFEFEAEEEDE9EDEDE9EDEDEAEDEDEB
              EEEFEAEDEDE9EDEDEBEEEFEBEFEFE9EDEDE8ECEBEAEEEDE9EDECE9EDECE9EDED
              EAEDEDECEFEFECEFF0EBEFEFEAEEEEE9EDEDEAEEEDEAEEEDEAEDEDEAEDEDEAED
              EDECEFEFEBEEEEEAEDEDEAEDEDEAEDEDE9ECEDEAECEDECEFEFEBEEEFEBEDEFEB
              EEEFEBEFEFEBEFEFEAEDEEE9EDEDE9ECEDE9ECECEBEEEFEEF1F1EDF0F0EAEDED
              EAEDEDEBEFEFEBEFEFEAEEEFE9EDEDE9EDEDE9EDEDE7EBECE6EAEBE6EAEBE6EA
              EBE4E8E9E4E9EAE5E9EAE7EBECE9ECEDE9EDEDE8ECECE8EBECE9EDEDEAEDEEEA
              EDEDE8ECECE8EBECE9ECEDEAEDEEEBEEEFE9ECEDE8ECEC000000ECF0F0EBEFEF
              EAEDEDE9EDEDEBEFEEE9EDEDE8EBEBE9EDEDEBEFEFEBEEEFEAECEDEAEDEDEBED
              EEECEFEFECEFEFE9EDEDE9EDECEAEEEDEBEFEFEBEFEFEBEEEFEBEFEFEBEFEFEC
              F0F0E9EDEDE6EBEBE8EDEDEAEFEFEAEEEFEBEEEFEBEEEFEBEEEFEBEEEFEAEDED
              EAEDEDEAECECEAEDECEAECECEBEDECEBEEEEEBEDEDEBEEEEEBEDEDEAECEDEBED
              EEEBEFEEECEFEFEBEFEFEAEDEEE9EDEDEBEFEFEEF2F3F0F3F4ECEFF0E7EBECE9
              ECEDE9EDEFEAEEEFECEFF0EDF1F1ECF1F2ECEFEFECEFEFEBEEEFEBEEEFEAEEEE
              E9EDEDEAEDEEECEFF0EBEEEFEBEEEFEBEDEFECEDEFECEFF0EAEDEEE8EBECEAED
              EEEBEFEEEBEFEFEBEFEFEBEEEFEBEDEDEBEDEDEBEDEDECEFEFEAEDECEAEDECE8
              ECECEAEEEEEDF1F1ECEFF0E9EDEDE9EDEDEBEEEFEBEFEFEDF0F1EBEFEFE8EBEB
              E9ECECECEFEFECEFEFECEDEEEBEDEDEBEDEEECEEEFEBEDEFEAEDEDEAEDEEEAED
              EEEAEEEFEAEEEFE7EBEBE6E9EAE8ECECEBEFEFEBEFEEE9EDEDEBEFEEECF0F0EA
              EEEDE7EBEAE8ECECEBEFEFEBEFEEEBEFEFEAEDEDEAEDEDEAEDEEEAEDEDE9EDED
              EAEDEEE9EDEDE8EBECE6EAEAE9EDECE9EDECE9EDECEAEDEDEAEEEEECEFEFEBED
              EFEAEEEDE9EDEDEAEDEDEAEEEDEBEEEFEAEDEDEBEDEDEBEEEFECEDEFECEDEEEA
              ECEDE9EBECE9ECEDE9ECEDEAECEDEBEDEFEBEDEEEBEDEFEBEEEFEBEEEFEBEEEF
              EAEDEEE9EDEDE9EDEDE9ECEDEAEDEEECEFF0ECEFEFEAEDEDEAEDEDEBEFEFEBEF
              EFEAEDEEE7EBEBE5E9E9E6E9EAE6EAEBE5E9EAE5E9EBE6EAEBE5E9EAE4E9EAE5
              E9EAE7EAEBE9ECEDE9EDEDE9ECEDE8EBECEAECEDEAEDEDEAEDEDEAEDEDE8EBEC
              E8ECECEAEDEEEBEEEFEAEDEEEAEDEE000000ECEFEFEBEEEDEFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF0EEEEF2F7EFEFEFEFEFEFF1EBF0EE
              EBEDEFEBF0EFEFEFF1EEF0EFF0EEEFF0EEEFEFEFEFEFEFECEEF6EAECECE8E4E9
              EAECECEEEEEEEFEFEFEFEFEFEFEFEFECECECEAEAEAE7E9E9EAE6EBECEBEDEEEE
              EEEFEFEFEFEFEFEDEDEDEAEAEAE7E9E9E7E9E9EBEBEBEEEEEEEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECECECE9E9E9E8ECF1E7E9E9E9E9E9
              E4E7EBE6EBEEEFEFEFEEEEEEE9EBEBE9E9E9E8E7E9EAEAEAEEEEEEEFEFEFEFEF
              EFEEEEEEEAEAEAE8E7E9E9E6E8EAE6EBEFE9EEEFEBF0EFEEF0EEEEEEEBEBEBEA
              EAEAEDEDEDEFEFEFEFEFEFEFEFEFECECECE7E6EAE8E7E9E8EAEBEBEDF5F0F3F7
              EFEFEFF0EBEDEEEBEDE8EAEAEBEBEBE9E9E9E9EBEBEEEEEEEFEFEFEDEFEFEDED
              EDE7E9E9E8E7E9EAE9EBE5EAEBEFEEF0EFEFEFF1EEF0EFEFEFEFEFEFE8EBF0E6
              EBECEEEBEDEAECECE9E8EAE9E9E9E7E9E9ECECECEEEEEEEEEEEEECEEEEECEBF4
              E8EDF0E9E8EAEAEAEAEEEDEFF1EFEEEFEFEFEFF2F7EAF2F1E7E9E9E1E3E3E6E5
              EEE7ECEFEFEBF0E6EBEEE3E8EBE8E8E8E9E9E9EBEBEBEEEEEEEFEFEFEEEEEEEB
              EBEBEAEAEAEBEBEBE9E9E9EBEBEBF0EDEFEFEEF7E7ECEFE5E5E5E1E6E9E9E9E9
              E7E6EAEBEBEBECF3F6EFEFEFEFEFEFECE8EDE9EAE8E8E7EBEAEAEAECECECEEEE
              EEEFEFEFF1EFEFEEEAEFEBE7ECE8EAEAE9EBEBEAEAEAEBEBEBEEEEEEEFEFEFEF
              EFEFEFEFEFEFEFEFEFF0EEF1EEF0EFEFEFF1EFEFEFEFEFE7EBF0E7EBF0E7ECEF
              E7ECEFEFEFEFEFF0EEE7EBF0E7EAEEEFEFEFEFEFEFEFEEF7EFEFEFEFEFEFEFEF
              EFEFEFEFEAEDEE000000EBEFEEEBEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFF1EFEFEDEFF7EFEFEFEFEBF0F0EAEFEEEAEFF1EBF0
              EFEFEFEFEFEFEFEFEFEFEFEFF1EFEFF0EEEEE6E6E6DCDEDEE2E4E5ECECECEEEE
              EEEFEFEFEDECEEE3E2E4E0DFE1DFE1E1DFDEE2E6E5E7ECECECEFEFEFEFEFEFE9
              E9E9DCDEDEDADCDCDCDEDFE6E6E6EDEDEDEFEFEFEDEFEFF1ECEEE7ECEFEEEAF0
              EFEFEFEFEFEFEEEEEEE6E8E9DBDDDED8DEE3D8DCDDD9DEDDE2E1E5EEE8EDEFEF
              EFEEEEEEE6E6E6D8DDDCDBDDDEE2E4E4EBEBEBEFEFEFEFEFEFE9EBEBDFE1E1DC
              DEDFDEE0E1E0DFE3E7E6EAEDE9EEEFECEEECECECE3E5E5DFE4E3E8EAEAEFEFEF
              EFEFEFEDEDEDE4E6E6DDDFDFDFE1E1E3E5E5EAEAEAEEEEEEEFEFEFEDE9EEE3E2
              E6DFE1E1DDDFE0DCDEDFE3E5E5EDECEEEFEEF0F1EEF0E8E7E9DCE0E1DCE1E0E3
              E5E5EBEBEBEFEFEFEFEEF7F0EFF8EDF0EEEDEFEFEFEFEFEFEFEFEEEEEEE4E6E6
              DCDEDFDBDEDCDDDFE0E6E8E8EEEFEDEFEEF0EEEEEEE6E6E6DCE0E5DBDDDDE2E4
              E4EDEBEBEFEFEFEFEFEFEDEBEBE1E8EBDCE2E7D9DDE2E2E6EBF0EBEDEFEFEFEC
              ECECDCE0E5D8DCDDDBE0DFE5E7E7EDEDEDEFEFEFEDEDEDE6E6E6DEE0E0DDDFDF
              DCDEDEE3E5E5EDECF5EFF4F7ECEEEEDEE0E8D5D8E0D3DADDDCDBDFE4E6E6EDED
              EDEFEFEFEDECEEE4E3E7DADFDEDEE0E0E3E5E5E9E9E9EEEEEEEFEFEFEFEFEFEB
              E7ECDFDEE2DEE0E0E0E2E2DDDFDFE3E5E5EDEDEDEFEFEFEFEFEFEFEFEFEFEFEF
              EFEFEFF0EFF8EFEFEFEFEFEFEFEFEFEFEFEFE8EBEFE8EBF0E8EBF0EFEFEFF1EF
              EEEFEFEFEFEBF0F1EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8ECEC00
              0000EAEDEDECEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEF0EFEFEFEFF0EEEFEEF0
              F2F0F0EFEFEFEFEFEFEFEEF0F1EFEEF1EFEEEAEBEFF2EBEEEFEEF0EFF0EEF0EF
              F1ECEFEDF2F0F0D4CDC4534D00BCBDADDBDDDDE8E9EDEEEDEFEFF0EED9D8CE64
              5D1E9F9B7E7A7138C8C5B7DDE2E1E8EAEAF0EFF8E5E5DF685F209D9A7B6D652A
              A5A488E9E4E6EEEDEFECEFEDEEEFF3EAECEDEDECF0F1EEF0EEF1EFEFF0EEDCDA
              D0655F1E878152979A7A655D1A9B9A78E2DFE1EDE7ECEDEFEFD2CFC1544B0291
              926B7B7845E3E2E4EEEBEDEDF0EEEEEFED847E49776F3A918B60908B64DADEDF
              E5E6E4EEEBEDF0EAEF9F99747F7B48D7D9D3EAEAEAEDEFEFF4EFEED9D6D15D55
              0F8F8B62827C47D6D4CCEBECEAEEEEEEEFEBF0A9A485837E47CFD2D0554A00A4
              A58BE3E5E5EEEEEEF1EFEFE5E5DF675E1E908D6178713AE7E9E9EFECEEF1EEF0
              EDEFEFEFEFEFF0EEEDEFEFEFEFEFEFEFEFEFBEBAA1675E1EADA9965C550CC4C1
              B2E6E8E8EEEEEEEFEFEFD2CEC3544B0192906D7E7843E4E5E3EAECECF1EFEFF1
              EFEE817D4A9A95747D7748D9DCE4E7E6E8EEEDEFEFF0EEA8A586665B1D8D8960
              A09B7CE5E8E6EEEDEFF1EFEFAAA586807C47CED1CF544B01A6A688E3E7E8EEF3
              F6EDF4F7DEDDD9564B01B1B4A4635D1AA2A28AE6E6E6EFF0EEF0E9F0D6D7CD5C
              530F8882537F7B48CBC9BEEBE8EAEEEBEDEFEFEFF1EEF0807C497C7848D0D1CD
              5D560DA8A488E3E5E5EBEDEEEFEFEFEEEFEDF1F0ECEFEEF0F1EFEFEFEFEFEDEF
              EFEDEFEFEFEFEFEFEEF0E8EBEFE7EAF2E7EBECEFEFEFEFEFEFEFF0EEEFEFEFEE
              EAEFEFECEEEFEFEFEFEFEFEFF0EEEFEFEFEFEFEFE8ECEC000000EAECEDECEFF0
              F0F0F0EFEFEFEFEFEFEFEFEFEFEFEFEEEEEEEFEFEFEFEFEFEFEFEFEFEFEFF1EF
              EEEDEFF0F1EFEEEEF0F0EFEEF0EEEBEDF1EFEFEDEFEFEFEFEFF0EFF1EFEFEFEF
              F0EE514B00A5A286BDBFB3E2E9ECEDEFF7EFEEF0A19C758F8D64D9DCE1BDBAAB
              7E7B44DDE0E5E9E9E9EEF3F4EFEFEF7473377C7946706E34D5D9DAE3E8E7ECEF
              EDF2F0F0F0EBEDEFECEEEEEBEDEFEFEFEFEFEFEDEEF2EEEFED7F7B485D54107E
              7948746F38B4B5A5DEE3E1EEEAEFEFEEF0ECEFED564B01A5A384B6B4A2E2E4E4
              ECECECECEEEEF2EEF39A9875989471D9DDDE777037C3C3B7E3E5E6EEE9EBEDEC
              F0C5C4B09B9872DFE1E1E9E8EAF0EFF1EFEFEF9C9A77928D66DBE0DFD9DAD8DA
              DED9EBEBEBECEEEEF1ECEEEFEBF078743A7F78476C6728DFDEE0EBEAECEFF0EE
              EDEFEFEEEEEE7C723CDDDFE0D4D2CAEDF0EEEEEFEDEDEFEFF3EEEFF1EFEEEFEF
              EFEEEDEFEDECF0EFF0EEF0F2FA70682C7B774290906CD9DDDEE7E9E9EEEFEDEE
              EEF4EDEEEA544C00A1A385B4B5A5E0E5E3ECEBEDEFEFEFEFEFEFBCB8A0A09D7E
              645E1DDAE2E2E7EDF2F1EFEEF1EFEEC5C3B16E672892906DCFD2D0E5E8E6EDEC
              EEEEF1EFEBF0EF70682C807948716D38E0DFE9EAECECEFF4F5EFF4F7EDF2F577
              73398B89607B7645D3D8DBE7E5E5ECEEEFEFECEEA7A783868357DFDFDFE1E4E8
              D6D4CCE7E6EAEDEAECF1EFEFECEEEE9C9776848154B3B3A3635C1DD6DDDAE5E5
              E5EEEAEFE7EAEEF1EBF0EFEEF0EEEBEDEEEBEDEFECEEEFEEF0EFEFEFEFF0EEEF
              EFEFECEBEDE9EAEEECEEEFEEF0F0EEEEEEEFEFEFF1EEF0EEEAEFEFECEEF2F0F0
              EFEFEFEFEEF0EFEFEFEFF0EEEAEDED000000E9ECEDEBEFEFF1F2F6EFEFEFEFED
              EDF0EDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDEFEFF1EFEEEDEFF0F0F0F0EE
              F1F6F0F0F0E8ECEDEEEAEFEEEFEDEFF0EEEFEFEFEEEFEDEEEEEE534A00868055
              C2C0B5E6E9F1EEEFF3F1EFEFAAA5849E9873D9DEE1B3B09B7F7B48E4E4E4ECEC
              ECEFEFEFEEEDEF797239A49D7C5C530FDBDFE0E6EBEAEEEDEFF1EFEEF0EEEEEF
              EEF0F0F1EFF0EDEFF0EEEDEEF0F0EBEDED7C733A8A8253AEAE90534A00D4D5D1
              E3E7E8EFEBF0F1EFEFF0EEED544B028C8A62BAB8A6E4E4E4EAEEE9EFEEF0EFEE
              F09E9C74999670DBDDDD6F672BB9B9ABE6E8E8EEEEEEEFEBF1C3C4B09F9674DF
              E2E6EBEAECF0EEEDEFEFEFA29D769C9973E0DFE1CFCDC5D0D2C6E8E8E8F0EEEE
              EDEFF0EFEEF0A19A79685F1CACA88BE7E6E8ECEFEDF1EFEEEDEFEFEFEFEF7871
              38DEE3E1E4E6E6EEEEEEEEF0F1EFEFEFEDEFEFEFEEF0EDEFEFEFEFEFE8ECEDEE
              EDEFEBF1F671692E9494707B7747E0E2E3E9EBEBF4F0EFEAEFEDF1EEF0544B02
              878154BCB7A8E4E6E6EFEDEDECEEEFEFEFEF817D4A78713AA39C81DDE1E2EAEC
              EDF0EBEDEFF0EEC3C3B1665D1D7E7745DCDEDFE9EAE6ECEEEFEEEEEEF1EAEFA3
              9B7670692AACAB91E3E8E7ECEEEEEFEEF7EFF4F7F2EDEE77723BB4B098655C1D
              D6DCE1E8E4EAEFECEEEEEDEFB5B195A19974DEE4DFD9D8D4D2D2C6E7EAE8EDEB
              EBF1EBF0F1EFEEA19A73757137979370665D1DDCDEDFE4E8E3E7EAEEE4EBEEEF
              ECEEF1EEF0EFEBF0EEEAEFEFECEEF1EEF0F0F0F0EFF0EEEFF0EEEFEFEFEDECEE
              F0F0F0F0F2F2EEF0F0F0EEEEF1EEF0EFEEF2EDECF0F0EBEDEFEFEFEFEEF0EEEF
              EDEFEFEFEAEDED000000E9EBECEBEEEFF0F3F7EFEFEFEFECEEEFECEEEFEFEFED
              EFEFEFEFEFF1EFEFEFEFEFEFEFEFF1EFEEEDEFEFF1F3F4EFF2FAF0EEEDE7ECED
              ECF1F0F3EEEFEFEEF0EDEFF0EFF0EEBEBAA2534B059E9972A6A583EAEDF2EDF0
              F8EFEEF0E5E4E078743A9C987577723BC2BFB1EDEDEDF0EEEEEDEFEFD0CFC16A
              6020807D4A6F692EECEAEAEDEDEDEFEFEFEFF0EEF0EFF8F0EFF9EEEFEDEFEBF0
              F1EEF0EDF0EED2CEC3595711D7D5CDECF1F267601BC5C2B3E9EAF4EFF0F4EFEF
              F5C6C4B2564A029D9A748E855AE9EBEBF0EEEDECEEEEF0F0F077763A7A733C80
              7B4A777339EAEBE9EBEDEEF1EFEEEAEBEF8C875A847A4AE6E8E9EEEDEFF1EFEE
              F1EEF0E3E4E073692D9D997671692DC5C1AFE9EBEBEDEFEFF1EFEFEDEFEFE6E7
              DE73682EE8EAEBEDEDEDEFEEF0EFF0ECF1EEF0D4CFC05B5710CCCBBDECECECED
              ECEEEFF0ECEFEFEFEDEFEFF1EFEFEFF0EEEFEFEFEDECEEF2EDEEB2B195685E1E
              807C47929068E9EBEBEEEFEDF1EDF2F0EFF1C6C3B4534A00A09775A5A482EAED
              EBEEE8EDEEF2EDECEEEF9993689E9C74817D4AEDEBEBF0E9ECF2EBF2EFEFEF95
              936A685F1B8A8558C3C2AEEFEDECEBEDEDF0EFF1EFEFEFE4E6E0685F20E7EBF0
              EDECEEEFEBF0F3F1F1ECF0F5D2CFC15D550F98926969682BE9E6E8EBEAEEE8EB
              EFE8EBEFE5E0E17B753A9D9B7273692DC3C1AFECEBEDF1EDF2EDE9EFEFEFEF77
              753B8E855AC7CABB5D550FCDCDBDEAEDEBF1EAEFEDECF0EDECEEF0E9F0EEF1EF
              EFEFEFEFEFEFEFEFEFEFEFEFEDEFEFEFEFEFEFEEF0EEEBEDEFEFEFEEF0F0EEEE
              EEEFEDEDEFECEEEFEBF0EEEAEFEEEBEDEFEBF0EEEBEDF0F0F0EFEEF0EAEDED00
              0000E8EBECE9EDEDEDF0F4EFEFEFF0EDEFEFECEEEFEFEFEDEFEFEFEFEFF1EFEF
              EFEFEFF1EFEFEFEFEFEDEFEFF0F3F7F0F3F8F1EFEFEDEFF0F1EEF0EFEFEFEDEF
              EFEFEFEFECEEEEEEEEEEEDEBEBEDEEECEBECEAEFEDECECF1F4EAECF4EBE8EAE5
              E4EDE4E7EBF0EBECEEECEBE9EDE8EEECECEBEAEEECECECEAEDEBEEECECECECEC
              ECEDEBECECECECECECEDEDEDEBEBEBEAECECECECECEDE8EAEAEDEBECEDEBEBED
              EDEBEAECEFEDEDECF1F4ECEDEBE9EBECEBEEECEBEBEBECECECEAECECECEBEFEC
              EDE9ECEDEBEEECECECEBEDEAECEDEEECEBF1ECEEECECECEAECECECEBEDEAECEC
              E9EBECE8EDEBEDE7ECE4E9ECE5E8EDECE8EDEBECEAEDECEEECEDEBEDEEECECEB
              EDEFEDEDEAECECE9EDEEECECECECECECEAEDEBEEECECEEECEBE0E1DDECEDEBE9
              EBEBEEEBEDEAECECECEDEBE7ECEBEAEDEBECEDEBEDEAECEDEEECEAECECECEBED
              ECEBEDEEECECECECECECECECEDEBEBEAE9EBEEEBEDEAEDEBEFEDECE8ECEDECEB
              EDECECECEBEDEDEFEBEAECECECEAECECECE9EBEEEAEFECEDE9F0EBEDECECECE9
              ECEAEFEDEDEAECEDECEBEFE9EBECECE8EDEBE7ECECECECECECECECEDEBEDEDED
              EEEBEDE8ECEDECEBEDEEECEBECEDEBEAECECE2E2DCECEBEDEBEBEBECE8EEEEEC
              EBEAEDEBEBEDEEECECECEDEAECEEE9EBEEE8EDEEE9EBE3E8EBE3E5E5E3E7ECEC
              ECECECEBEFE8ECEDECECECECEDEBEAEDEBEDECEEEDECE8F0EBECE8E9EDECE8ED
              EEE9EBEDECEEE9EBECEEEEEEF0EAEFF1EAEFF0ECF1EEEFEDEFEFEFEFEFEFEFEF
              EFEFEFEFEDEFEFECEEEFEFEEF0F1EEF0F0F0F0EFEFEFEFEFEFEFEFEFEFEEF0EE
              EAEFEFEBF0F2EFF1EEEAEFEFEBF0EEEAEFF1EFEFEAEDED000000E9ECECEAEDEE
              ECEDF1EFEFEFF1EFEFF0EDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEF0EFEFEFEDEF
              EFEDEFEFEEF3F6F0F3F7F0EFF1EFEFEFEDF0EEEFEFEFF1ECEEEEEEEEEBEAECE5
              E5E5E2E4E5E3E2E4E4E3E5E0E2E3E1E7ECE0E7EAE3E3E3DCE0E5E1E4E2DFE4E3
              E3E2E6E2E3E7E0E2E3E5DFE4E2E4E5E3E3E3E5E2E4DFE4E3E4E3E5E1E3E4E1E3
              E4E3E2E4E3E2E4E4E3E7E2E0E6E3E0E2E4E3E5E3E2E4E2E1E5E4E4E4E0E2E2E1
              E7EEE3E2E4E0E5E4E3E2E4E1E0E4E2E3E7DFE4E2E1E2E6E2E3E7E1E2E6DFE3E4
              E0E1E5E1E3E4E6E3E5E1E3E3E1E3E3E4E5E3E1E3E4E5E3E2E4E3E5E0E3E7E0E4
              E5E0DFE1DCE1E4E3DFE4E2E5E3E3E2E4DFE2E6E1E3E3E4E4E4DFE4E3DFE4E3E1
              E3E4E2E1E5E1E3E3E3E2E4E4E4E4DFE4E3E1E2E6E0E3E1E2E4E4E0E2E3E4E3E5
              E3E3E3E3E2E4E4E1E3E1E2E6E1E3E4E2E4E5E1E3E4E3E2E4E3E2E4E3E4E2DFE4
              E2E1E3E4E2E4E5E4E4E4E1E2E6E1E3E3E1E3E3E3E4E2E4E3E5E1E3E4DFE3E4E2
              E4E4E3E4E2E1E3E4E1E1E1E2E4E4E3E2E4E3E3E3E1E3E4E2E4E4E1E3E3E3E3E3
              E1E3E4E1E3E4E4E4E4E2DEE4E6E4E4E2E5E3E3E2E4E3E2E4E1E3E3E5E2E4E1E5
              E6E2E2E2E0E4E5E1E3E3E3E3E3E5E3E3E3E3E3E3E0E2E0E2E2DFE4E3E3E2E4E2
              E4E5E0E4E5E4E4E4E5E2E4DFE4E7E2E1E5DBE0E1DCE0E5E5E2E4DFE4E3E3E2E4
              DFE3E4E2E4E5E1E3E3E1E3E3DFE4E3E6E3E5DFE2E6DDE2E3E3DFE5E1E3E3E2E1
              E5E6E0E5E9E5EAECEBEFF0EAEFEFEDEDEFECEEEEEDEFEFEFEFEFEFEFEEEEEEED
              EDEDEEEEEEF0F0F0EDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECEEEEEBEDEDECEE
              EEEAEFEEEBEDEFEBF0F1EEF0EAECEC000000EAEDEDEBEFEFEFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEF0EEF0F1ECEEEEE8EBEFEEF0F1EF
              F2F6EFF3F4F0F0F0EFEFEFEEF1EFF0EAEFEAEAEAD1DBDBCBD5D5C6D2D2CAD1D4
              C5D3D2C8D1D4CAD5D9C9D5DBC9D4DCC8D2D9C7D3D5C5D1D1C8D3D1C6D2D2CAD2
              D2CACDD5C8D1D4C7D3D3C8D1D4CACFD2C8CFD2C8D2D2C6D4D0C6D2D4C6D1D5C6
              D2D4C8D1D4C7D0D3C8CFD2C9D3D3CAD1D4C6D2D4CAD5D9C9D5DBC7D3D3C8D2D2
              CAD1D4C9D2D5C8D2D2C8D2D2C3D0D2CBD3D2C6D2D4CAD5D9C6D2D4C8D1D4C6D2
              D2C8D2D2C6D3D5C7D1D1C6D1D5C6D2D2C8D3D1C7D5DBC8D4D6C7D0D4C6CFD3C6
              D1D5C5D3D2C8D2D2C6D2D4CBD3D2C5D1D1C9D3D3C8D2D2C8D3D1C9D2D6C7D1D1
              C6D2D4C7D5D1C8D1D4C7D3D3C4CED5C6CFD2C8D3D1C8D3D1C8D2D2C9D3D3C9D2
              D5CAD2D1C9D3D3C6D2D4C6D2D2C8D2D2C6D2D4CAD1D4C6D2D2C8D1D4C7D1D1CA
              D1D4C7D3D5CBD0D3C8D1D4C6D2D2CAD2D2C8D1D5C8D2D2C9D2D5C5D1D3C5D1D3
              C8D1D4C6D2D2C6D2D4C8D2D2C7D3D5C6D2D2C9D2D5CAD1D4C6D4D3C9D1D1C6D2
              D2C6D2D4C7D1D1C8D1D4C7D3D5C6D2D4C8D2D2C8D1D4C6D2D2C9D2D5CACDD5C8
              D1D4C9D2D6C6D1D5C8D3D1CAD1D4C8D2D2C8D1D4C8D2D2C6D2D2C8D1D5C8D2D2
              C9D3D3C8D1D4C9D2D5C4CFD3C9D4D2C8D1D4C8D1D4C9D2D5C8D2D2CAD2D2CAD0
              D5C9D2D5C6D3D1C9D3D3C3D3D2C1CFD5C3CFD3C9D3D3C7D1D1D4D7DCE5E4E6EE
              EEEEEEEEEEEFEBF1F1EBF0EFECEEEFEEF0EFEFEFF1EFEFF1EFEFF2F0F0EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEEDEFEFECEEEFECEEEFEBF0F1EFEFEFEC
              EEEEEBEDEAEDED000000E9ECEDEAEEEDEFEFEFEFEFEFEFEFEFEFEFEFEFEEF0EF
              EFEFF0F1EFEFEEF0ECEEEFF0F4F5F0F0F0E6EAEFF0F0F0EFF4F5EFF4F7EDEFEF
              F1EAF1EFEFEFEBF0EEDCE1E2A4BCC2A5BDBDA0BAC0A3BDBDA2BDC1A7BCBEA5BB
              C0A7BEC0A7BDC2A3BCBEA7BBC0A5BCBEA3BCBEA5BBC0A6BEBEA3BCBEA4BDC1A2
              BBBDA7BCBEA1BCC0A7BBC0A4BDC1A4BDC1A3BCBEA6BEBEA5BCBEA6BCC1A3BCBE
              A7BBC0A1BCC0A5BDBDA5BCBEA5BEC2A3BCBEA8BBC2A4BDC1A3BCBEA3BCC0A5BB
              C0A3BBC1A2BBBDA5BBC1A6BCC1A3BDBDA5BCBEA3BCBEA6BDBFA5BBC1A3BCBEA4
              BDC1A7BCBEA3BCC0A3BCC0A4BDC1A8BBC2A3BCBEA4BABFA4BCBCA4BDBFA5BCBE
              A6BDBFA3BCC0A4BCC2A5BCBEA5BBC0A5BBC0A3BCBEA3BCBEA6BCC1A3BCBEA5BB
              C0A2BBBFA4BABFA5BCBEA3BCC0A5BBC1A3BCBEA5BBC0A3BCBEA4BDBFA2BAC0A2
              BEBFA8BCC1A5BCBEA3BCC0A5BBC0A4BDC1A3BDBDA4BDC1A5BBC0A4BEBEA4BDBF
              A3BCC0A5BCBEA7BCBEA1BCC0A4BDBFA5BCBEA4BDBFA5BBC0A4BAC0A3BCBEA5BB
              C0A5BCBEA3BCBEA5BCBEA5BBC0A3BCBEA3BBC1A6BEBEA5BBC0A3BDBDA4BCC2A5
              BCBEA5BCBEA5BDBDA3BCC0A3BCBEA2BBBF9EBBC0A4BAC0A0BCBCA2BBBDA2BBBF
              A5BCBEA4BCC2A3BCC0A3BCBEA6BDBFA7BCBEA4BDBFA5BBC0A3BCBEA3BDBDA4BC
              C2A5BCBEA1BCC0A5BBC0A3BDBDA6BDBFA3BCBEA3BCBEA3BCC0A5BCBEA3BCBEA6
              BCC1A2BEBFA5BCBEA5BBC0A2BBBDA5BBC0C5D0D4EAE8EEEDE9EEEFEEF0F1ECEE
              F1EBF0EFECEEF0F0F0EEEEEEEFECEEEFECEEEFEEF0EDEFEFEFEFEFEDEFEFEDEF
              EFEFEFEFEFEFEFEFEFEFEFEEF0F1EEF0EFEFEFEDECEEEFEFEFEFEEF0EAEDED00
              0000E8ECECEAEDEEEFEFEFEFEEF0F1EFEFEFF0ECF3EEEFEFEEF0EBF0EEF1EFEF
              EFF3F8EFF4F7F2EFF1E7EAEEEFEFEFEDF3F8EFEFF5EFEFEFF1EFEFF2F1EDEFF0
              EEEDEFEFEEEEEEEFEFEFEFEFEFF1EEF0EFEFEFE7ECEFF1EBF0ECF2F7F2F3F7ED
              EFEFF1EAEFEFEEF0EDEFF0EFEFEFEFF0EEEDEFEFEFEEF0EEF0F8F0EEEEEDECEE
              EEEAEFF1EFEEEDEFEFF2EFF1F1EFEFEDEFEFF0F1EFF1EDF2F0EBEDF1EEF0F1EF
              EFEDEFF0EFEFEFF0F0F0EFF0EEF1EEF0EDEFEFF4F0EFEFF0EEEDEFEFF1EEF0EF
              EFEFF1EFEFF1EFEFEFEFEFF3EEEFEDEFEFF1F0ECEFEFEFEFEEF0EEF1EFEFEFEF
              F0F1EFF1F2F6F5F4F6EDEEF8E7ECEFF0EBEDEFEFEFEFEFEFEFEFEFEEF0F0F0EE
              EEEDEFEFF1EFEFEFEEF0EDEFEFF2EFF1EBF0EFF0EFF1F1EFEFF1EFEFE7ECEFE7
              ECEFEDEFEFEFEFEFEFEFEFEEEFEDEEEFEDEEEEEEF1EFEFEFEFEFF1EFEFEDEFEF
              EFEFEFF1EFEFEFEFEFEAEFEDF2F0F0EFEEF0F1EFEFEFEEF0EEEEEEEEF0F0F1EE
              F0EFEEF0EEF0F0F1EFEEF1EFEFEFEBF0E7EBF0F1EBF0EEEFEDEEF0F0EEEDEFED
              EFEFF4EDF0EDF1ECEDEFEFEFF0EEF3EEEFF3EEEFEDEBF1EFEEF0EFEFEFF0F1EF
              F1EFEFEDECEEE7EBF0E7ECEFE7EAEEE5ECEFE7E7E7E8E6E5E7ECEFEEEBEDEFEC
              EEF0EFF1F0F0F0EDEFEFEFEFEFEFEFEFEFEFEFEDF0F5EFEEF0F1EBF0F1EFEFEF
              F0EEEFEFEFEEF1EFEDEFEFF1EDF2EDEFEFF1EFEFF1EFEFEDF0EEF1EFEFF1EEF0
              EFECEEECEEEEEFF0EEEFEFEFEDEFF0F1EFEFEEEAEFEFECEEEFEFEFF1ECEEEDEA
              F3EFECEEF1EBF0EFF0EEEDEFEFEFEFEFEDEFEFEDEFEFEEEEEEEFF0EEECEFEDF0
              EFF1EFEFEFF1EFEEEFEFEFEFEFEFEFEFEFEFEFEFEAEDED000000E8EBECEAEDEE
              EFF0EEEDEFEFEFEEF0EDEFF7EDF1ECEEEDEFEDECEEEEECECEEF1F6F0F3F7EEED
              EFEEF0F0EDEEF2EFF0EEF0F0F0EFEEF0ECF0F1ECEDF1EFECEEECEDEBEDEDEDEC
              EDEBEDEEECEEF2F7F1F0F9EEEAEFEFECEEEFEEF0ECF4F4EFEFEFF1EFEFEEEEEE
              EDEDEDEFEDEDF2EDEEECEFEDEFEFEFEDEFEFF0F0F0EEEAF0F1EDF2EDEFEFEFF0
              EEEEEDEFF0F0F0F1EEF0ECEEEFEDF0EEEFEBF1ECEFEDF1EFEFF2F0F0F1EFEEED
              EEF2EFEEF0EBEDEDECECECECEBEDEDEDEDECEBEDEAEDEBE9EEEDEAEDEBEAECED
              EBEEECEBEDEEEBEDEEEDEEECEEEBEDEFEBF0EAECECEFEDEDEFEFEFF0F3F8F7F3
              F9EFEDEDEEE8EDECE5ECEBEDEDF0EEEEEFECEEEFEDEDEBEEECF0EEEDEDEDEDF0
              F0F0F1F0ECEFF0EEEFF0EEECEEEEEFF0EEECEEEEE3E9EEE5EAEDECEDEBECEBED
              EEEBEDE9EDEEEFE8EDEAECECECEBEDEAECECECEDE9EAECEDECF0EBEEF0F1EEEF
              EDF0F0F0EFEEF0ECEEEEF0EEEEEEF0EAECEFEDF0EDEFEFEFEFEDEEECEDEAECEC
              EEEFEDEFEFF1ECEEEEEAEFEFEFEFF2F0F0EFEFEFF0EBEDEBEDEDEAEBEFEAECED
              EDEAECEFECEEEAEEEFEDF1ECF0EBEDEEEFEDEDEEF8EFEDECECECECEEECEBEDED
              EDE6E8F0EFF0EEEFF2F7E3EAEDDDE1E6E6E3E5E4E8EDEEE8EDECEDEBF0EEEEF0
              EEEEEDEFF0EEF1EFEFEFEFF2F0EFEFEEF0EAEAF0EBEAEEEEE7EEEFE9EEEEEAEF
              EFF0EEF0F0F0EDF1ECF1EFEFEDEFF0F1ECEEEFEFEFECEFEDF0EBEDECEDF1EBE7
              EDEBEBEBECEDEBEEEFEDEEEAEFF0EAEFEFF0EEF0EAEFEBEAECECEDEBEBE9E9ED
              ECEEEDECEEECEDEBEEE8EDEBEAECEBEDEDEFEDEDEFEEF0F0EEEEF0F0F0ECEFED
              EFEFEFEFECEEF0EEEEEFEFEFEAEDED000000E9ECEDEBEDEFEFEFEFF1EFEFEEEF
              EDECE9EBE4E9E8E2E4E5DFE4E3E4E6E7E8E8E8E8EEEDE8E7E9EFEBEAEDF0EEEF
              EEF0EFEFEFEFEFEFF0EEEEECECECE5E7E7E4E6E7E3E5E5E1E3E4E3E5E6E8EAEA
              EDEDEDEFEEF0EFEFEFF1EFEFEEEEEEEFECEEEAEAEAE8E9E7E5E7E8E7E7E7E6E8
              E8E7E9EAEDEBEAEBEEECF0EFF1F1EFEEEFEFEFEFF0EEF1ECEEE7ECEBEBEBEBEA
              EFEDEFEFEFF1EFEFE5E8EDE8EAEAEAECECEDECEEEDEFEFEFEFEFECECECE7E8E4
              E3E5E5E1E6E5DFE4E3E4E4E4E7E4E6E4E4E4E0E5E4E7E3E8E6E5E9E2E4E5E8E8
              E8E6E5E7E1E5E6E2E1E5E7E1E6E5E8E6EAEBF5F4F3F7F7F2F4E6E8E9DFDEE2DB
              DFE0E1E0E4E4E6E7E1E6E4E5E6E4E3E8E6E8E7EBE8E7E9EBEAECE9EEECF0EFF1
              EEEDEFF0F0F0F0F0F0EFEDECE1E5EADAE0E5E3E4E2E4E3E5E1E4E2E0E2E2E1E1
              E1E3E5E5E1E0E4E4E2E8E1E3E3E7E7E7ECECECEAEEEFEFEFEFEEEDEFEEEEEEEF
              F0EEEBE9E8E3E7E8ECEAEAEAE9EBE6E2E7E4E3E5E7E6EFE8E7E9E6E8E9E7EBEC
              EDF0EEEFF0EEEFF0EEECEFEDEEECEBE3E9E8E2E5E3E3E6E4E4E4E4E2E5E3E9E9
              F5ECEFEDF0F0F0EDEDEDE7E9E9E5E4E6E5E5E5E1E3E3E5E4E6E9E9E9F0F0F6EF
              F7F6E9EEECDEE0E0D9DEDCDAE0E5DCE0E5D9E2E5E1E6E7EFECEEEFF0EEF1EEF0
              EDEFF0EFF0EEEFEAEBE0E7EAE5E1E6E0DFE1E0E1E5E8E2E7EBE6E8ECECECEEED
              EFEEF0F0EDECF0EDEFEFF3EEEFEDEDEDE4E5E9E4E0E5DAE3E7DDE1E6E1E3E4E5
              E8E6E4E9ECE3E9EEEEEBEDE8E4E9E5E2E4E5E4E8E4E4E4E3E2E4E5E6E4E1E2E6
              E3E0E2E5E6E4E3E5E5E6E5E7EAEBE9F0EDEFEBECF0EDEFF0EFEFEFEEEBEDEFEC
              EEF1EEF0EAEDED000000EAEDEDECEEEFEFEEF0EDEFEFE9EBEBE2E4E4BFC1B5B8
              B6A4B6B6A4C0BCA9CBC7BCE4E9EADBE1E0DFE1E2E6E5E7ECEEEFEDEFF0EFEEF0
              E6E4DCC5C3B1BDBFA9BBB9A7B9B6A7BAB8A6CCCDC4E9EAE8EEEDEFEFEEF0EDF1
              ECEFEEF0EFECEEE6E4E4DBE0E3BDBBA9BFBEAACBCABCE3E5E6DFDEE0E0E0E0E6
              E6F2ECECECEFF0EEEFEFEFEFF0EED9D7CDE3E2ECE6E6E6ECECECEFEEF0F1EEF0
              D0D4CEE1E3E4E3E5E5EDEBEBEEF0F1F0EEEEC4C5B1BDBDABBDB9A6BBB8A9B7B8
              A4B8B9A5BBBBA9BFBBA9B9B9A7B9BAA6C1C1B5C7CBBFBCBAA8BDBBA9BDB9A7B9
              B6A8B8B5A6D9DAD6E9EBF5ECEFF4E4E7ECB0B19794906DA29A7DE0DCE1C8C6BE
              B3B5A2B9B9A9CAC9BBE5E4E6DFDFDFE0E2E3E5E9EAEEEDEFF2F0F0F1EFEFECEE
              EFD0CFC1C5C0ABBAB8A6B8B5A7B6B8A5B4B5A1B3B5A2B7B7A5BDB7AAB6B7A3B5
              B5A3B5B7A3DBDAD6EAECECEEEEEEEFEFEFF0F0F0F0ECF1E8E8E8B4B29ADFE0E4
              E3E5E6D8D6D5B4B9A4BAB8A6BEBEB2E4E6E7E2DEE3DFDEE2E8E1E8EDEEECF0F0
              F0E4E3DFC3C4B0BFBEAABBB9A7B6B8A5B6B6A4CFCCC7E8E8E8EBEDEDEFEFEFD0
              D0C0BFBDABB5B7ABB6B6A8B4B6A2BDC3B2E5E8E6EDF1F2F1F4F8C5C4B0BABAAC
              B6B6AAB2B8A7B4B5A5BDBEB5E0E3E8E3EAEDF1ECEEEEF0F0F0F0F0EFECEEE5E8
              E6D5D0D1B3B2A4B4B4A4CBCCC3DFDEE0DBDFE0E6E3E5EDEDEDECEFEDF3EEEFEF
              EFEFEDEFF0CFD0C0BCBDADB7BAAAB4B7A8B4B4A6B9B6A7D7D8D4E5E9EAE9E5F0
              D5D4D0C1C2AEBBBBA9BAB8A6B8B5A6B8B6A4BEB7A8BDB7AABCB6A9B8BAA6B8B8
              A6D0D4CFE3E2E4EEECEBEDEFEFF1F0ECEFEEF0F1EFEFEEEAEFF1EFEFEAEDED00
              0000EBEFEFECEFEFF0F0F0ECEEEF9690657D7847786E385C550C9A9870C3C1AF
              A8A48778733C9A9771D9DBDBD8DDDCE4E6E6EFEDECEFEFEFE1E5E09B936B7471
              3AB4B29A645F1A868154C7C7B9EFECEEEFEDECEFF0EEEFEEF0EFEDECD9DAD683
              8151817747AEAC8EC4C2B0B3AF936B682B9C9973D8DADAD9DCE4E2E7F0EEEFED
              E6EBEEE4EAEF8A8459B3B29EDBDDDDE9E8EAEDF0EEEDEDED8C8659B0AF9ADEDD
              DFEBE9E9EFEFEFF0F1EF96916A7A733CBDBBA96B66297C77469898708C865765
              5E1FAFAB8FA2A07D5C540EBDBEAE767238A3A17E9394726B6726A8A88AE0DFDB
              EBEDEEE2DFDA776F3A5B540F8B8960BEBFAB777039665D19756E35B7B59DBBB9
              A17A733AA3A081DBDADCDFE1E1EDEBEBEBF0EEEFEFEFF2EFF1B3B0947874396F
              672C9A94716C6728534A00908962A09775685F1C908C635A530EAAA58CDEDCDC
              F0EDEFEBF1ECEFEFEFEFEFEFE7E6E8938D64868154DBDDDD8884547D7847635D
              1CAEAA8EC4C4AC837C4A958F64D3D5CFDBE0DEE6E5E9ECEEEEE3E4E096946B78
              7138B4B19C675D1D868051C8C6BBEBEDEDEFEFEFEEEDEFC1BCA378723DB0B39A
              6B66296D682BB5AE9DECECECEFEEF0F0F3F8A9AA8A685E1EBABAAC746F38706F
              33B3B39BE4E5EFE5ECEFF1EEF0EFEFEFEDEDEDE7ECEB8E8D61534B005C530F89
              8555898457807B4AC3C4BBD9DFE4E5E3E9F1ECEDEFEFEFEFEFEFEDEFEFC0B9A5
              857B4BA39F839E9C7D5C560B959370DCDED8ECEBEFE5E7EFC1C3B071692DA5A1
              7E9F9D7E5A540D9A916F98987470682C858557C1BDAA655B1FACAC94DBDDDEE8
              EAEBEFEFEFEFEFEFEFEFEFEFF0EEEFEBF0EFEFEFEAEDED000000EAEDEEEBEEEF
              EFEFEFEFF0EE979162A7A586696727CFD0C7E9EBEBEFEEF0EFF0EEE1E5DF736A
              2B6E662BCECFCDDDDCE0E9EBEBEFEEF0F2F0EFF0EEED939168BEBDA86E692CDC
              DEDFE8E7E9EFF0ECEFEFEFEDEFEFEEEEEED7D6CC655D1A757039DCE1E0F0EEEE
              F1EFEEF0EEEEE4E5E367601B6D672CCFD1CBDADEDFE8EAEBE8EBF0E3E7EC9491
              65848155D6DBD9E6E5E7EDEDEDECEBED8F8D65848154D8DADBE6E7E5EDEDEDEF
              F0EEF2EFF1A29A75BCBEA8665D1EDDDEDCE5E8E6F0F0F0E2E4DEA09A75959168
              5E530FCAC7C2D6D7D39B9971757039A7A38AE3E3E3EEECECEEECEB8984538781
              54736F34DDE2E1CECBBD685F1C7B7845E3E3E3EBEDEDF1EEF0E8E4E3675F1C9E
              9C7DD6DADBE8E7E9F2F0F0F0EEEEF1EFEFEDEFEFF1EFEF929264E4E0E65F5410
              8B8960DEE0E1E9EBEBC5C5B35E550CBEB8ABE7E3E8EFEAECF2EBF0F1EBF0EDEB
              F1ECE7E9928D66A5A587837E51DBDBDB7571376E6728D7D5D4EAECEDECF0F1ED
              EFEF847E497D7946D6DBDAE2E1E5EFEDECF0EEEDF1EFEE96906BBBBBA970662A
              DBDFE0E8E9E7F1EFEEF0E9F0F0F1EFEFF0EEC5C3B1BEBFAF554C02C3C6BDE3E6
              E4F0EEEDEEF0F1EEF3F6F0F1F5BCB9A4BDBEAE544C00CECCCCE3E6E4F1EEF0EC
              EEEEEEF1EFEFEFEFEDECF08A86566E662B7D7644DCD9D5ECEBEDF4F0EFE7E5DD
              7B743DCCD0CADAE1E4E9EBECF0F0F0EEEEEEEEF0F1F0F0F0EDEFEFA29B74776F
              3A91916DDDDDDDEBEEF2EDF3FAE7ECEFE7ECEFDEE0E09C9A77757039ADA997E3
              DFE5EDE8E9E7EBF0C5C2B37672388483578E8B5FD8DDDBE8E9E7EEEDEFF1EEF0
              EFF0EEEFEFEFEFEFEFEFEFEFE9EDED000000EAEDEDEAEDEDEFEFEFEFEBF0756F
              3A5D5410C0C0B4E5EAE9EDEFEFEFEFEFEFEEF0EFEFEFC8C4B166601F8E8A61D6
              DBDAE7E6E8EFEDEDEDEFF0F0F0F0A29977BEBCAA756F3ADBE0DFE9E5EAEDEFEF
              F2F0F0F1EFEFEAECED8A86565B550CC9C7BFE6E8E8EFEEF0F1EFEFEDEFEFF0F0
              F6B4B293827B4A8F8B62D7DCDBDDE1E6E5E9EEBBB79F9795725A530ED5DBE2E0
              E2E2ECECECBCB89FA09D7E5C550CD8D4D9E1E3E3ECEDEBF3EEF0EDEFEF9F9A73
              BDBDAB766F38DFDFDFE3E8E7EFEEF0EBEDEEEBEAECCDCDBD70682CADA990E3E1
              E79F9976757039B5B6A2E0E4E9EAEAEABEB9B08A8C625A530EB7B6A1EAE3EAC7
              C3B15B550ED8D9D7EAEAEAECEEEFEDF1ECF0EEED9490676B6627D6DBDAE5E5E5
              ECF0EBEFEFEFEFEFEFF0F0F0F0EEEDA29977E2E1E3534B00B4B6A2DFE1E2EDEB
              EBEDEFEF827E4BDFE5E4EBE5EAEDF0EEEDECF0EEEBEDEDE6EDADAB8D9E9A7D6D
              6529776D37DBDEDC564A02BABAA8E5E8E6EEEDEFEEEFEDEEEEEEB9B89E716829
              BFBFB3E1DEE0E9EBEBEDF0EEEEEDEF9F9A73BEBBAC747035DCDEDFE7E6E8EFEF
              EFEFEBF0EFEFEFEFEFEFC5C3B1BDBEAE514B00D8DADBE3E5E6EDF0EEEFEEF0F0
              EEEEEDEFF0C6C5B1B9BFAE584B00D7D6DAE3E5E5F1EEF0E6EBEEF1EFEFEDEFF0
              C5C4AF938D645C540ED2D1CDE5E7E8EFEEF0EEEFEDEFEFEFE6E6E0949067DDE0
              E8E8EAEAECEEEEF3F0ECF1EEF0EFEFEFEDEFEFA2977775713693906ADCE0E5EB
              EEF3EFF2FAE8EBEFE8EBEFE9EEEF9C9A72726F38B4B4A4E2E2E2EEECECEEEBED
              E8EDECE1E5E68B865970692AE1DFE5E7E9E9EEEEEEEEF0F0EFF0EEEFEEF0EFF0
              EEEFEFEFE8ECEC000000E9ECECE9ECECEFF0EEEFEBF0544D0098926FE3E5E6EC
              EEEEF1EFEFF2F0F0EFF0EEEFEBF1EDEDED9C9A725B550ED7D9DAE0E4E5EEEEEE
              EDF0EEF0EDEFA09B74C0BCA9737039DCDEDEE9E9E9EFEFEFEFEFEFF2F0EFB0AF
              93A09E80706728D9DCE0E8E7E9EFF0ECEDEFEFEFEFEFF1EDF2EFF0EC9F997466
              5D1EC5C9BEDFDEE0E1E5EA949067918A5F6E6728AEAE9CE1E3E4EAEAEA938F66
              8C8A616D6627AAAC98DBDFE4EAE9EBEDEFEFEFEEF09B9A74BDBEAA767238DEDD
              DFE7E9EAEFF0ECD0CFC5C8C8BAE5E7E7E2DEDD8C855AE9E8EC9D9A74787138B4
              B6AAE4E7ECEAEFF2878555827C4F736D38D7E0E3E3E7ECB9B7A59E9C73E9E9E9
              EBEDEEEFEDEDEAEBE9E7E9E9928C67777037C6C7BDE1E4E8EDEFF0F1EFEFEDEF
              F0F1EFEFEDEFF09D9A74E6E6E6534A01B5B7A4DEE1DFEDEDEDEFEFEF9D9976E3
              E5E5EDE6EDEFEFEFEEEEEEEAE6EBAFA88DA7A38A7C774670652B8E8C63DFE3E4
              77723BE8E8E8EAECECF0EEEEEAECECE8E8E8B4B39E7D79469E9C7ADDE1E2E9EB
              EBEDF0EEF1EFEF9F9974BBBDA9777039D9DEDFEDE8E9EFF0EEEFEFEFEDF0EEEF
              EFEFC6C2B0BDBEAE564C00D5DAD9E5E5E5EFF0EEEFF2F7EDEFEFF1EEF0C5C4AF
              C1BEB0554B00D0D9DDDDE1E6EFF0EEF1EEF0EDEFF0EFEFEFA09A77A2A07E756E
              37D9DEDDE6E8E8EFEFEFF1EFEFEDEFEFEFEFEF989166E3E5E6ECE9EBEFEEF0EF
              EFEFEEEEEEEDEFF0EEEEEE9F9A73756F3A93916EDBE3E3EBEEF3EFF4F5EFF0EE
              E7EBF0E7EFEEA19B76746E39B5B3A1E1E0E2E8EDECF0EDEFAEAD91D9E1E1E2E6
              EB8C865BD7D4CCEFE9EEEFF0EEEFEEF0EFEFEFF2EFF1EFEFEFEFEFEFE7EBEB00
              0000EAEDEDEAEDEDEFEFEFEEEAEF5F5311DDDCD8ECE9EBECEEEEEEEFEDF1EEF0
              EEEFEDEDEBEBDEDED8979572766F38BFBFB3E2E4E4E9EEECEFEFEFF1EEF09D9B
              72BFBDAB777039DAE0DFE4E9E8F1EFEFEFEFEFF1EFEE95916897976F7F7846DD
              E1E2E5E8ECF1EFEEEFF0ECEFEEF0EFEFEFEFEEF0959266908C6393916EDCDEDE
              E5E1E6928F63665E1BBFBFB18D8F61E5E4E6E7E7E7909165635D1CC0BFB18C8D
              61DBE2E5EBE8EAF0EFEBF0F0F09D9B73BDBDAD787035DADFDEE2E4E4E7E9E9B3
              B39BB9B6A7DFE4E2EBECEAEFEBF1EEECEC9D9A74757039B7B7A9DDE4E7D7D6CC
              7C78475B520EBEBCB4DBE2E5E2EAEAC2C2B2D2D6D1ECEDEBECE9EBE5E8E6E6E4
              E3A09E7F979573665C1CC5CAC1E8E4EAEDF0EEF1EFEFEFEFEFF0F1F5EEEDF1A0
              9A75E3E5E6544B01B5B5A3DDE2E1EDEBEBEFF3F89F9974E5E4E6EBEBEBEEEFEB
              ECECECAEAC8E8F8C60858151635D1CD8DAD49E9972D1D2C8C1C2AEECEBEFEAE7
              E9ECE7E8E3E5E5BDBCA87571368F89609E9C7AE5E4E6EBEDEDF1EFEEF0F0F09D
              9A74BFBDAB757039D9DDDEE8E8E8EFF0EEEDF0EEECEEF8F1EFEFBEC1B2BCBDAD
              544B01D8DCD7E3E5E6ECEEEEF1F3FBF1EFEEEFEBF0C6C1B2BEBEAE574C02CDD6
              D9DDE1E6E7ECEFE7EBF0F1EEF0EFEDED9B9A74959370766F38DADCDCE3E8E6ED
              EFF0EFF0EEEFEFEFEFEEF0A19A73E6E5E9EAEAEAF1EFEFEFEEF0EFF0EEEFEFEF
              EDF0EE9A9875746E3992916BDBE2E5EBEEF2EFEEF8EDF0F5EFF0ECE5EEF29999
              75726F38B1B1A3DBDDDEE6E8E9E7E7E7908D61DCDBDDDDE6EAF1ECEEF0EEEEEF
              EFEFEFF0EEF1EFEFEFF0EEEDEFF0EFEEF0F1EFEFE6EAEB000000EBEFEFEAEDEE
              EBF1ECF1EFEF9F9C76EAEDEBF0EEEDEDEEF2EDEDEDE8EAEAE6E8E9E2E4E48B84
              53B9B9A7635D1AB6B6A4E8E5E7F0EEEDEFEEF0F1EFEFA09A75BBBCAC767238DE
              DDDFE8E7E9EFEEF0EEF0F0F1EEF0A09A759A977194926FDBE1E0E8EBE9EFEFEF
              EDEFF0F1EFEFEFEFEFEFEFEFA3997798956F7C7746DDDFE0B4B39E9A97715B55
              0EDCDEDF9D9A74E8E8E8B5B39B979573635D1ADDDFE9958D65E3E6EAE4E6E6EA
              ECEDEFEFEF9E9A77BEBCAA787138D6DBDADCE2E1D1CFC770662AB3B5A1E2E1E3
              ECEDEBECEEEFF2EAF1A29977746F38B5B5A3D9DADE76703B6C672AA6A48CCCD5
              D9DADBDFE7E6E8ECE9EBE5E9EEE8E7E9CFD0C7908C638E8A61BBB7A48C8A626A
              672AE1E6E5EDE9E8EFEFEFEFEEF0EEEDEFEFEEF0EFEFEF9E9B75E3E5E6544B01
              B4B6A3DFE1E1ECEBEFEFF2F79E9A77E3E6E4E7E9EAEAEBEFCAC8BD908D60847F
              525E540EC9C6B7E9EBEB9D9877E1E6E5EAEAEAEDEBEBDAD8D7A9A78F7D78479F
              9D7BB7B4A5544B01D0CDC8E9EBECEFEFEFEFF0EEEFEFEFA09A75C0BCA9777039
              DDE0DEE8E7E9EDECEEF2F0F0F0EDEFF1EFEFC6C2AFC3C2AE554A00D6DBDAE0E6
              E5F0EFF1ECEFF4EFF0EEEEEFF3C7C0AFC2BFB0534A00D0D7DAD9E6E4EEEAEFF2
              F0F0F1EFEEEFEEF09F9976999572736F35DBDDDEE7E6EAF1EEF0EFEFEFEFEEF0
              F1EFEFA09B74E0E5E6EBEBEBEFEFEFF0EEEEEFF0EEEFEEF0F1EAEF9C9776766F
              3692916BDAE3E6EBEEF3EDEFEFEFEEF0F0F3F7F1EFEFA09A75756F34B1B2A2DB
              DADEDEE3E2A19E7F747036DADCDDE8E7EBEEF1EFEFEFEFEDEFF0EFEEF0EEEDF1
              EEEEEEEEEEEEEDF0EEEFEFEFECF1F0000000EBEFEFEBEFEFEFEEF0F1EFEFEEEF
              EBEEF1EFEAECECE7EAEEE5E6E4DFE3E4ACA98D6D682BADB297AEAD98544B01DC
              DBDDE7E9E9F0EDEFEFF0EEE6EBEC9E9B75BCBCAA78713AE0DDDFE6E8E8F0F0F0
              EFEFEFECEFED9E9A7798966E9A916FDDDCE0E7EAE8EFEFEFEFEEF2ECEFEDEFEE
              F2EDEFEFA09B7499976F7D7944DDDFDF908E659E9C7D888051E3E3E3CFCEC0BB
              BAA58F8E628D89608F8964E1E3E3B6B8A2BBB79FE2E5E3EBEBEBEEEFEDA09A77
              BCBEAA655E199894719A977169601D675E1BBAB9A5E3E2E4EEEBEDEFEFEFF1EA
              F19E99727672388581507D784778733C7A723D74713A8E8962CFD0D4DBE1E6EA
              E7E9E5E8EC918C6595946EBEBEB2A8A589655D1A6F672BCBCABCEAE9EBF0EDEF
              EFECEEE8EBF0EFECEEF0F0F0F0EEED9F9C76E3E5E6564C00B8B6A4E2E0DFEDED
              EDECEFEDA09A77E7E4E6EAE4E9C9C7BC8D8C609D9D795B5310C6C5B7EBEBEBEE
              EAEF9F9976E3E5E6E8E8E8B0AE8F838151BDBBB0ADAC977F7A435B550CABAA90
              E1E4E8EDEDEDECEFEDF1EDF2EFF0EE9D9976BCBDA9797136D9DFDEEAE6EBEFEE
              F0EFEFEFEDEEECEFEFEFC5C4B0C2BFB0544B01D5D9DAE6E5E7EEEFEDF0EEEEF1
              EFEEECEEEEC0C1B1C2BFB0524C00D8DBD9E5E5E5F1EFEFECEEEEF0EEEEF0EEED
              9F9974989471757039D7DCDBE8E8E8F1EFEFEEEEEEEDEFEFEFEFEF9D9976E2E6
              E7ECE9EBF0EDEFEDF0EEEEEEEEEFEEF0EFEFEF9B9976746E39918F6CDCDEDEEC
              E9EBEFEFEFE9EEEFEEEDEFEEEDEF9F9976757137857E5399937077723B78733C
              777039DADDDBE6E8E9EFF0EEF0EEEEEEEEEEEAECECE7E9E9E5E7E7E9E8EAECED
              EBEFE9EEEFF5F5000000EBEFEFEBEFEFEEEAEFF1EDF2EDEFEFEAEDEBE9E9E9D1
              D0C68A825A7F7944A9A588D3D2CEABAD975B530D928C61DBE1E6E9E9E9E8EAEB
              EDEDEDE7EBF09D9976C0BDAF766E39DFE0DEE6E8E8EFF0EEF0ECF1ECE9EB9390
              639B95727E7745D9DBDCE4E7E5EFEEF0EDF0EEF0F0F0F0EEEEEDF0EE9C977692
              895E95916EDDE2E1948E656C6827B0AC99E5E2E4EFEEF89D9C7A8C8C64665C1C
              BDBFB3E7E7E7E6EBEC979166E3E5E5E7E8ECF1EFEF9D9A74C1BDAA766F38DDDF
              DFE7E6E8DDDAD270692AC1C0ACE7E7E7E8EBE9EAEAEAEAECEC9E9A7774703BB6
              B6A8E4E3E7EAEDEBEFF2F783814B8883566C662BD7DEE1E4E8E3999975B4B7A7
              887F53564A027E7A47BCB5A1E9ECEAEAEAEAE7E9E9EAECEDEFECEEE7EAEEF1EB
              F0EAECEDF1EFEF9D9A74E4E6E7554B00B5B7A3E0DFE1EDE8EAEEF0F19F9974E1
              E3E3BDC3B87D7944A5A4885C530FC3C6B7EEE9EAEEEEEEE6EBEE9F9974E8E6E6
              C1C0AC9995729694725B550E70662AAFAB8EE5E2DEEAE6EBDDE4E7E6E2E7E8EA
              EAEFEDECEFEFEFA19877BCBDA9777037DEDDDFE9E8EAF1EFEFEFEDEDEEECECE8
              E8E8C4C3AFC1C3AD544C00D5DBDAE3E5E6E9E8EAE9E8ECECECECEFEFEFC0C1B1
              C3C1AF524C00D9D8DAE0E4E5EFEFEFEFEFEFE8ECEDE3E8E79C9973999670746F
              38D8DCDDE7E7E7F0EFF1EDEFEFEFEFEFEBF0EF9F9976E6E2E7E9E7E7EBEDEEE6
              E8E9EBEAECEEEFEDEEF1EF9C98757271358E8F6DD6DADFEAEAEAEFF0EEEEEEEE
              E1E6E9E7E9E99B9976736F3AB4B5A1E4E3E5ECE8EDA39B7677713CE3E6E4EAE8
              E8E9E9E9EEE9EBEEECECE2E4E4B7B7A5D7DBDCDADCDCE1DDE2E9EBECEBF2F100
              0000EBEFEFEBEFEFEDECEEF0EEEEEFEEF0E1E1DB8A8457888253C9CAC0CFD0CC
              A5A686756E35564B01928F69E7E8ECCDD2C9D1D6D5DBDFE0E5E7E7E7EAEF9F99
              74BCBEA874713ADCDDE1E7E6E8EFEEF0EAE9EBB3B49AAAA88A9A97716A662BD4
              D6D7E0E2E2EDEDEDF1EFEFEFEFEFF1EFEEEDEAEC9A9673665C1CBFC2B2B5B29D
              A19E7F5E540EDADCDCE7E5EBF0EEED969269969472655C1CD4DCDCE7E9E9EFEF
              EF979168E3E5E5E4E5E3E9EBECA09B74BFBEAA737039D8DCDDE6EAE5F1EFEEB9
              BBA5C3C3B1E8E8E8C7C5BAE2E4E4E8EDECA29A7578703BB7BAAADFE2EAEEECEB
              EFEEF0ABA385C6CABE544B02D9DDE2E4E6E69A9876766F387A7744CED2C6EBED
              EEEEEEEEEBEBEBBDBDADE1E3E4EBEBEBEFEEF0EDEFF0F1ECEEE7ECEFEFEBF0A0
              9A75E3E5E6564B01B5B5A3DEE2E3EDE8E9ECEEEE9D9B73D5D6D2858151A19C7B
              534A00A2A58BE9E9E9EEEEEEE7ECEDE5EAEDA09972DFE1E29A9973A39E7D6E67
              28BBBAA6E6EAEBEEEDEFEFEDEDC0BEACC3C7C2D0D2D2DDE2E1E4E6E6EEEEEE9E
              9C74BEBBAC746E39DCDBDFE8E9E5EAEFEEE8ECEDBBBBA9E0DFE1BFC1ADC3BFAC
              544B01D7D8DCDADAD4D2D3CADDE0DEE3E6E4EEE8EDC7C0AFC0C1AD554B00D6DA
              DBE3E5E5EDEFF0ECEDE9BDBDABD2D6D19D9871979370747036DADCDCE9E9E9EF
              EEF2EDF1ECF1EFEFEFEFEF9D9B73E1DEE0DEE3E6D4D2C8E1E1E1E1E1E1E7E8F2
              EEEDEF9B9A74766D3B908E6CD4DADFE2E6EBEFEFEFE4E6E6BBBBA9E0E2E2A098
              73747036B5B6A2DFE4E3ECE9EBEFECEE959468E9E9E9D0D1C7DBE0DFE9E5EACC
              CCBE6E662B92906D736F35A49F86D7DADFE8E8E8EAF1F1000000EAEDEEECEDEF
              EFEEF0F0F0F0EEEEEE817A48C2C2B6B6B6A47A7643544B015B530D8C855AD5D6
              CCF0F2F3EBECF09D9A74848154D6D5D7D8DDDBE1E6E59E9875BCBAA8757039DA
              DCDDE1E3E3E6E6E6B9BBA7726F38DBDADC8A86565B550EC7C8BFD9DEDCE8E6E5
              ECECECEAECECE8EAEBB7B69C7E784B7E7746DEE5E2948E639E9C7A838151D8DD
              DCE8E7E9E5EAE88A84598D8A648A885FDADCDCE8E7E9ECEEEEBDB7A0B1B09BD8
              DDDCE2E4E49D9871BABAA8766F36DCDBDFE2E5E3E7EAEEE9EBECE7E7E7BDBCA8
              98926FDEE0E1E3EAE79D9675757137B3B6A7DFE2EAE6E8E9EBEAECA2A17FC2C3
              B9514D00DEE0E0E7ECEBA39B76534C00D5D9DADFE3DEEBEBEBE9EBECB3B39B97
              956DDEE0E1EDEBEAEFEFEFEFEFEFF1EFEFE7ECEFF1EDF29F9974E4E6E6544B01
              B5B8A2DFE1E1E3E7ECEDEDED938D6A838053B2B2A6534B00AAA88AECEAEAEFED
              EDF1EFEFE4E9EAE6E5E9908B64D7DBDC9A9471737137ADAC98DADDE1E8E7E9EB
              ECEADADCD6766F389A977B828050D6DBDEDBDDDEE0E5E3A09873BCBBA7736E37
              DBD8DAE2E4E4E3E8E7C5C5B76E662AD7D6D8BEBCAABFBDAB524A00D6D8D8BCBC
              AC6E652CCECFCDD5DAD9E0DFE3BFC0ACBDBDAB584B01D4D8D9DCE1E4E8E8E8D8
              D9D7655C1DD3D8D797956D96966E736E37D6D9DDE3E8E7EEEEEEF1EFEEECEEEF
              ECEAE99C9973C7C9C3D4DADF736F3AA8A589D3D8D7DAE0DFE7E6E8969770726F
              388E906CD0D9DCDCE3E6DBE2E587825595926CDBDBE19B9570746F38B4B3A5DB
              E1E0E2E7EAE5E5EBE8E7E9D7DBD66D6627D6D8D9E5E1E779723B7E78438E885D
              6D65296D6529DBDADEE9E9E9EAF1F1000000EAEDEEECEDEFEFEFEFEDEFEFD2CF
              C1A199749F9C7D554B00746E39B8B69EECEDEBEDECEEF1EFEFEDF2F5E6E9E79B
              9774635D1A838053D6D5D9D9DEDD98956FB8B8A8757033DBDADCDCDEDFB0B399
              777039756E35DDDFE0CCCCBC66601F827B4ADDDFDFDFE1E2E4E3E5E7E6E8D8DC
              D76C6728787138DDDDD7DDDCD87D7A4777703994926FD7DCDFE2E2E2C5C8B975
              71377373379E9C7AD8DDE0E6E3E5E8E7EBACAB91665D1AD5D2CED8E0DF98956F
              A9A68A6E662AD7DCDBDEE0E0E5E4E8E2E4E5B3B09B6E662B94926FDCE1DFE6E6
              E6898354766F38ADB198D8E1E5E2E1E3E2E4E58583537C7845928D66E7E9E9E9
              EEECA29C775E5512D3D6D4E0DFE1E1E5E6DCDCD6665C1C97946EDFE2E6ECECEC
              EFF0EEEFEFEFEFEFEFEDEFF0EDECEE9F9974E3E5E6544B01B4B6A3DDE2E1E4E8
              EDDEDCDB787138BAB8A65A540DAAA88AE9E8EAE9EEECF2F0F0EEEEEEE8E9EDAC
              AC8E665D1AC7C8BFC1C1B35C540EB2AF9ADBE0DEE3E3E3E5E4E67D7847777039
              B2B5A66C682D878353D7D9D9DCDFDD949575B0B098747036D9DADEDCDEDFBDBC
              A8675D1D736D38DDE0DEB1B298B3B09B514C01D2D1CDC3C2B46E682D6D6529CB
              CCCAD7DADEBBB9A7BABBA7554B00D8DCD7DCDEE6C4C3B5807947514B00D4D7DB
              8F8B6293926C777037D9DBDBDFE2E6ECEDE9F2EDEEECEDEBDDDBDA6C672A8F8C
              60D9D8DC8D8861665D1DA9A48BD7D9DADCDEDE8F8D65756E3793926CD9DDDED7
              DBE0868252696629B0B3A4D4DADF8A8253726E34B7B8A4DFDEE0D7E0E3DDE1E6
              CFCEC4767238544B01D9DBDCE4E2E88B87579793706B66299B997A938F6CDBDB
              DBE9E9E9EAEFEF000000EBEEEEEDEFEFEFEFEFF0F0F0C6C5B1B7B79F514B009C
              9A78E3E2E6ECEEEFF1EFEFEFECEEF0EEEED5D7D1A8A98FB4B19C9E98735C530F
              736F3A999872665F1AB6B49C5F5410928E658585577C71389A977179723BE6E6
              E6EAECECE7E4E08D8959787439B8B5A0C0C1ADAFAD8F79723B9E9978EDEBEBCF
              CFBF71692DA7A281A59F825D560DB7B69CBAB69E675E1EA4A083A6A0835D550F
              C1BDABE9E9E9AAA683797239A5A07F6E692CAEAA91675F1CADA99070682D908F
              63C0BFABA7A2816D682B9190648883569C9973D6D4CC807B4A8B875787865470
              672EAEAA8DB8B69E79723959550E9E9972ECE9EBEEEDF7EFF0EEEFEFEF959069
              7A733CB8B9A5B9B5A276723778713ABFBEAAEAE9EBEEEEEEF1EFEFEDEFF0EDEF
              EFF2F0EFEFF0EE9D9A74E3E5E6544B01B4B6A2E1E0E2BDB7A47874399B99775C
              540E908E66E9E8EAECEEEFF1EFEFEFF0EEDBDBCFA09A756D672C928E6570682C
              B5B59DAFAA9167601BB3AC91BFC1AD817A4979723B898554C0BDAEA4A0835D55
              0F6D672C9A9870695E20ADAA8E5D550F908F638883567B713BA3A17E76733CB6
              B49C7B713BAEA99072672B7F7B46C7CABB8B86556F672C5C540E9D95706F672B
              ACA98D6E672E817A48938D646E692CACAA8B564B019995726D672CA4A182665D
              1DADAB8DDEDDD9E8EDECE4E0DFB1AD9470672EB7B69C5D550F928D66817A48A3
              A081544B01878255928E658A845599977472692AA3A17F675E1E99977472682C
              A4A2807F7A498682599C96736F672BB6B49CB4B39F8784576E692CB5B39B544B
              01E6E7E5ECECEC78743A7E7C4677703996936D6E662BE1E3E3E9EBECEAEDEE00
              0000EBEDEDEDEFEFF0F1EFEFF0EEC6C6B49E9875665E1BD6D8D8E3E5E6ECEEEF
              EFF0EEEDEDEDE9EBEC78713AA5A58DD4D9D0C6C5B1C8C1B2C6C5B1C6C4B2C5C3
              B1C6C4B2C5C4B0C5C4B0C5C4B0C6C5B1C6C5B0CFCDC2F0EEEDECEEEFEDEFF0EF
              EFEFE8E6DEC4C4B2C6C5B1C4C4B2EEECEBECEFEDEFEFEFDBD9D1C7C6B2C8C4B1
              C5C4B0C6C4B2D0D0BECFCFBFC9C5B3C5C3B1C6C4B2C7C3B0DBD8D0F0EEEDC6C5
              B1C5C3B1C6C3B4C9C2B1C6C5B0C4C4B2C6C5B1C6C5B1C6C5B1C6C5B1C6C5B1C6
              C5B1C6C5B1C6C5B1DADACEDCDBD1C6C3B4CCC5B2C3C4B0C6C3B4C5C4B0C4C5B1
              CECEC2EEEEEEEEEDEFEDF0EEF0F0F0EDEFEFF0F1EFF1EBF0E8E5E0C5C5B5C6C5
              B1C5C3B1C4C4B4E5E3DBF0EDEFEFEFEFEFF0EEF1ECEEECF1F0F1EFEFEEEDF19F
              9A73E1E3E3544C00B5B5A3D7DFDED2CEBCC8C4B2C4C8B5C5C2B3ECEAEAEFEFEF
              EDEFEFEFEFEFF1EFEEDBD9D1C5C5B5C6C5B1C8C4B1C8C4B2CFCEC0F0EEEEECEE
              EEC5C6B2C8C4B2C5C4B0C4C6B0DBD9CFE6E5DBC5C2B4CAC3B2C6C2B0C5C3B1C6
              C5B1C7C3B0C8C4B2C6C4B2C4C2B0C5C3B1C6C4B2D2D0BEC6C4B2C6C2B0C8C1B2
              C5C3B1C6C4B2DBDBCBC4C4B4C6C2B0C8C1B2C6C2B0C7C0B1C7C0B1C6C2B0C7C3
              B1C5C4B0C5C3B1C7C3B1C6C1B2C6C1B2C6C2B0C6C2B0C8C4B2C5C3B1E2E5DCED
              EDEDE7E1E2C5C2B3C6C2B0C6C2B0C8C4B2C7C3B1C6C5B1C5C4B0C5C4B0C6C5B1
              C8C4B2C6C1B2C6C5B1C5C4B0C6C4B2C6C4B2C3C4B0C7C7B7C5C4B0BFC0ACC0BD
              AEC1C1AFC5C4B0CAC3B2C5C3B1C4C5B1C6C1B2C5C4B0C6C4B2ECECECEFEFEFD2
              CFC16E692C9F997470682CB0AB92EAE7E9EEEDEFEAECED000000EBEDEDECEFEF
              ECEEEFEEF0F1E7E4DF817D4C6F672BD7DBDCDCE1E0E3E8E6E7E9E9E3E7E8B6B2
              99524A04B2B4A8E3E2E4EEEEEEEFEEF0EFF0EEEFEFEFEEF0F1EDEFEFEDEFEFEF
              F0EEEFEFEFEFEFEFF1EFEEF1EFEFEFEFEFEFEFEFEFEFEFEFEEF0EFEEF0EFEFEF
              F1EFEFEFEFEFEFEEF0EFEEF0EFEFEFEFEFEFF0EDF6F0F0F0EFEFEFEFEFEFEFEF
              EFEFEFEFF3EEEFF0F0F0EFEFEFEFF0EEF0EFF1EDEFF0EEF1EFF0F0F0EEEFEDEF
              EFEFF2F0F0ECEFEDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
              EDEEF2EFEBF0EFECEEEFF0EEEFEFEFF1EEF0EFEEF0EFEFEFF1F1EBEFEFEFEFEF
              EFEFEFEFEBEAEEEFEFEFEEEFEDEFEEF0EFEFEFEFF0EEF1EFEEF2F0F0F0EEEEEF
              EFEFEFEEF0EDF0EEEDEFF0EEEDEFF0EBEDE6EAEFEDEBEA918C65D9DDDE574A00
              B3B3A1D7DBDCDEE1E9EBEDEEF1EEF7EFEFEFEFEEF2F1EFEFEFEFEFEEEEEEEFEF
              EFEFEFEFEFF0EEF0F0F0EDEDEDEFEEF0EFF0EEEEEDEFEEF0F1EFF0ECF1EEF0F0
              F0F0EEEEEEF0F3F8EFEEF0EEEEEEF2F0F0EEECECF2F0F0EEEEEEEEF0F0EEEEEE
              EEEEEEF0F0F0EEEEEEEFEFEFEDEFEFEFEFEFF1EEF0EEEAEFF0EDEFF0F0F0ECEE
              EFEFEFEFEFECEEF1EBF0EEEBEDEFECEEF1EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
              EFEFF0F0F0F1EFEFECEBEDF2EEF3EFEBF0EFECEEECEEEFECF1EFEFEEF0EFF0EE
              EFEEF0EFEFEFEFEEF0EEEDF1EFEFEFEFEFEFEFEEF0EFEFEFF1EFEFECEBEDEEEE
              EEEFF0EEF0F0F0EFEFEFEDEFEFF2F4F5EFEFEFE8ECEDE9EBECEEEAEFEEF0F1EE
              EEEEF0F3F7F1EFEFEEEFEDF0EFF1EDF1ECEEF0F1F2EDEEEEF0F1F1EEF0D1CFC7
              EEEEEEEDEAECEFEBF1EEEBEDEAEDEE000000EBEDEDEBEDEDF1EFEFF1EFEEECEE
              EEBEBCA45C540EA3A17FDEE1DFDFE1E2E2E4E5BDBBA97C7A44574A00C0C4B9E8
              E9E7F0EEEEEFEFEFEFF0EEEDEFEFEFF4F3F0F3F7EDEFEFF0EFF1EFF0EEEFEFEF
              ECEEEFEEF0F0EFEFEFF1EFEFEEEEEEEFEFEFEDEFEFEDEFEFF1EFEFEFF0EEF0EF
              F1EEEAF0F0EDEFEEF0F0F0EFF9ECEEEFF1EFEFEEF0F0EEEEEEECEEEEEFEFEFED
              EFEFEFEFEFEDEFEFF1EFEFEDF1ECF1EEF0EFF4F7F2F0F0ECEEEEEEEDF1EFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBF0E6EBECE7EC
              EFEDEFEFEEEEEEEBF0EEEDEFF0F1EFEEEFEFEFEFEFEFEEEFEDEFEFEFEAEAF0EF
              EEF0EFF0EEEFEFEFEFF0EEEFEFEFEFEFEFEEEDEFF0EFF1EFEEF0EFEFEFEFEFEF
              F1EFEEF2F0EFE8EBF0E5E4EECBCBBB645E1DCBCBCB5B550E7F7846D9DEDDE1E3
              E3EDEBEBEEEEEEF0EEEDEDF0EEF0EFF1EFEEF0F0F0F0EFEFEFEFEFEFEFEEF0EC
              EBEDECEBEFEDECF0EFEEF0F4F0EFF1EFEEEFEFEFEFEEF0F0F0F0F1EEF0EDEFEF
              EFEFEFEEF0F0ECEEEEEFECEEF1EEF0EEEEEEEEEFEDEFF0EEEFEFEFEFEFEFEFEF
              EFF0F0F0ECEEEEEFEFEFEFEFEFEFECEEEFECEEEEEEEEF0F0F0EEEEEEF1EEF0EE
              EAEFEEEBEDEDECF0ECEEEEEDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF0EE
              EFEFEFF1ECEEF0EBEDF1ECEEF1EBF0F0EEEEEFEBF0EFEBF1EFEFEFF2EFF1F0EE
              EEEFECEEEFECEEF1EFEFEFEEF0EFF0EEEEEBEDEFECEEF1EFEFF1EFEFF1EFEFF1
              EFEFEEEEEEEFEEF0EBF0EFEFEFEFF1ECEEEDEFF0EEEEEEF0EFF1EFEEF0EFEFEF
              EDEFEFEEEEEEEEF0F0EEEFEBF1EFEFEDEFEFEFEFEFEFF0EEEDEFEFF1EBF0F0E9
              F0EDF0EEEBEDEF000000EBEEEEEAEDEDF4EFF1EDEFEFEFEFEFEFEFEFDDDAD28F
              885778723D9D9B73837C4A5F54108A8656524C00E9EEF1EDEEECEFEEF0F1EFEE
              F1EFEFEDEFF0F0F3F8F0F3F7EFEFF5EEEEEEEFEEF0EFEFEFF0EFF1EEEEEEEFEF
              EFEFEFEFEFEFEFEEEFEDEFF0EEEFEFEFF1EFEFF0F0F0EEEEEEF1EBF0F1EBF0EE
              EEEEF2F4F4EFEFEFEFECEEECEEEFF1EEF0EFEFEFF0EDEFEDEFEFF1EEF0EDEFF0
              EDEFEFEAEFEEEFEEF0EDF4F7F1EFEFF0F0F0EDEFEFF1EFEEEEEDEFEFEEF0EFEE
              F0EFEEF0EFEEF0EFEEF0EFEEF0EFEEF0EEEAEFF2EBF0EEEAF0E5ECEFEFEFEFF1
              EFEEF0EFF1ECEEEEEFEEF0F2F0F0EDF0EEECEEEEE8EBEFF0EFF1F0F0F0EFEFEF
              F1EFEFEEEDEFF0F0F0EEEFEDEFEFEFEFEFEFF1EFEFF0EEEEF0EFF1EFF0EEF1EB
              F0B0AF93847E498D865B9E9B758B875778733C969067D6D7CDEBEEECF0ECF1ED
              EFEFECEFEDEDEFEFEFF0EEEEEEEEEFEEF0EFEFEFF1EFEFF1EFEFF1ECEEF0E9F0
              EFEFEFEFEEF0EEF0F0EFEEF0EFEFEFEDEFEFEFEEF2EFEFEFF0F0F0ECEEEEF0F0
              F0F1EEF0EFEBF0F1EEF0EFECEEEEEAEFEFEFEFEFEFEFEFEFEFEEEEEEF1F1F1EF
              EFEFF1EEF0EEEAEFEFECEEEFEFEFEFEEF0F2F0F0EFEFEFF0EFF1EDECEEE9E9EF
              E8EBEFEDEFF0EDEFF0EFEEF0F0EFF1EFEEF0EEEDEFEFEFEFEDEFEFEFECEEEFEF
              EFEEEFEDF0EBEDF1EFEEEDEFEFEFF0EEEDF0EEEFEFF5EFEFEFECEBEDECEAF0EF
              EFEFEDEFEFEDEFEFECEBEDEFEEF0EFEEF0EFEFEFEFEEF0F0F0F0F0F0F0EEEEEE
              F1EFEFECEEEEF1EEF0F1ECEDEDEFEFEEEBEDEFEFEFF2F0F0EFEEF0F0EFF1EFEE
              F0EDEFF0ECF0F1EEEEEEF2F1EDEFEEF0ECEEEEEFF0EEEFECEEF1EFEFEBEDEF00
              0000EBEEEEEAEDEDEFF0EEF2F0F0EFEFEFF0F0F0EDEFEFECEEEFEEF0F1EFF0EE
              EDEFEFEDF0EEEEF0F0F1EFEEEEEDEFEDEFF0F0EFF1EDF1ECF1EFEFEDEFF0ECF0
              F1EFF2F6EDEFEFEFEEF0EFEFEFEFEFEFF0EEEEF1EEF0EFEFEFEFEFEFEFEFEFF0
              F0F0F0EDEFF0EEEEEDEFEFEFEEF7EEF0F0F0EEEEF1ECEEEDEFF0EDEFF0EFEFEF
              F2EBEEEFEFEFEFEEF0EEEFEDEEEEEEEEF1EFF1EFEFF1EFEFE7EFEEE7EBF0EAF0
              EFEEF3F6EFEFEFEFF0EEEDF0EEEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEFEFEFEDEFF0E8EBEFF2EEEDF1EFEFEFEFEFEFEFEF
              EFF0EEF0EEEEEDEFEFEDEFEFE9EDEEEFEEF0EEEEEEEFEFEFEFEEF0F0F0F0EFEF
              EFEFEFEFF0F0F0EFEEF0EFEFEFEDF0EEEFEFEFEDEFEFEFEEF2F1EAF1EEF0F0EE
              EDEFF0F0F0F1EFEFEFF0EEF0EEEDF1EFEEEFEFEFEEF1EFF0EDEFF1EEF0F0EDEF
              EFF0EEEFEFEFEFEFEFEEEEEEEFEFEFEFEFEFEEEDEFF0ECF1EFECEEEEEAF0ECEE
              EEF0F0F0F0EEEDF1F0ECF1EFEFEEEEEEEDEFEFEFEFEFF0EEEEF0F0F0EFEEF0EF
              EEF0EDECEEECEBEFEFEFEFEFEFEFEFEFEFEFEFEFEEEFEDEFF0EEF0F0F0EEEBED
              EFECEEEDEFEFEFEEF0EFF0EEEEF1EFEDEFEFEFEFEFE9EDEEE8EBF0EAEBEFECEE
              EEEFEFEFEEEEEEEFEFEFEFEFEFECEEEEF0EEEEF0EDEFEEEEEEEFEFEFEFEBF0F1
              EFEEEEEEEEEFEEF0EFEFEFF1EEF7EFEFEFEDECEEEDEBF1EFEFEFEFEFEFEFEFEF
              F1EFEFF1EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF1EFEFEEEEEEF0ECF1EFEF
              EFEFEEF0EEEBEDF1ECEDEDEFF0F1EFEFF2F0F0EEEEEEEFEFEFEFEEF0EEEFEDEF
              F0EEEAEFEEEFEEF0F1EFEFEFEFEFEDECEEEFEEF0EBEEEF000000EBEEEEEAEDED
              EAF0EFEFEEF0EFEFEFEDEFF0F0F0F0F2F0F0EFEFEFEFEFEFEFF0EEEBEFF0ECEE
              EEF1EEF0EDEFEFF3EFEEEFEFEFF1EEF0F1EFEFEFEFEFEDEFF0EDEFEFF0EFF1F0
              EEEDF2F0F0EFEFEFEFF0EEEFEFEFEFEFEFF0F0F0EEEDEFEFEEF0EFEFEFEFF0EE
              EFEFEFEDEFF0EDEFEFEFF0EEEFEFEFEEEDEFF0F1EFF0EDEFEEEBEDEFEFEFECEE
              EFF0F1EFEFEEF0EFF0EEEFEFEFEFEFEFE9EEEFE5EBF0EDF0EEEFF3F8F0EEEEF0
              F0F0EEEDEFEFEEF0EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
              F3EEEFEFEFEFEFEFEFEFEBF0F1EFEEEDEFEFECEFEDEDEFEFEFF0EEF0F0F0EEEE
              EEEFF0EEEFEFEFEEEDEFEFEEF0ECEEEEEFEFEFEFF0EEEFF0EEEFEFEFEEEEEEEF
              EEF0EDEFF0EDF0EEEFEFEFF0F1EFEFF0ECEFEBF1F3EEF0F2F0EFEEEEEEF0EFF1
              EEEDEFEEF0F0EEF0F1EEEEEEEFF0EEEDEFEFEEEEEEF1EFEFEEEDEFEFEFEFEFF0
              EEEFF0EEF0F0F0F0F0F0EFF0EEEFF0EEEEEBEDF1EBF0EFF0EEEDEFEFEEF0F1EE
              EDEFEEEEEEE8EBEFE7EAEEEFEEF0EFECEEEFEFEFEFEFEFF1EFEEF1EFEFEEEBED
              EFEFEFEFEFEFF0EEEEF2F0F0EFEFEFEFEFEFF1EFEFEEEBEDEFEBF0F1EFEFF2F0
              F0F1EFEEEFF0EEF0EFF1EFF0EEEFEFEFEAEAF0EDECF0EFEFEFF1EFEEF1EFEEF1
              EFEEEFEFEFEFEFEFEFECEEF1EFEFEFEFEFEDEFF0EFEEF2EFF0ECF0F1EFEEEDEF
              EDEFEFEEF0F1EFEFEFEFEEF0EFEFEFF0F1EFEFEEF0EFF0EEEFEFEFEFEFEFEFEF
              EFEFEFEFEFEFEFEFEFEFEFEEF0F1EFEFEFECEEE7ECEFEFEEF0F0F0F0F1EEF0EE
              EDEFEFEFEFEDEFEFF1EFEEEDEFEFEEEAEFF1EFEFF1EFEFF0EFF1EEEFEDEEEAEF
              EEEDEFEFEFEFEFECEEF0EAEFEAECED000000ECEFEFEAECEDEFEFEFEFF0EEF1ED
              F2EFEFEFEFEFEFEFEFEFEEEFEDF1EEF0EFF0EEF0F0F0F1EFEFF4EFF0EFEFEFEF
              EFEFEEEAEFEFF0EEEFEFEFF0EFF1EFEFEFF0EFF1EEEFEDEFEFEFEFEFEFEFEFEF
              EFEEF0EFEFEFEFEFEFEFEFEFF0F0F0EFEFEFEFEFEFEDEFF0F2EFF1EFF0EEEEEF
              EDEFF0EEEFF0EEEFEEF2F1EFEEF1EBF0E7ECEFE8ECEDE7EAEEF1EFEFEFEEF2EE
              EEEEE6EEEEE7EFEEEDEFEFE8F0F0EFF0EEEAEFF0EFEFEFEEEDEFEFEEF0EFEFEF
              EEEDEFEEEDEFEFEEF0EFEEF0EFEEF0EFEEF0EFEEF0EFEEF0EFEEF0EFEEF0EFEF
              EFECEBEDF0EFF1EEEEEEF0F1EFF1EFEEEFEFEFEEEEEEEFEFEFEFEFEFF1EFEFEF
              EFEFEFEFEFEFEFEFEDECF0F0EFF3EEEDEFF0F0F0EFEFEFEFEFEFF1EFEFF1EEF0
              EFEEF0EEEEEEEDEFEFECEEEEEDECEEEAECEDECECECECECECEDEDEDECEDE9EBEA
              ECEEEEEEF0EEEEF1EFEFEFEFEFEBF0EEEFEEF0EFEFEFEEEEEEEFEFEFF1EEF0F1
              EEF0F1EEF0F0EEEEF1EBF0F0EAEFF1EFEFF1EFEFEFEFEFEFEEF0F1F0ECE6E7E5
              E7ECEFE6EBECE8ECEDEAEEEFEFEEF0F1EFEFF1EEF0EEEAEFEDEFF0EFEFEFEFEF
              EFEFEEF0EFEFEFEFEFEFEFEFEFEFECEEEDECF0F1EFEFEFEEF0EFEFEFEFEFEFEE
              EDEFEFEFEFEFEFEFEDECF0EFEEF0EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF0F0F0
              F1EEF0F0F1EFF1EFEEEFEFEFEDECF0EFF0EEF1EEF0F1EFEFEFEFEFEFF0EEEFEF
              EFEFEFEFF0F1EFEEEEEEEFEEF0EFEFEFEFEEF0EFEFEFEFEFEFEFEEF0EEEEEEEF
              EEF0EFEBF0EFEBF0EDECF0F1EBF0EFECEEEEEFEDF0F0F0F1EAEDF1EFEEF1EFEF
              EFF0EEEEF0F1EFEBF0ECF1F0EDEFEFEEEAEFF1EAF1EFEBF0EEF0F0EEEEEEEFEC
              EEEFECEEE9EBED000000}
          end
        end
      end
      object RichEditInfo: TRichEdit
        Left = 22
        Top = 355
        Width = 945
        Height = 446
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object CheckBoxLog2: TCheckBox
    Left = 227
    Top = 2
    Width = 106
    Height = 25
    Caption = 'Log2 Transform'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBoxLog2Click
  end
  object CheckBoxShowFeature: TCheckBox
    Left = 356
    Top = 15
    Width = 131
    Height = 17
    Caption = 'Show Feature Width'
    TabOrder = 2
    OnClick = ReplotEverythingEvent
  end
  object CheckBoxUniform: TCheckBox
    Left = 356
    Top = 49
    Width = 131
    Height = 17
    Caption = 'Show Uniform Spacing'
    TabOrder = 3
    OnClick = ReplotEverythingEvent
  end
  object CheckBoxGap: TCheckBox
    Left = 356
    Top = 32
    Width = 51
    Height = 17
    Caption = 'Show '
    TabOrder = 4
    OnClick = ReplotEverythingEvent
  end
  object CheckBoxPeaks: TCheckBox
    Left = 802
    Top = 3
    Width = 81
    Height = 17
    Caption = 'Show Peaks'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = CheckBoxPeaksClick
  end
  object GroupBoxSmoothing: TGroupBox
    Left = 522
    Top = 0
    Width = 260
    Height = 89
    Caption = 'Smoothing'
    TabOrder = 6
    object LabelNSmooth: TLabel
      Left = 10
      Top = 66
      Width = 17
      Height = 13
      Caption = 'N ='
    end
    object LabelRounds: TLabel
      Left = 218
      Top = 66
      Width = 37
      Height = 13
      Caption = 'Rounds'
    end
    object LabelNPoint: TLabel
      Left = 81
      Top = 66
      Width = 76
      Height = 13
      Caption = '2N+1 = 11-point'
    end
    object CheckBoxSmooth: TCheckBox
      Left = 10
      Top = 16
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = ReplotEverythingEvent
    end
    object CheckBoxGaussian: TCheckBox
      Left = 78
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Gaussian'
      TabOrder = 1
      OnClick = ReplotEverythingEvent
    end
    object SpinEditSmoothHalfRange: TSpinEdit
      Left = 32
      Top = 61
      Width = 41
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 2
      Value = 5
      OnChange = SpinEditTraceCountChange
    end
    object SpinEditSmoothRounds: TSpinEdit
      Left = 170
      Top = 61
      Width = 41
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 3
      Value = 8
      OnChange = ReplotEverythingEvent
    end
    object RadioButtonRawData: TRadioButton
      Left = 164
      Top = 39
      Width = 73
      Height = 17
      Caption = 'Raw Data'
      TabOrder = 4
      OnClick = ReplotEverythingEvent
    end
    object RadioButtonUniformData: TRadioButton
      Left = 10
      Top = 39
      Width = 143
      Height = 17
      Caption = 'Uniformly- Spaced Data'
      Checked = True
      TabOrder = 5
      TabStop = True
      OnClick = ReplotEverythingEvent
    end
  end
  object ComboBoxChromosomeFilter: TComboBox
    Left = 10
    Top = 2
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'Chromosome III'
    OnChange = ComboBoxChromosomeFilterChange
  end
  object EditCoord1: TEdit
    Left = 87
    Top = 28
    Width = 55
    Height = 21
    TabOrder = 8
    Text = '0'
    OnKeyPress = EditCoordKeyPress
  end
  object EditCoord2: TEdit
    Left = 161
    Top = 28
    Width = 55
    Height = 21
    TabOrder = 9
    Text = '320000'
    OnKeyPress = EditCoordKeyPress
  end
  object ButtonReplot: TButton
    Left = 227
    Top = 28
    Width = 40
    Height = 21
    Caption = 'Replot'
    Enabled = False
    TabOrder = 10
    OnClick = ButtonReplotClick
  end
  object EditDisplayFrom: TEdit
    Left = 87
    Top = 52
    Width = 55
    Height = 21
    TabOrder = 11
    Text = '-2.50'
    OnKeyPress = EditFloatKeyPress
  end
  object EditDisplayTo: TEdit
    Left = 161
    Top = 53
    Width = 55
    Height = 21
    TabOrder = 12
    Text = '4.25'
    OnKeyPress = EditFloatKeyPress
  end
  object CheckBoxContent: TCheckBox
    Left = 356
    Top = 66
    Width = 131
    Height = 17
    Caption = 'Show AT/GC Content'
    Checked = True
    State = cbChecked
    TabOrder = 13
    OnClick = ReplotEverythingEvent
  end
  object SpinEditMinSmoothLeftDelta: TSpinEdit
    Left = 830
    Top = 37
    Width = 60
    Height = 22
    Hint = '1000 = 1.000'
    Increment = 100
    MaxValue = 5000
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    Value = 100
    OnChange = ReplotEverythingEvent
  end
  object SpinEditMinSmoothRightDelta: TSpinEdit
    Left = 830
    Top = 61
    Width = 60
    Height = 22
    Hint = '1000 = 1.000'
    Increment = 100
    MaxValue = 5000
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    Value = 100
    OnChange = ReplotEverythingEvent
  end
  object SpinEditThreshold: TSpinEdit
    Left = 922
    Top = 37
    Width = 60
    Height = 22
    Hint = '1000 = 1.000'
    Increment = 100
    MaxValue = 10000
    MinValue = -10000
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Value = 0
    OnChange = ReplotEverythingEvent
  end
  object CheckBoxAutoScaleRatio: TCheckBox
    Left = 227
    Top = 56
    Width = 81
    Height = 17
    Caption = 'AutoScale'
    Checked = True
    State = cbChecked
    TabOrder = 17
    OnClick = ReplotEverythingEvent
  end
  object CheckBoxShowRatio: TCheckBox
    Left = 356
    Top = -2
    Width = 131
    Height = 17
    Caption = 'Show Raw Ratio Data'
    Checked = True
    State = cbChecked
    TabOrder = 18
    OnClick = ReplotEverythingEvent
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.CSV'
    Left = 396
    Top = 882
  end
  object ExcelApplicationCoordinates: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 245
    Top = 882
  end
  object OpenDialogCoordinates: TOpenDialog
    DefaultExt = 'XLS'
    Left = 208
    Top = 883
  end
  object OpenDialogRatio: TOpenDialog
    DefaultExt = 'XLS'
    Left = 297
    Top = 882
  end
  object ExcelApplicationRatio: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 333
    Top = 882
  end
  object SavePictureDialog: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 430
    Top = 882
  end
  object OpenDialogGenomeIndex: TOpenDialog
    DefaultExt = '.DAT'
    FileName = 'GenomeIndex.DAT'
    Left = 169
    Top = 884
  end
  object SaveDialogPostscript: TSaveDialog
    Left = 472
    Top = 880
  end
end
