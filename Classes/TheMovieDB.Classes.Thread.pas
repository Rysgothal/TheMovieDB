unit TheMovieDB.Classes.Thread;

interface

uses
  System.Classes;

type
  TThreadCarregarPoster = class(TThread)
  private
    procedure CarregarPosterFilme(pCaminho: string);
  protected
    procedure Execute; override;
  public
    constructor Create;
  end;

implementation

uses
  System.Net.HttpClient, TheMovieDB.Forms.Principal, System.SysUtils, Vcl.VirtualImage,
  TheMovieDB.Classes.TheMovieDBApi, TheMovieDB.Classes.JSON.FilmesPopulares;

{ TThreadCarregarPoster }

constructor TThreadCarregarPoster.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TThreadCarregarPoster.Execute;
var
  lApi: TTheMovieDBApi;
  lFilmesPopulares: TTMDBFilmesPopulares;
begin
  lApi := TTheMovieDBApi.ObterInstancia;
  lFilmesPopulares := lApi.ConsultarFilmesPopulares;

  try
    for var I := 0 to Length(lFilmesPopulares.Resultado) - 1 do
    begin
      CarregarPosterFilme(lFilmesPopulares.Resultado[I].CaminhoPoster);
      TVirtualImage(frmPrincipal.FindComponent('VirtualImage' + Succ(I).ToString)).ImageIndex := I;
    end;

    frmPrincipal.LoadingFilmesPopular.Animate := False;
    frmPrincipal.pnlCarregandoFilmesPopulares.Visible := False;
  finally
    FreeAndNil(lFilmesPopulares);
  end;
end;

procedure TThreadCarregarPoster.CarregarPosterFilme(pCaminho: string);
var
  lHttpClient: THTTPClient;
  lMS: TMemoryStream;
begin
  lMS := TMemoryStream.Create;
  lHttpClient := THTTPClient.Create;

  try
    lHttpClient.Get('https://image.tmdb.org/t/p/w500/' + pCaminho, lMS);

    TThread.Synchronize(nil, procedure
    begin
      frmPrincipal.ImageCollection1.Add(pCaminho, lMS);
    end);
  finally
    FreeAndNil(lHttpClient);
    FreeAndNil(lMS);
  end;
end;


end.