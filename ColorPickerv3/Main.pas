unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, Math, Buttons, System.ImageList,
  uMQTTComps, uMQTT, Vcl.XPMan, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.BandActn, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.CheckLst;

const
  CM_COLORUPDATE = WM_USER + 1984; // Custom Message...

type
  PRGB = ^TRGB;
  TRGB = record b, g, r: Byte;
  end;
  PRGBA = ^TRGBA;
  TRGBA = record b, g, r, a: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBARRAY = array[0..0] of TRGB;
  THSB = record h, s, b: Word;
  end;

  TForm1 = class(TForm)
    ilMain: TImageList;
    editColor2: TEdit;
    editColor3: TEdit;
    editColor1: TEdit;
    timeAni: TTimer;
    Panel1: TPanel;
    imgColorBox: TImage;
    imgZBar: TImage;
    imgColor: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnVar: TSpeedButton;
    imgPal: TImage;
    editNo: TEdit;
    btnSend: TButton;
    btnReset: TButton;
    btnConnect: TButton;
    btnDisconnect: TButton;
    MQTTClient1: TMQTTClient;
    Timer2: TTimer;
    XPManifest1: TXPManifest;
    LabelStatus: TLabel;
    btnResetOne: TButton;
    MainMenu1: TMainMenu;
    Seenekler1: TMenuItem;
    mSettings: TMenuItem;
    N1: TMenuItem;
    mAbout: TMenuItem;
    mExit: TMenuItem;
    mBaglanti1: TMenuItem;
    mBglntConnect: TMenuItem;
    mBglntDisconnect: TMenuItem;
    effectBox: TComboBox;
    btnSendAll: TButton;
    btnEffSend: TButton;
    procedure PaintColorPnl;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgColorBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgColorBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgColorBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure timeAniTimer(Sender: TObject);
    procedure btnVarClick(Sender: TObject);
    procedure imgColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure editColor1KeyPress(Sender: TObject; var Key: Char);
    procedure editColor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editColor1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSendClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MQTTClient1Online(Sender: TObject);
    procedure MQTTClient1Offline(Sender: TObject; Graceful: Boolean);
    procedure btnResetClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure editNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnResetOneClick(Sender: TObject);
    procedure mSettingsClick(Sender: TObject);
    procedure mAboutClick(Sender: TObject);
    procedure mBglntConnectClick(Sender: TObject);
    procedure mBglntDisconnectClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure btnSendAllClick(Sender: TObject);
    procedure btnEffSendClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    function GetColor: TColor;
    procedure SetColor(Color: TColor; Update: Boolean); overload;
    procedure SetColor(Color: TColor; Alpha: Byte; Update: Boolean); overload;
    procedure PaintVar;
    procedure PaintColorHue;
    procedure PaintHueBar;
  end;

const
  AniStep = 4;

var
  Form1: TForm1;
  HBoxBmp, HBarBmp, ABarBmp, ColorBmp: TBitmap;
  RGBColor: TRGB;
  RGBAlpha: Byte;
  HSBColor: THSB;
  ColorMode, CellMul, CellDiv: Byte;
  DoColor, DoBar, DoVar, DoLive, DoAlpha: Boolean;
  LUT138: array[0..138] of Byte;
  CTab: array[0..255] of TRGB;
  WebSafeColorLut: array[0..255] of Byte;
  VarIdx: Integer;
  AniCount: Integer;
  NewColor: TColor;
  OldColor: TColor;
  OldAlpha: Byte;
  BoxX, BoxY, BarX, BarA: Integer;
  LastHue: Integer;
  TextEnter: Boolean;
  ClientST: Boolean;

implementation

{$R *.dfm}

uses
  ColorUtils, Unit4, Unit5;

function TForm1.GetColor: TColor;
begin
  Result := RGB(RGBColor.r, RGBColor.g, RGBColor.b);
end;

