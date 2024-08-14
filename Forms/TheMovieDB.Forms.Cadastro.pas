unit TheMovieDB.Forms.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.VirtualImage;

type
  TfrmCadastro = class(TForm)
    gbxNovoUsuario: TGroupBox;
    edtLogin: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnCriarConta: TButton;
    edtNome: TLabeledEdit;
    pnlLogo: TPanel;
    vtiLogo: TVirtualImage;
    shpLinhaEnvolta: TShape;
    procedure btnCriarContaClick(Sender: TObject);
  private
    procedure CriarConta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses
  TheMovieDB.Classes.TheMovieDBApi;

{$R *.dfm}

{ TfrmCadastro }

procedure TfrmCadastro.btnCriarContaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TfrmCadastro.CriarConta;
var
  lApi: TTheMovieDBApi;
begin
  lApi := TTheMovieDBApi.ObterInstancia;

  try
    lAPi.CriarConta(edtNome.Text, edtNome.Text, edtSenha.Text);
    Application.MessageBox('Conta criada com sucesso!', 'Sucesso');
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção');
    end;
  end;
end;

end.
