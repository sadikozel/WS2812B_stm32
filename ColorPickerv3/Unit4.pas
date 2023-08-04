unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Inifiles;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    txtServer: TEdit;
    txtPort: TEdit;
    txtUser: TEdit;
    txtPass: TEdit;
    txtSUB1: TEdit;
    txtSUB2: TEdit;
    txtStartTopicPUB: TEdit;
    txtStartTextPUB: TEdit;
    CheckReconnect: TCheckBox;
    CheckStartConnect: TCheckBox;
    btnCancel: TButton;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Main;

{$R *.dfm}


procedure ReadINI();
var
  Ini: Tinifile;
  leddata: String;
begin
  leddata :=  Form1.editNo.Text + 'A' + Form1.editColor1.Text + 'B' + Form1.editColor2.Text + 'C' + Form1.editColor3.Text + 'D';
  Ini:=TiniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  Form4.txtServer.Text:=Ini.ReadString('Settings','Server','');
  Form4.txtPort.Text:=Ini.ReadString('Settings','Port','');
  Form4.txtUser.Text:=Ini.ReadString('Settings','User','');
  Form4.txtPass.Text:=Ini.ReadString('Settings','Pass','');
  Form4.txtSUB1.Text:=Ini.ReadString('Settings','SUB1','');
  Form4.txtSUB2.Text:=Ini.ReadString('Settings','SUB2','');
  leddata:=Ini.ReadString('Settings','PUB','');
  Form4.txtStartTopicPUB.Text:=Ini.ReadString('Settings','StartTopicPUB','');
  Form4.txtStartTextPUB.Text:=Ini.ReadString('Settings','StartTextPUB','');
  Form4.CheckStartConnect.Checked:=Ini.ReadBool('Settings','StartConnect', Form4.CheckStartConnect.Checked);
  Form4.CheckReconnect.Checked:=Ini.ReadBool('Settings','Reconnect', Form4.CheckReconnect.Checked);
  Ini.Free;
end;

procedure TForm4.btnCancelClick(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.btnSaveClick(Sender: TObject);
var
  Ini: Tinifile;
  leddata: String;
begin
  leddata :=  Form1.editNo.Text + 'A' + Form1.editColor1.Text + 'B' + Form1.editColor2.Text + 'C' + Form1.editColor3.Text + 'D';
  Ini:=TiniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  Ini.WriteString('Settings','Server', txtServer.Text);
  Ini.WriteString('Settings','Port', txtPort.Text);
  Ini.WriteString('Settings','User', txtUser.Text);
  Ini.WriteString('Settings','Pass', txtPass.Text);
  Ini.WriteString('Settings','SUB1', txtSUB1.Text);
  Ini.WriteString('Settings','SUB2', txtSUB2.Text);
  Ini.WriteString('Settings','PUB', leddata);
  Ini.WriteString('Settings','StartTopicPUB', txtStartTopicPUB.Text);
  Ini.WriteString('Settings','StartTextPUB', txtStartTextPUB.Text);
  Ini.WriteBool('Settings','StartConnect', CheckStartConnect.Checked);
  Ini.WriteBool('Settings','Reconnect', CheckReconnect.Checked);
  Ini.Free;
  Form4.Close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReadINI;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  txtPass.PasswordChar:=#149;
  ReadINI;
  if CheckStartConnect.Checked then Form1.btnConnect.Click;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
   ReadINI;
end;


end.