procedure TForm1.SetColor(Color: TColor; Alpha: Byte; Update: Boolean);
begin
  RGBAlpha := Alpha;
  SetColor(Color, Update);
end;

procedure TForm1.mSettingsClick(Sender: TObject);
begin
  Form4.ShowModal;
  Form4.ActiveControl := nil;
end;

procedure TForm1.SetColor(Color: TColor; Update: Boolean);
var
  c: Integer;
  h, s, b: Word;
begin
  if not UpDate then
    OldColor := Color;
  c := ColorToRGB(Color);
  RGBColor.b := Byte(c shr 16);
  RGBColor.g := Byte(c shr 8);
  RGBColor.r := Byte(c);
  RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, h, s, b);
  BoxX := MulDiv(137, s, 255);
  BoxY := 137 - MulDiv(137, b, 255);
  BarX := MulDiv(192, h, 360);
  BarA := MulDiv(137, RGBAlpha, 255);
  LastHue := -1;
  PaintColorPnl;
end;

procedure TForm1.PaintVar;
var
  x, y, i, j, k, q, h: Integer;
  col: TColor;
  cell: TRect;
  s: Double;
  mode16: Boolean;
begin
  mode16 := True;
  imgColorBox.Canvas.Brush.Color := clBlack;
  imgColorBox.Canvas.Rectangle(Canvas.ClipRect);
  // 16 or 64 mode ...
  if mode16 then
  begin
    CellMul := 4;
    CellDiv := 34;
    q := 8;
  end
  else
  begin
    CellMul := 8;
    CellDiv := 17;
    q := 32;
  end;
  s := 255 / (q - 1);
  j := (q * 2) - 1;
  h := MulDiv(360, BarX, 192);
  for i := 0 to q - 1 do
  begin
    k := Trunc(s * i);
    HSBtoRGB(h, k, 255, CTab[i].r, CTab[i].g, CTab[i].b);
    HSBtoRGB(h, 255, k, CTab[j - i].r, CTab[j - i].g, CTab[j - i].b);
  end;
  HBoxBmp.Canvas.Brush.Style := bsClear;
  HBoxBmp.Canvas.Brush.Color := clBlack;
  HBoxBmp.Canvas.Pen.Color := clBlack;
  HBoxBmp.Canvas.Rectangle(0, 0, 138, 138);
  HBoxBmp.Canvas.Brush.Style := bsSolid;
  for y := 0 to CellMul - 1 do
  begin
    for x := 0 to CellMul - 1 do
    begin
      i := (y * CellMul) + x;
      col := (cTab[i].b shl 16) + (cTab[i].g shl 8) + cTab[i].r;
      HBoxBmp.Canvas.Brush.Color := col;
      HBoxBmp.Canvas.Pen.Color := col;
      cell.Left := 1 + (x * CellDiv);
      cell.Top := 1 + (y * CellDiv);
      Cell.Right := Cell.Left + CellDiv - 2;
      Cell.Bottom := Cell.Top + CellDiv - 2;
      HBoxBmp.Canvas.Rectangle(Cell);
    end;
  end;
  imgColorBox.Canvas.Draw(1, 1, HBoxBmp);
end;

procedure TForm1.PaintColorPnl;
begin
  NewColor := (RGBColor.b shl 16) + (RGBColor.g shl 8) + RGBColor.r;
  PaintHueBar;

  if DoVar then
    PaintVar
  else
    PaintColorHue;
  if not TextEnter then
  begin
    editColor1.Text := IntToStr(RGBColor.r);
    editColor2.Text := IntToStr(RGBColor.g);
    editColor3.Text := IntToStr(RGBColor.b);

  end;
  if DoLive then
    PostMessage(Handle, CM_COLORUPDATE, OldColor, NewColor);
end;

procedure TForm1.btnAboutClick(Sender: TObject);
begin
  Form5.ShowModal;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
var
  id: integer;
