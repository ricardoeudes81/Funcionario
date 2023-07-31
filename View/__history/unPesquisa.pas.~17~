unit unPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, unControllerFuncionario;

type
  TfrmPesquisa = class(TForm)
    pnlFiltro: TPanel;
    pnlGrid: TPanel;
    pnlBotoes: TPanel;
    DBGrid1: TDBGrid;
    grbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCanelar: TBitBtn;
    lblFiltro: TLabel;
    edtFiltro: TEdit;
    cdsPesquisa: TClientDataSet;
    dscPesquisa: TDataSource;
    cdsPesquisaNOME: TStringField;
    cdsPesquisaCPF: TStringField;
    cdsPesquisaSALARIO: TFloatField;
    cdsPesquisaID: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCanelarClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
  private
    FIdPesquisado: Integer;
    procedure BuscarListaDeEntidade();
    procedure AplicarFiltroNaPesquisa();

    { Private declarations }
  public
    property IdPesquisado: Integer read FIdPesquisado;

    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.AplicarFiltroNaPesquisa;
begin
   cdsPesquisa.Filtered := False;
   if (cdsPesquisa.IsEmpty) or (Trim(edtFiltro.Text) = EmptyStr) then
   begin
      cdsPesquisa.Filter := EmptyStr;
      Exit;
   end;

   cdsPesquisa.Filter :=
     'ID like ' + QuotedStr('%'+ Trim(edtFiltro.Text) +'%') +
     ' OR UPPER(NOME) like ' + QuotedStr('%'+ UpperCase(Trim(edtFiltro.Text)) +'%')  +
     ' OR CPF like ' + QuotedStr('%'+ Trim(edtFiltro.Text) +'%');
   cdsPesquisa.Filtered := True;
end;

procedure TfrmPesquisa.btnCanelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisa.btnConfirmarClick(Sender: TObject);
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  FIdPesquisado := cdsPesquisa.FieldByName('ID').AsInteger;
  Close;
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.BuscarListaDeEntidade;
begin
  var Controller := TControllerFuncionario.Create;
  var Funcionarios := Controller.ObterListaFuncionarios();
  try
    cdsPesquisa.DisableControls;
    for var Funcionario in Funcionarios do
    begin
      cdsPesquisa.Append;
      cdsPesquisa.FieldByName('ID').AsString := Funcionario.Id.ToString;
      cdsPesquisa.FieldByName('NOME').AsString := Funcionario.Nome;
      cdsPesquisa.FieldByName('CPF').AsString := Funcionario.CPF;
      cdsPesquisa.FieldByName('SALARIO').AsFloat := Funcionario.Salario;
      cdsPesquisa.Post;
    end;
  finally
    cdsPesquisa.First;
    while cdsPesquisa.ControlsDisabled do
      cdsPesquisa.EnableControls;
    Funcionarios.DisposeOf;
    Controller.DisposeOf;
  end;
end;

procedure TfrmPesquisa.edtFiltroChange(Sender: TObject);
begin
  AplicarFiltroNaPesquisa();
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  BuscarListaDeEntidade();
end;

end.
