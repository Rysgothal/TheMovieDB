unit TheMovieDB.Classes.TheMovieDBApi;

interface

uses
  System.SysUtils, REST.Client, TheMovieDB.Helpers.TiposAuxiliares,
  TheMovieDB.Classes.JSON.FilmesPopulares, TheMovieDB.Classes.Usuario;

type
  TTheMovieDBApi = class
  private
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FChaveValida: Boolean;
    FUsuario: TUsuario;
    FTipoSessao: TTipoSessao;
    constructor Create;
    class var FTheMovieDBApi: TTheMovieDBApi;

    const THE_MOVIE_DB_API_URL = 'https://api.themoviedb.org/3';
    const THE_MOVIE_DB_API_KEY = 'b3617d826e0f0c422bf57fdb53a0b418';
    const THE_MOVIE_DB_API_ACESS_TOKEN = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMzYxN2Q4MjZlMGYwYzQyMmJmNTdmZGI1M' +
      '2EwYjQxOCIsIm5iZiI6MTcyMjk0NDUxMC4xNDI3MzUsInN1YiI6IjY2NGU4NmEwNDA3YmFlZGY4MGJiMGI5YyIsInNjb3BlcyI6WyJhcGlfc' +
      'mVhZCJdLCJ2ZXJzaW9uIjoxfQ.hxe0z1VkWHVSCo0IBCnWD-IxqpPl0_ug1PYlP2Ccz04';

    procedure Consultar;
  public
    destructor Destroy; override;
    property ChaveValida: Boolean read FChaveValida;
    property Usuario: TUsuario read FUsuario write FUsuario;
    property TipoSessao: TTipoSessao read FTipoSessao write FTipoSessao;
    class function ObterInstancia: TTheMovieDBApi;
    procedure CriarSessaoConvidado;
    function FazerLoginConta(const pLogin, pSenha: string): Boolean;
    function ConsultarFilmesPopulares(const pLinguagem: string = 'en-US'; const pPagina: Integer = 1): TTMDBFilmesPopulares;
  end;

implementation

uses
  REST.Types, Vcl.Dialogs, TheMovieDB.Classes.JSON.SessaoConvidado, REST.JSON, System.JSON,
  TheMovieDB.Classes.Exceptions, TheMovieDB.Helpers.TheMovieDB,
  TheMovieDB.Classes.Banco;

{ TTheMovieDBApi }

procedure TTheMovieDBApi.Consultar;
begin
  FClient.Accept := 'application/json';
  FClient.AddParameter('Authorization', THE_MOVIE_DB_API_ACESS_TOKEN, TRESTRequestParameterKind.pkHTTPHEADER,
    [poDoNotEncode]);

  FRequest.Client := FClient;
  FRequest.Execute;
end;

function TTheMovieDBApi.ConsultarFilmesPopulares(const pLinguagem: string; const pPagina: Integer): TTMDBFilmesPopulares;
var
  lJSON: TJSONValue;
begin
  FClient.BaseURL := THE_MOVIE_DB_API_URL + '/movie/popular?language=' + pLinguagem + '?page=' + pPagina.ToString;
  Consultar;
  lJSON := FRequest.Response.JSONValue;
  Result := TJson.JsonToObject<TTMDBFilmesPopulares>(TJSONObject(lJSON));
end;

constructor TTheMovieDBApi.Create;
begin
  FClient := TRESTClient.Create(THE_MOVIE_DB_API_URL + '/authentication');
  FRequest := TRESTRequest.Create(FClient);

  FUsuario := nil;
  FTipoSessao := tsNenhum;
  FTheMovieDBApi := nil;

  Consultar;
  FChaveValida := FRequest.StatusOK;

  if not FChaveValida then
  begin
    raise ETokenInvalido.Create('Chave inválida');
  end;
end;

procedure TTheMovieDBApi.CriarSessaoConvidado;
var
  lSessaoConvidado: TTMDBSessaoConvidado;
  lCodigoConta: Integer;
  lDados: TDados;
  lJSON: TJSONValue;
begin
  lDados := TDados.ObterInstancia;

  try
    TipoSessao := tsNenhum;
    FClient.BaseURL := THE_MOVIE_DB_API_URL + '/authentication/guest_session/new';
    Consultar;
    lJSON := FRequest.Response.JSONValue;

    lSessaoConvidado := TJson.JsonToObject<TTMDBSessaoConvidado>(TJSONObject(lJSON));
    lCodigoConta := lDados.CriarContaConvidado(lSessaoConvidado);
    FUsuario := TUsuario.ObterInstancia(lCodigoConta);
    TipoSessao := tsConvidado;
  finally
    FreeAndNil(lSessaoConvidado);
  end;
end;

destructor TTheMovieDBApi.Destroy;
begin
  FreeAndNil(FRequest);
  FreeAndNil(FClient);
  inherited;
end;

function TTheMovieDBApi.FazerLoginConta(const pLogin, pSenha: string): Boolean;
var
  lDados: TDados;
begin
  lDados := TDados.ObterInstancia;
  TipoSessao := tsNenhum;
  Result := False;

  if pLogin.Trim.IsEmpty then
  begin
    raise ELoginVazio.Create('O login está vazio');
  end;

  if pSenha.IsEmpty then
  begin
    raise ESenhaVazia.Create('A senha está vazia');
  end;

  FUsuario := TUsuario.ObterInstancia(lDados.FazerLogin(pLogin, pSenha));

  if Assigned(FUsuario) then
  begin
    TipoSessao := tsConta;
    Result := True;
  end;
end;

class function TTheMovieDBApi.ObterInstancia: TTheMovieDBApi;
begin
  if FTheMovieDBApi = nil then
  begin
    FTheMovieDBApi := TTheMovieDBApi.Create;
  end;

  Result := FTheMovieDBApi;
end;

initialization

finalization
  FreeAndNil(TTheMovieDBApi.FTheMovieDBApi);

end.