begin

  if Form4.txtServer.Text = '' then
  begin
    ShowMessage('IP G�R�LMEL�');
    Form4.Show;
    Form4.txtServer.SetFocus;
    Exit;
  end;
  if Form4.txtPort.Text = '' then
  begin
    ShowMessage('PORT G�R�LMEL�');
    Form4.Show;
    Form4.txtPort.SetFocus;
    Exit;
  end;

  btnConnect.Enabled := false;
  btnDisconnect.Enabled := true;
  mSettings.Enabled := false;

  MQTTClient1.Host := Form4.txtServer.Text;
  MQTTClient1.Port := strtoint(Form4.txtPort.Text);
  MQTTClient1.Username := Form4.txtUser.Text;
  MQTTClient1.Password := Form4.txtPass.Text;
  Randomize;
  id := 1 + Random(1000);
  MQTTClient1.ClientID := 'win-' + inttostr(id);
  LabelStatus.Caption := 'Server Aktif';
  MQTTClient1.Activate(True);

end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  btnConnect.Enabled := true;
  btnDisconnect.Enabled := false;
  mSettings.Enabled := True;
  MQTTClient1.Activate(False);
end;

procedure TForm1.btnEffSendClick(Sender: TObject);
var
rainboweff: string;
begin

  rainboweff := '103A0B0C0D';

  if (effectBox.Text <= 'Kayan G�kku�a�� Efekti')then MQTTClient1.Publish('ESP12/L', rainboweff, qtAT_MOST_ONCE, false);

end;

procedure TForm1.btnResetClick(Sender: TObject);
var
resetdata: string;
begin
  resetdata := '102A0B0C0D';
  MQTTClient1.Publish('ESP12/L', resetdata, qtAT_MOST_ONCE, false);
end;


procedure TForm1.btnSendAllClick(Sender: TObject);
var
setall: string;
begin
  setall := '104' + 'A' + Form1.editColor1.Text + 'B' + Form1.editColor2.Text + 'C' + Form1.editColor3.Text + 'D';
  MQTTClient1.Publish('ESP12/L', setall, qtAT_MOST_ONCE, false);
end;

procedure TForm1.btnSendClick(Sender: TObject);
var
leddata: string;
begin
  leddata :=  Form1.editNo.Text + 'A' + Form1.editColor1.Text + 'B' + Form1.editColor2.Text + 'C' + Form1.editColor3.Text + 'D';
  if Length(editNo.Text) > 0  then
    begin

      MQTTClient1.Publish('ESP12/L', leddata, qtAT_MOST_ONCE, false);

    end;

end;

procedure TForm1.btnSettingsClick(Sender: TObject);
begin
  Form4.ShowModal;
  Form4.ActiveControl := nil;
end;

procedure TForm1.btnVarClick(Sender: TObject);
begin
  DoVar := btnVar.Down;
  LastHue := -1;
  PaintColorPnl;
end;

procedure TForm1.btnResetOneClick(Sender: TObject);
var
chosenled: string;
begin
  chosenled := Form1.editNo.Text + 'A0B0C0D';
    if Length(editNo.Text) > 0  then
    begin

      MQTTClient1.Publish('ESP12/L', chosenled, qtAT_MOST_ONCE, false);

    end;

end;

