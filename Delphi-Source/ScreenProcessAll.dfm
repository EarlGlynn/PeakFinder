object FormProcessAll: TFormProcessAll
  Left = 454
  Top = 273
  Width = 540
  Height = 257
  Caption = 'Process All'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDirectory: TLabel
    Left = 24
    Top = 24
    Width = 42
    Height = 13
    Caption = 'Directory'
  end
  object LabelPrefix: TLabel
    Left = 24
    Top = 64
    Width = 26
    Height = 13
    Caption = 'Prefix'
  end
  object LabelComplete: TLabel
    Left = 110
    Top = 118
    Width = 131
    Height = 13
    Caption = 'PROCESSING COMPLETE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object ButtonGo: TButton
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Go'
    TabOrder = 0
    OnClick = ButtonGoClick
  end
  object EditDirectory: TEdit
    Left = 110
    Top = 22
    Width = 400
    Height = 21
    TabOrder = 1
  end
  object BitBtnOK: TBitBtn
    Left = 232
    Top = 197
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object ProgressBar: TProgressBar
    Left = 110
    Top = 116
    Width = 400
    Height = 16
    Max = 17
    TabOrder = 3
    Visible = False
  end
  object BitBtnCancel: TBitBtn
    Left = 24
    Top = 137
    Width = 75
    Height = 25
    TabOrder = 4
    Visible = False
    OnClick = BitBtnCancelClick
    Kind = bkCancel
  end
  object EditPrefix: TEdit
    Left = 110
    Top = 62
    Width = 80
    Height = 21
    TabOrder = 5
  end
  object CheckBoxSaveChartSingle: TCheckBox
    Left = 271
    Top = 62
    Width = 146
    Height = 17
    Caption = 'Save Single-Row Charts'
    TabOrder = 6
  end
  object CheckBoxSaveChartMulti: TCheckBox
    Left = 271
    Top = 82
    Width = 138
    Height = 17
    Caption = 'Save Multi-Row Charts'
    TabOrder = 7
  end
end
