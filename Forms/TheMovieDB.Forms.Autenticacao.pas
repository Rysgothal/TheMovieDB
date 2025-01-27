unit TheMovieDB.Forms.Autenticacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, IBX.IBDatabase,
  TheMovieDB.Helpers.Componentes, Vcl.Buttons;

type
  TfrmAutenticacao = class(TForm)
    gbxLogin: TGroupBox;
    btnSair: TButton;
    btnLogin: TButton;
    lblEntrarComoConvidado: TLabel;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    pnlLogo: TPanel;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    Bevel1: TBevel;
    cbxLembrar: TCheckBox;
    procedure lblEntrarComoConvidadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CriarSessaoConvidado;
    procedure IniciarConexaoAPI;
    procedure IniciarConexaoBanco;
    procedure Entrar;

  public
    { Public declarations }
  end;

var
  frmAutenticacao: TfrmAutenticacao;

implementation

uses
  TheMovieDB.Classes.TheMovieDBApi, TheMovieDB.Forms.Principal, System.UITypes,
  TheMovieDB.Classes.Exceptions, TheMovieDB.Classes.Banco, System.SysUtils;

{$R *.dfm}

procedure TfrmAutenticacao.btnLoginClick(Sender: TObject);
begin
  Entrar;
end;

procedure TfrmAutenticacao.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAutenticacao.CriarSessaoConvidado;
var
  lApi: TTheMovieDBApi;
begin
  lApi := TTheMovieDBApi.ObterInstancia;
  lApi.CriarSessaoConvidado;
  frmAutenticacao.ModalResult := mrOk;
end;

procedure TfrmAutenticacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if MessageDlg('A aplica��o ser� encerrada, quer mesmo sair?', mtInformation, [mbNo, mbYes], 0) = ID_NO then
//  begin
//    Exit;
//  end;
end;

procedure TfrmAutenticacao.FormCreate(Sender: TObject);
begin
  IniciarConexaoAPI;
  IniciarConexaoBanco;
end;

procedure TfrmAutenticacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;

  if Key = VK_ESCAPE then
  begin
    ModalResult := mrCancel;
  end;
end;

procedure TfrmAutenticacao.FormShow(Sender: TObject);
begin
  edtNome.Focar;
end;

procedure TfrmAutenticacao.IniciarConexaoAPI;
var
  lApi: TTheMovieDBApi;
begin
  try
    lApi := TTheMovieDBApi.ObterInstancia;

    if not lApi.ChaveValida then
    begin
      Application.MessageBox('A chave da API TheMovieDB est� inv�lida, verifique.', 'Chave Inv�lida');
      Application.Terminate;
    end;
  except
    on E: ETokenInvalido do
    begin
      Application.MessageBox(PChar(E.Message), 'Token Inv�lido');
      Close;
    end;

    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Inconsist�ncia Desconhecida');
      Close;
    end;
  end;
end;

procedure TfrmAutenticacao.IniciarConexaoBanco;
var
  lDados: TDados;
begin
  try
    lDados := TDados.ObterInstancia;
    lDados.TestarConexao;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Inconsist�ncia Desconhecida');
      Close;
    end;
  end;
end;

procedure TfrmAutenticacao.lblEntrarComoConvidadoClick(Sender: TObject);
begin
  CriarSessaoConvidado;
end;

procedure TfrmAutenticacao.Entrar;
var
  lApi: TTheMovieDBApi;
begin
  lApi := TTheMovieDBApi.ObterInstancia;

  try
    if lApi.FazerLoginConta(edtNome.Text, edtSenha.Text) then
    begin
      ModalResult := mrOk;
    end;
  except
    on E: ESenhaIncorreta do
    begin
      Application.MessageBox(PChar(E.Message), 'Aten��o', MB_OK + MB_ICONINFORMATION);
      edtSenha.Focar;
    end;

    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Aten��o', MB_OK + MB_ICONINFORMATION);
      edtNome.Focar;
    end;
  end;
end;

end.
