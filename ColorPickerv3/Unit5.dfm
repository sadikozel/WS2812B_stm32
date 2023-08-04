object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'HAKKINDA'
  ClientHeight = 181
  ClientWidth = 204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 113
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 56
    Top = 140
    Width = 91
    Height = 33
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
