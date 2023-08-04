object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'AYARLAR'
  ClientHeight = 462
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 15
    Height = 16
    Caption = 'IP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 41
    Height = 16
    Caption = 'PORT:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 75
    Height = 16
    Caption = 'Kullan'#305'c'#305' Ad'#305':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 30
    Height = 16
    Caption = #350'ifre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 144
    Width = 209
    Height = 16
    Caption = 'Ba'#287'lant'#305' Ba'#351'lad'#305#287#305'nda Subscription'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 176
    Width = 48
    Height = 16
    Caption = 'Topic 1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 208
    Width = 48
    Height = 16
    Caption = 'Topic 2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 240
    Width = 197
    Height = 16
    Caption = 'Ba'#287'lant'#305' Ba'#351'lad'#305#287#305'nda Publishing'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 272
    Width = 38
    Height = 16
    Caption = 'Topic:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 304
    Width = 29
    Height = 16
    Caption = 'Text:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object txtServer: TEdit
    Left = 89
    Top = 18
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object txtPort: TEdit
    Left = 89
    Top = 48
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object txtUser: TEdit
    Left = 89
    Top = 78
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object txtPass: TEdit
    Left = 89
    Top = 114
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object txtSUB1: TEdit
    Left = 89
    Top = 178
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object txtSUB2: TEdit
    Left = 89
    Top = 208
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object txtStartTopicPUB: TEdit
    Left = 89
    Top = 274
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object txtStartTextPUB: TEdit
    Left = 89
    Top = 304
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object CheckReconnect: TCheckBox
    Left = 8
    Top = 376
    Width = 297
    Height = 33
    Caption = 'Ba'#287'lant'#305' Kesildi'#287'inde Yeniden Ba'#287'lan'
    TabOrder = 8
    WordWrap = True
  end
  object CheckStartConnect: TCheckBox
    Left = 8
    Top = 336
    Width = 297
    Height = 33
    Caption = 'MQTT Client '#231'al'#305#351't'#305#287#305'nda Server'#39'a Ba'#287'lan'
    TabOrder = 9
    WordWrap = True
  end
  object btnCancel: TButton
    Left = 192
    Top = 416
    Width = 113
    Height = 33
    Caption = #304'ptal'
    TabOrder = 10
    OnClick = btnCancelClick
  end
  object btnSave: TButton
    Left = 72
    Top = 416
    Width = 113
    Height = 33
    Caption = 'Kaydet'
    TabOrder = 11
    OnClick = btnSaveClick
  end
end
