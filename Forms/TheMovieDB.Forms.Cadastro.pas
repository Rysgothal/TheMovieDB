unit TheMovieDB.Forms.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.VirtualImage;

type
  TfrmCadastro = class(TForm)
    gbxNovoUsuario: TGroupBox;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnSair: TButton;
    btnLogin: TButton;
    lblNome: TLabeledEdit;
    pnlLogo: TPanel;
    vtiLogo: TVirtualImage;
    shpLinhaEnvolta: TShape;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

end.