procedure TForm1.editColor1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  idx, i: Integer;
begin
  TextEnter := True;
  if Key = 13 then
  begin
    idx := (Sender as TEdit).Tag;
    case idx of
      0:
        begin
          i := StrToIntDef(editColor1.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.r := i;
        end;
      1:
        begin
          i := StrToIntDef(editColor2.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.g := i;
        end;
      2:
        begin
          i := StrToIntDef(editColor3.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.b := i;
        end;

    end;
    PaintColorPnl;
  end;
end;

procedure TForm1.editColor1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
    Key := #0;

  PaintColorPnl;
end;

procedure TForm1.editColor1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TextEnter := False;
end;

procedure TForm1.editNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Ge�ersiz Numara');
    // Discard the key
    Key := #0;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  btnDisconnect.Click;
  Form4.btnSave.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  Colors: array[0..15] of TColor = (clBlack, clWhite, clGray, clSilver,
    clMaroon, clRed, clGreen, clLime, clOlive, clYellow, clNavy, clBlue,
    clPurple, clFuchsia, clTeal, clAqua);
var
  i, j: Integer;
begin
  MQTTClient1.Clean := True;
  MQTTClient1.RetryTime := 30;
  btnSend.Enabled := false;
  btnReset.Enabled := false;
  btnResetOne.Enabled := false;
  btnDisconnect.Enabled := false;
  btnSendAll.Enabled := false;
  btnEffSend.Enabled := false;
  ClientST := False;

  HBoxBmp := TBitmap.Create;
  HBoxBmp.PixelFormat := pf24bit;
  HBoxBmp.Width := 138;
  HBoxBmp.Height := 138;
  HBarBmp := TBitmap.Create;
  HBarBmp.PixelFormat := pf24bit;
  HBarBmp.Width := 192;
  HBarBmp.Height := 1;
  ABarBmp := TBitmap.Create;
  ABarBmp.PixelFormat := pf24bit;
  ABarBmp.Width := 22;
  ABarBmp.Height := 138;
  ColorBmp := TBitmap.Create;
  ColorBmp.PixelFormat := pf24bit;
  ColorBmp.Width := 22;
  ColorBmp.Height := 40;
  Randomize;
  RGBColor.r := Random(255);
  RGBColor.g := Random(255);
  RGBColor.b := Random(255);
  SetColor((RGBColor.b shl 16) + (RGBColor.g shl 8) + (RGBColor.r),
    False);
  for i := 0 to 255 do
    WebSafeColorLut[I] := ((I + $19) div $33) * $33;
  for i := 0 to 137 do
    Lut138[i] := MulDiv(255, i, 137);
  DoColor := False;
  DoBar := False;
  DoVar := False;
  DoLive := False;
  VarIdx := -1;
  LastHue := -1;
  PaintColorPnl;
  // Paint 16 colors palette
  i := 0;
  j := 0;
  while j < 8 do
  begin
    imgPal.Canvas.Brush.Color := Colors[i];
    imgPal.Canvas.FillRect(Rect(0, j * 9, 11, (j + 1) * 9));
    imgPal.Canvas.Brush.Color := Colors[i + 1];
    imgPal.Canvas.FillRect(Rect(11, j * 9, 22, (j + 1) * 9));
    inc(i, 2);
    inc(j);
  end;


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ColorBmp.Free;
  ABarBmp.Free;
  HBarBmp.Free;
  HBoxBmp.Free;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift) then Key := 0;

end;

procedure TForm1.imgColorBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar := True;
  if x < 0 then
    x := 0;
  if x > imgZBar.Width - 1 then
    x := imgZBar.Width - 1;
  BarX := x;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TForm1.imgColorBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBar then
    Exit;
  if x < 0 then
    x := 0;
  if x > imgZBar.Width - 1 then
    x := imgZBar.Width - 1;
  BarX := x;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TForm1.imgColorBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar := False;
end;

procedure TForm1.imgColorBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DoVar then
  begin
    VarIdx := ((y div CellDiv) * CellMul) + (x div CellDiv);
    RGBColor.r := CTab[VarIdx].r;
    RGBColor.g := CTab[VarIdx].g;
    RGBColor.b := CTab[VarIdx].b;
    RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, HSBColor.h, HSBColor.s,
      HSBColor.b);
    BoxX := MulDiv(137, HSBColor.s, 255);
    BoxY := 137 - MulDiv(137, HSBColor.b, 255);
    PaintColorPnl;
    AniCount := AniStep;
    TimeAni.Enabled := VarIdx <> -1;
    Exit;
  end;
  DoColor := True;
  if x < 0 then
    x := 0;
  if x > imgColorBox.Width - 1 then
    x := imgColorBox.Width - 1;
  if y < 0 then
    y := 0;
  if y > imgColorBox.Height - 1 then
    y := imgColorBox.Height - 1;
  BoxX := x;
  BoxY := y;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TForm1.imgColorBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoColor then
    Exit;
  if x < 0 then
    x := 0;
  if x > imgColorBox.Width - 1 then
    x := imgColorBox.Width - 1;
  if y < 0 then
    y := 0;
  if y > imgColorBox.Height - 1 then
    y := imgColorBox.Height - 1;
  BoxX := x;
  BoxY := y;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintColorPnl;
end;

procedure TForm1.imgColorBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoColor := False;
end;

procedure TForm1.imgColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if y < 19 then
    SetColor(OldColor, False);
end;

procedure TForm1.imgPalMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetColor(imgPal.Canvas.Pixels[x, y], 255, True);
end;

procedure TForm1.MQTTClient1Offline(Sender: TObject; Graceful: Boolean);
begin
  mBglntConnect.Enabled := True;
  mBglntDisconnect.Enabled := false;
  btnSend.Enabled := false;
  btnResetOne.Enabled := false;
  btnReset.Enabled := false;
  btnSendAll.Enabled := false;
  btnEffSend.Enabled := false;

  if Graceful then
    begin
      LabelStatus.Caption := 'BA�LANTI YOK';

    end
  else
    begin

      ClientST := False;
    end;
end;

procedure TForm1.MQTTClient1Online(Sender: TObject);
var
  sublist: TStringList;
  aQos: TMQTTQOSType;
begin
  ClientST := True;
  mBglntConnect.Enabled := false;
  mBglntDisconnect.Enabled := true;
  btnSend.Enabled := true;
  btnResetOne.Enabled := true;
  btnReset.Enabled := true;
  btnSendAll.Enabled := true;
  btnEffSend.Enabled := true;
  LabelStatus.Caption := 'BA�LANTI SA�LANDI';
  if (Form4.txtSUB1.text <> '') or (Form4.txtSUB2.text <> '') then
  begin
    sublist := TStringList.Create;
    sublist.AddObject(Form4.txtSUB1.text, TObject(aQos));
    sublist.AddObject(Form4.txtSUB2.text, TObject(aQos));
    MQTTClient1.Subscribe(sublist);
    sublist.Free;
  end;
  if Form4.txtStartTopicPUB.text <> '' then MQTTClient1.Publish(Form4.txtStartTopicPUB.text, Form4.txtStartTextPUB.text, qtAT_MOST_ONCE, false);
end;

procedure TForm1.mAboutClick(Sender: TObject);
begin
  Form5.ShowModal;
  Form5.ActiveControl := nil;
end;

procedure TForm1.mBglntConnectClick(Sender: TObject);
var
id: integer;
begin
  if Form4.txtServer.Text = '' then
  begin
    ShowMessage('IP G�R�LMEL�');
    Form4.Show;
    Form4.txtServer.SetFocus;
    Exit;
  end;
  if Form4.txtPort.Text = '' then
  begin
    ShowMessage('PORT G�R�LMEL�');
    Form4.Show;
    Form4.txtPort.SetFocus;
    Exit;
  end;

  btnConnect.Enabled := false;
  btnDisconnect.Enabled := true;
  mSettings.Enabled := false;
  mBglntConnect.Enabled := false;
  mBglntDisconnect.Enabled := true;

  MQTTClient1.Host := Form4.txtServer.Text;
  MQTTClient1.Port := strtoint(Form4.txtPort.Text);
  MQTTClient1.Username := Form4.txtUser.Text;
  MQTTClient1.Password := Form4.txtPass.Text;
  Randomize;
  id := 1 + Random(1000);
  MQTTClient1.ClientID := 'win-' + inttostr(id);
  LabelStatus.Caption := 'Server Aktif';
  MQTTClient1.Activate(True);

end;

procedure TForm1.mBglntDisconnectClick(Sender: TObject);
begin
  btnConnect.Enabled := true;
  btnDisconnect.Enabled := false;
  mBglntConnect.Enabled := true;
  mBglntDisconnect.Enabled := false;
  mSettings.Enabled := True;
  MQTTClient1.Activate(False);
end;

procedure TForm1.mExitClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.PaintColorHue;
var
  Row: PRGBArray;
  slMain, slSize, slPtr: Integer;
  x, y, w, h: Integer;
  m1, q1, q2, q3, s1, s2: Integer;
  r, g, b: Byte;
  LUT: array of Byte;
begin
  h := MulDiv(360, BarX, 192);
  if h <> LastHue then
  begin // Only update if needed
    LastHue := h;
    HSBtoRGB(h, 255, 255, r, g, b);
    h := HBoxBmp.Height - 1;
    w := HBoxBmp.Width - 1;
    SetLength(LUT, w);
    for x := 0 to w do
      LUT[x] := MulDiv(255, x, w);
    slMain := Integer(HBoxBmp.ScanLine[0]);
    slSize := Integer(HBoxBmp.ScanLine[1]) - slMain;
    slPtr := slMain;
    for y := 0 to h do
    begin
      s1 := LUT[y];
      m1 := s1 * -255 shr 8 + 255;
      q1 := (s1 * -r shr 8 + r) - m1; // Red
      q2 := (s1 * -g shr 8 + g) - m1; // Green
      q3 := (s1 * -b shr 8 + b) - m1; // Blue
      for x := 0 to w do
      begin
        s2 := LUT[x];
        Row := PRGBArray(slPtr);
        Row[x].r := Byte(s2 * q1 shr 8 + m1);
        Row[x].g := Byte(s2 * q2 shr 8 + m1);
        Row[x].b := Byte(s2 * q3 shr 8 + m1);
      end;
      slPtr := slPtr + slSize;
    end;
    LUT := nil;
  end;
  imgColorBox.Canvas.Draw(0, 0, HBoxBmp);
  ilMain.Draw(imgColorBox.Canvas, BoxX - 7, BoxY - 7, 0, True); // Paint Marker
end;

procedure TForm1.PaintHueBar;
var
  Row: PRGBArray;
  x: Integer;
begin
  Row := PRGBArray(HBarBmp.ScanLine[0]);
  for x := 0 to HBarBmp.Width - 1 do
    HSBToRGB(MulDiv(360, x, 192), 255, 255, Row[x].r, Row[x].g, Row[x].b);
  imgZBar.Canvas.StretchDraw(Rect(0, 0, HBarBmp.Width, 18), HBarBmp);
  ilMain.Draw(imgZBar.Canvas, BarX - 7, 1, 0, True); // Paint Marker
end;

procedure TForm1.timeAniTimer(Sender: TObject);
var
  x, y: Integer;
  c: Integer;
begin
  AniCount := AniCount - 1;
  if VarIdx <> -1 then
  begin
    y := (VarIdx div CellMul);
    x := (VarIdx - (CellMul * y));
    x := CellDiv * x;
    y := CellDiv * y;
    c := (CTab[VarIdx].b shl 16) + (CTab[VarIdx].g shl 8) + CTab[VarIdx].r;
    if VarIdx < 8 then
      c := Blend(clBlack, c, Trunc(AniCount * (100 / AniStep)))
    else
      c := Blend(clWhite, c, Trunc(AniCount * (100 / AniStep)));
    HBoxBmp.Canvas.Pen.Color := c;
    HBoxBmp.Canvas.Brush.Color := c;
    HBoxBmp.Canvas.Brush.Style := bsSolid;
    HBoxBmp.Canvas.Rectangle(x + 1, y + 1, x + CellDiv - 1, y + CellDiv - 1);
    imgColorBox.Canvas.Draw(1, 1, HBoxBmp);
  end;
  timeAni.Enabled := (AniCount > 0) or (VarIdx = -1);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if (ClientST = false) and (Form4.CheckReconnect.Checked) then
    begin
      btnDisconnect.Click;
      btnConnect.Click;
    end;
end;

end.

