unit TheMovieDB.Classes.Thread;

interface

uses
  System.Classes, Vcl.Forms, TheMovieDB.DataModule.Principal;

type
  TThreadCarregarPoster = class(TThread)
  private
    FCancelar: Boolean;
    class var FThread: TThreadCarregarPoster;
    procedure CarregarPosterFilme(pCaminho: string);
    constructor Create; reintroduce;
  protected
    procedure Execute; override;
  public
    class function ObterInstancia: TThreadCarregarPoster;
    property Cancelar: Boolean read FCancelar write FCancelar;
  end;

implementation

uses
  System.Net.HttpClient, TheMovieDB.Forms.Principal, System.SysUtils, Vcl.WinXCtrls, Vcl.VirtualImage,
  TheMovieDB.Classes.TheMovieDBApi, TheMovieDB.Classes.JSON.FilmesPopulares;

{ TThreadCarregarPoster }

constructor TThreadCarregarPoster.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FCancelar := False;
end;

procedure TThreadCarregarPoster.Execute;
var
  lApi: TTheMovieDBApi;
  lFilmesPopulares: TTMDBFilmesPopulares;
  lLoading: TActivityIndicator;
begin
  lApi := TTheMovieDBApi.ObterInstancia;
  lFilmesPopulares := lApi.ConsultarFilmesPopulares;

  try
    for var I := 0 to Length(lFilmesPopulares.Resultado) - 1 do
    begin
      CarregarPosterFilme(lFilmesPopulares.Resultado[I].CaminhoPoster);

      if Cancelar then
      begin
        Exit;
      end;

      TVirtualImage(frmPrincipal.FindComponent('VirtualImage' + Succ(I).ToString)).ImageIndex := I;
      lLoading := TActivityIndicator(frmPrincipal.FindComponent('ActivityIndicator' + Succ(I).ToString));
      lLoading.Animate := False;
      lLoading.Visible := False;
    end;
  finally
    FreeAndNil(lFilmesPopulares);
    DoTerminate;
  end;
end;

class function TThreadCarregarPoster.ObterInstancia: TThreadCarregarPoster;
begin
  if not Assigned(FThread) then
  begin
    FThread := TThreadCarregarPoster.Create;
  end;

  Result := TThreadCarregarPoster.FThread;
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

    if Cancelar then
    begin
      Exit;
    end;

    TThread.Synchronize(nil, procedure
    begin
      dtmPrincipal.imcPostersPopulares.Add(pCaminho, lMS);
    end);
  finally
    FreeAndNil(lHttpClient);
    FreeAndNil(lMS);
  end;
end;


end.
