object Form1: TForm1
  Left = 660
  Top = 197
  BorderStyle = bsToolWindow
  Caption = 'WS2812B LED PROJESI // salvia'
  ClientHeight = 460
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 21
    Top = 37
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object Label3: TLabel
    Left = 69
    Top = 37
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object Label4: TLabel
    Left = 114
    Top = 37
    Width = 6
    Height = 13
    Caption = 'B'
  end
  object LabelStatus: TLabel
    Left = 340
    Top = 385
    Width = 233
    Height = 17
    AutoSize = False
    Caption = 'Server Aktif De'#287'il'
    Font.Charset = TURKISH_CHARSET
    Font.Color = 4410964
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object editColor1: TEdit
    Left = 34
    Top = 34
    Width = 27
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = editColor1KeyDown
    OnKeyPress = editColor1KeyPress
    OnKeyUp = editColor1KeyUp
  end
  object editColor2: TEdit
    Tag = 1
    Left = 80
    Top = 34
    Width = 27
    Height = 21
    ReadOnly = True
    TabOrder = 1
    OnKeyDown = editColor1KeyDown
    OnKeyPress = editColor1KeyPress
    OnKeyUp = editColor1KeyUp
  end
  object editColor3: TEdit
    Tag = 2
    Left = 126
    Top = 34
    Width = 27
    Height = 21
    ReadOnly = True
    TabOrder = 2
    OnKeyDown = editColor1KeyDown
    OnKeyPress = editColor1KeyPress
    OnKeyUp = editColor1KeyUp
  end
  object Panel1: TPanel
    Left = 212
    Top = 29
    Width = 201
    Height = 176
    BevelOuter = bvLowered
    TabOrder = 3
    object imgColorBox: TImage
      Left = 33
      Top = 5
      Width = 138
      Height = 138
      OnMouseDown = imgColorBoxMouseDown
      OnMouseMove = imgColorBoxMouseMove
      OnMouseUp = imgColorBoxMouseUp
    end
    object imgZBar: TImage
      Left = 5
      Top = 149
      Width = 192
      Height = 18
      OnMouseDown = imgColorBarMouseDown
      OnMouseMove = imgColorBarMouseMove
      OnMouseUp = imgColorBarMouseUp
    end
    object imgColor: TImage
      Left = 175
      Top = 3
      Width = 22
      Height = 40
      OnMouseDown = imgColorMouseDown
    end
    object btnVar: TSpeedButton
      Left = 177
      Top = 121
      Width = 22
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E000000010000000100006E00FF008325
        FF00903CFF009C51FF00A663FF00AF74FF00B985FF00C294FF00CAA3FF00D2B1
        FF00DABFFF00E2CCFF00E9D9FF00F0E6FF00F8F3FF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
        0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F03070F
        0F0F0F0C030101060F0F0F0F0F01060F0F0F0C01040B0801040F0F0F0F01060F
        0F0F03020F0F0F09000C0F0F0F01060F0F0F01060F0F0F0F01070F0F0F01060F
        0F0F01060F0F0F0F01070F0F0F01060F0F0B00020F0F0F07010D0F0F0F01060F
        0F0F010301050300050F0A0F0F01060F0F0F010A0A0403080F0F03020A01060F
        0F0F02050F0F0F0F0C0F0F050000060F0F0F06010E0F0F08010D0F0F0800060F
        0F0F0F0202060501050F0F0F0F05070F0F0F0F0F070202080F0F0F0F0F0F0F0F
        0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F}
      OnClick = btnVarClick
    end
    object imgPal: TImage
      Left = 175
      Top = 46
      Width = 22
      Height = 72
      OnMouseDown = imgPalMouseDown
    end
  end
  object editNo: TEdit
    Left = 34
    Top = 80
    Width = 121
    Height = 21
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 4
    TextHint = 'LED NO'
    OnKeyPress = editNoKeyPress
  end
  object btnSend: TButton
    Left = 34
    Top = 126
    Width = 121
    Height = 54
    Caption = 'Se'#231'ili LED'#39'i Yak'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnSendClick
  end
  object btnReset: TButton
    Left = 34
    Top = 360
    Width = 121
    Height = 54
    Caption = 'T'#252'm LED'#39'leri S'#246'nd'#252'r'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnResetClick
  end
  object btnConnect: TButton
    Left = 340
    Top = 408
    Width = 97
    Height = 49
    Caption = 'BA'#286'LAN'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 457
    Top = 408
    Width = 97
    Height = 49
    Caption = 'BA'#286'LANTIYI KES'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnDisconnectClick
  end
  object btnResetOne: TButton
    Left = 34
    Top = 282
    Width = 121
    Height = 54
    Caption = 'Se'#231'ili LED'#39'i S'#246'nd'#252'r'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnResetOneClick
  end
  object effectBox: TComboBox
    Left = 212
    Top = 220
    Width = 201
    Height = 21
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    TextHint = 'Efekt Listesi'
    Items.Strings = (
      'Rainbow/G'#246'kku'#351'a'#287#305' Efekti (Test A'#351'amas'#305'nda)'
      'Kayan G'#246'kku'#351'a'#287#305' Efekti'
      'Breathe (Test A'#351'amas'#305'nda)')
  end
  object btnSendAll: TButton
    Left = 34
    Top = 204
    Width = 121
    Height = 54
    Caption = 'T'#252'm LED'#39'leri Yak'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnSendAllClick
  end
  object btnEffSend: TButton
    Left = 328
    Top = 256
    Width = 85
    Height = 41
    Caption = 'EFEKT'#39#304' SE'#199
    TabOrder = 12
    OnClick = btnEffSendClick
  end
  object ilMain: TImageList
    Left = 256
    Top = 48
    Bitmap = {
      494C010108000C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000F8F8F800F8F8F800F8F8F80080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F800FFFFFF00000000000000000000000000FFFFFF00F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      800000000000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F800808080000000000000000000000000000000000000000000F8F8F8000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F800FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F8000000000000000000000000000000000080808000F8F8F8000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F800FFFF
      FF00FFFFFF008080800000000000000000000000000080808000FFFFFF00FFFF
      FF00F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F80080808000000000000000000000000000F8F8F800000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800000000000000000000000000F8F8F800000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000F8F8F80000000000000000000000000080808000F8F8F8000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F800FFFF
      FF00FFFFFF008080800000000000000000000000000080808000FFFFFF00FFFF
      FF00F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000000000000F8F8F8000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F800FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F800000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F800808080000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F800FFFFFF00000000000000000000000000FFFFFF00F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000F8F8F800F8F8F800F8F8F80080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      800000000000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F800808080000000000000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000F8F8F8000000000000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F80080808000000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00F8F8F800000000000000000000000000F8F8F800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00F8F8F800000000000000000000000000F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000F8F8F800000000000000000000000000F8F8F800000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000F8F8F80000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF000000
      0000F8F8F8008080800000000000000000000000000080808000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F8008080800000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00000000000000
      0000F8F8F8000000000000000000000000000000000000000000F8F8F8000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000F8F8F800000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F80080808000000000000000000000000000000000000000000080808000F8F8
      F800000000000000000000000000FFFFFF00000000000000000000000000F8F8
      F800808080000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000000000000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000F8F8F8008080800000000000FFFFFF000000000080808000F8F8F8008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00781038103810380038383810381038C63
      0101010101010C6109210101010100011FF11FF11FF101010921010101010001
      0101010101010C618383810381038C638103810381038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83FFFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00783838003800380038FE38C6380038823
      0FE10C61010104411FF10381038103811FF1038107C103811FF1038103810381
      0FE10C61010104418FE38C63800388238383800380038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object timeAni: TTimer
    Enabled = False
    Interval = 50
    OnTimer = timeAniTimer
    Left = 288
    Top = 48
  end
  object MQTTClient1: TMQTTClient
    KeepAlive = 10
    MaxRetries = 8
    RetryTime = 60
    Clean = False
    Broker = False
    AutoSubscribe = False
    Port = 1883
    LocalBounce = False
    OnOnline = MQTTClient1Online
    OnOffline = MQTTClient1Offline
    Left = 496
    Top = 144
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 496
    Top = 104
  end
  object XPManifest1: TXPManifest
    Left = 496
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 496
    Top = 200
    object Seenekler1: TMenuItem
      Caption = 'Se'#231'enekler'
      object mSettings: TMenuItem
        Caption = 'Ayarlar'
        OnClick = mSettingsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mAbout: TMenuItem
        Caption = 'Hakk'#305'nda'
        OnClick = mAboutClick
      end
      object mExit: TMenuItem
        Caption = #199#305'k'#305#351
        OnClick = mExitClick
      end
    end
    object mBaglanti1: TMenuItem
      Caption = 'Ba'#287'lant'#305
      object mBglntConnect: TMenuItem
        Caption = 'Ba'#287'lant'#305' Kur'
        OnClick = mBglntConnectClick
      end
      object mBglntDisconnect: TMenuItem
        Caption = 'Ba'#287'lant'#305'y'#305' Kes'
        OnClick = mBglntDisconnectClick
      end
    end
  end
end
