unit TheMovieDB.Forms.Principal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Vcl.VirtualImage,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.DBCtrls, Vcl.WinXCtrls;

type
  TfrmPrincipal = class(TForm)
    sbxPopulares: TScrollBox;
    btnMaisPopulares: TButton;
    ImageCollection1: TImageCollection;
    VirtualImage19: TVirtualImage;
    VirtualImage20: TVirtualImage;
    VirtualImage18: TVirtualImage;
    VirtualImage17: TVirtualImage;
    VirtualImage16: TVirtualImage;
    VirtualImage15: TVirtualImage;
    VirtualImage14: TVirtualImage;
    VirtualImage13: TVirtualImage;
    VirtualImage12: TVirtualImage;
    VirtualImage11: TVirtualImage;
    VirtualImage10: TVirtualImage;
    VirtualImage9: TVirtualImage;
    VirtualImage8: TVirtualImage;
    VirtualImage7: TVirtualImage;
    VirtualImage6: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage1: TVirtualImage;
    Panel20: TPanel;
    Panel19: TPanel;
    Panel18: TPanel;
    Panel17: TPanel;
    Panel16: TPanel;
    Panel15: TPanel;
    Panel14: TPanel;
    Panel13: TPanel;
    Panel12: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    ActivityIndicator1: TActivityIndicator;
    ActivityIndicator2: TActivityIndicator;
    ActivityIndicator3: TActivityIndicator;
    ActivityIndicator4: TActivityIndicator;
    ActivityIndicator5: TActivityIndicator;
    ActivityIndicator6: TActivityIndicator;
    ActivityIndicator7: TActivityIndicator;
    ActivityIndicator8: TActivityIndicator;
    ActivityIndicator9: TActivityIndicator;
    ActivityIndicator10: TActivityIndicator;
    ActivityIndicator11: TActivityIndicator;
    ActivityIndicator12: TActivityIndicator;
    ActivityIndicator13: TActivityIndicator;
    ActivityIndicator14: TActivityIndicator;
    ActivityIndicator15: TActivityIndicator;
    ActivityIndicator16: TActivityIndicator;
    ActivityIndicator17: TActivityIndicator;
    ActivityIndicator18: TActivityIndicator;
    ActivityIndicator19: TActivityIndicator;
    ActivityIndicator20: TActivityIndicator;
    shpContaBase: TShape;
    shpContaDados: TShape;
    shpImagemConta: TShape;
    shpDetalhe: TShape;
    lblBemVindo: TLabel;
    lblNome: TLabel;
    shpFilmesPopulares: TShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarFilmesPopulares;
    procedure CarregarMiniPerfil;
    procedure CarregarMiniPerfilConvidado;
    procedure CarregarMiniPerfilConta;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.Net.HttpClient, TheMovieDB.Classes.TheMovieDBApi,
  TheMovieDB.Classes.JSON.FilmesPopulares, TheMovieDB.Classes.Thread,
  TheMovieDB.Helpers.TiposAuxiliares;


{$R *.dfm}

procedure TfrmPrincipal.CarregarFilmesPopulares;
var
  lThread: TThreadCarregarPoster;
begin
  lThread := TThreadCarregarPoster.Create;
  lThread.Start;
end;

procedure TfrmPrincipal.CarregarMiniPerfil;
var
  lApi: TTheMovieDBApi;
begin
  lApi := TTheMovieDBApi.ObterInstancia;

  if lApi.TipoSessao = tsNenhum then
  begin
    Application.MessageBox('A sua sessão não foi reconhecida, entre novamente.', 'Atenção');
    Application.Terminate;
  end;

  case lAPi.TipoSessao of
    tsConvidado: CarregarMiniPerfilConvidado;
    tsConta: CarregarMiniPerfilConta;
  end;
end;

procedure TfrmPrincipal.CarregarMiniPerfilConta;
begin

end;

procedure TfrmPrincipal.CarregarMiniPerfilConvidado;
var
  lApi: TTheMovieDBApi;
begin
  lAPi := TTheMovieDBApi.ObterInstancia;

  lblNome.Caption := lApi.Usuario.Nome;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarMiniPerfil;
  CarregarFilmesPopulares;
end;

end.
