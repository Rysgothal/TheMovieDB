unit TheMovieDB.Forms.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.VirtualImage;

type
  TForm1 = class(TForm)
    gbxNovoUsuario: TGroupBox;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnSair: TButton;
    btnLogin: TButton;
    lblNome: TLabeledEdit;
    VirtualImage1: TVirtualImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
