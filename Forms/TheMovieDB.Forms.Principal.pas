unit TheMovieDB.Forms.Principal;

interface

uses
  Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics, TheMovieDB.Classes.Thread,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Vcl.VirtualImage,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.DBCtrls, Vcl.WinXCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    sbxPopulares: TScrollBox;
    btnMaisPopulares: TButton;
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
    shpHoras: TShape;
    lblHorasExpiracao: TLabel;
    tmrTempoExpiracao: TTimer;
    btnCriarConta: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure tmrTempoExpiracaoTimer(Sender: TObject);
    procedure btnCriarContaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CarregarFilmesPopulares;
    procedure CarregarMiniPerfil;
    procedure CarregarMiniPerfilConvidado;
    procedure CarregarMiniPerfilConta;
    procedure CriarConta;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.Net.HttpClient, TheMovieDB.Classes.TheMovieDBApi, System.DateUtils,
  TheMovieDB.Classes.JSON.FilmesPopulares,
  TheMovieDB.Helpers.TiposAuxiliares, System.SysUtils,
  TheMovieDB.Forms.Cadastro;


{$R *.dfm}

procedure TfrmPrincipal.btnCriarContaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TfrmPrincipal.CarregarFilmesPopulares;
var
  lThreadCarregarPoster: TThreadCarregarPoster;
begin
  lThreadCarregarPoster := TThreadCarregarPoster.ObterInstancia;
  lThreadCarregarPoster.Start;
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

procedure TfrmPrincipal.CriarConta;
begin
  if not Assigned(frmCadastro) then
  begin
    frmCadastro := TfrmCadastro.Create(Self);
  end;

  frmCadastro.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lThreadCarregarPoster: TThreadCarregarPoster;
begin
  lThreadCarregarPoster := TThreadCarregarPoster.ObterInstancia;
  lThreadCarregarPoster.Cancelar := True;

  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarMiniPerfil;
  CarregarFilmesPopulares;
  tmrTempoExpiracao.Enabled := True;
end;

procedure TfrmPrincipal.tmrTempoExpiracaoTimer(Sender: TObject);
var
  lApi: TTheMovieDBApi;
begin
  lApi := TTheMovieDBApi.ObterInstancia;
  lblHorasExpiracao.Caption := FormatDateTime('hh:mm:ss', lApi.Usuario.DataExpiracao - Now);
end;

end.
