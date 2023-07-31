unit unCadDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Dependente;

type
  TfrmCadDependente = class(TForm)
    lblId: TLabel;
    edtId: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    chkCalculaIR: TCheckBox;
    chkCalculaINSS: TCheckBox;
    pnlButton: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    grbBotoes: TGroupBox;
    pnlDados: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdFuncionario: Integer;
    FDependente: TDependente;
    procedure ChecarCamposObrigatorios();
    { Private declarations }
  public
    property IdFuncionario: Integer read FIdFuncionario write FIdFuncionario;
    property Dependente: TDependente read FDependente write FDependente;
    { Public declarations }
  end;

var
  frmCadDependente: TfrmCadDependente;

implementation

{$R *.dfm}

procedure TfrmCadDependente.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadDependente.btnConfirmarClick(Sender: TObject);
begin
  ChecarCamposObrigatorios();
  FDependente.IdFuncionario := FIdFuncionario;
  FDependente.Id :=  StrToIntDef(edtId.Text, 0);
  FDependente.Nome := Trim(edtNome.Text);
  FDependente.CalculaIR := chkCalculaIR.Checked;
  FDependente.CalculaINSS := chkCalculaINSS.Checked;
  Close;
  Self.ModalResult := mrOk;
end;

procedure TfrmCadDependente.ChecarCamposObrigatorios;
begin
  if (Trim(edtNome.Text) = EmptyStr) then
  begin
    ShowMessage('Campo "Nome" não preenchido.' + sLineBreak +
      'Por favor, verifique.');
    if edtNome.CanFocus then
      edtNome.SetFocus;
    Abort;
  end;
end;

procedure TfrmCadDependente.FormCreate(Sender: TObject);
begin
  FDependente := TDependente.Create;
end;

procedure TfrmCadDependente.FormShow(Sender: TObject);
begin
  if not FDependente.Nome.IsEmpty then
  begin
    if Dependente.Id <> 0 then
      edtId.Text := IntToStr(Dependente.Id);
    edtNome.Text := Dependente.Nome;
    chkCalculaIR.Checked := Dependente.CalculaIR;
    chkCalculaINSS.Checked := Dependente.CalculaINSS;
  end;
end;

end.
