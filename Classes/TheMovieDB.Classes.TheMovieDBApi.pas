unit TheMovieDB.Classes.TheMovieDBApi;

interface

uses
  System.SysUtils, REST.Client, TheMovieDB.Helpers.TiposAuxiliares,
  TheMovieDB.Classes.JSON.FilmesPopulares, TheMovieDB.Classes.Usuario,
  TheMovieDB.Classes.Constantes;

type
  TTheMovieDBApi = class
  private
    FURL: TTheMovieDBApiURL;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FChaveValida: Boolean;
    FUsuario: TUsuario;
    FTipoSessao: TTipoSessao;
    constructor Create;
    class var FTheMovieDBApi: TTheMovieDBApi;
    function SolicitarToken: string;
    procedure AutenticarToken(const pToken: string);
  public
    destructor Destroy; override;
    property ChaveValida: Boolean read FChaveValida;
    property Usuario: TUsuario read FUsuario write FUsuario;
    property TipoSessao: TTipoSessao read FTipoSessao write FTipoSessao;
    property URL: TTheMovieDBApiURL read FURL;
    class function ObterInstancia: TTheMovieDBApi;
    procedure CriarSessaoConvidado;
    procedure CriarConta(const pNome, pLogin, pSenha: string);
    function FazerLoginConta(const pLogin, pSenha: string): Boolean;
    function ConsultarFilmesPopulares(const pLinguagem: string = 'en-US'; const pPagina: Integer = 1): TTMDBFilmesPopulares;
  end;

implementation

uses
  REST.Types, TheMovieDB.Classes.JSON.SessaoConvidado, REST.JSON, System.JSON,
  TheMovieDB.Classes.Exceptions, TheMovieDB.Helpers.TheMovieDB,
//  System.Net.HttpClient, Soap.SOAPHTTPTrans,
//  FMX.WebBrowser,
  SHDocVw,
  ActiveX, MSHTML,
  TheMovieDB.Classes.Banco, TheMovieDB.Classes.JSON.SessaoConta,
  System.Classes, Vcl.Forms;

{ TTheMovieDBApi }

procedure TTheMovieDBApi.AutenticarToken(const pToken: string);
//var
//  lNavegador: TWebBrowser;
//  doc: OleVariant;
//  element: variant;
//  LStream: TStringStream;
//  Stream : IStream;
//  LPersistStreamInit : IPersistStreamInit;
//  lHTML: HTML;
begin                                      //username e password e login_button
//  lNavegador := TWebBrowser.Create(nil);
//  lNavegador.Navigate(FURL.URL_LOGIN);

//  repeat Application.ProcessMessages until lNavegador.Busy;

//  doc := lNavegador.OleObject.Document as IHTMLDocument2;
//  doc := lNavegador.OleObject.Document.getElementsByTagName('username')
//  .setAttribute('attribute', 'rysgothal');

//  lNavegador.OleObject.Document.getElementsByTagName('password').setAttribute('attribute', '181370Lu');

//  doc := coHTMLDocument.Create as IHTMLDocument2;
//  doc.write(html);
//  doc.Close;
//  ...
//  element := doc.getElementById('elementId');
//  ...
//  element.getAttribute('value', 0);

//  .All.Tags('input').item('username').Text := 'rysgothal';

//  lNavegador..Document.All.Tags('input').item('meucampo').text;



  //  FClient.ContentType := 'application/json';
//  FClient.Authenticator.Authenticate();

//  FClient.BaseURL := FURL.URL_AUTENTICAR_TOKEN + pToken + '/allow' + FURL.API_KEY;
//  FRequest.Execute;
//  FRequest.Response.JSONValue;
end;

function TTheMovieDBApi.ConsultarFilmesPopulares(const pLinguagem: string; const pPagina: Integer): TTMDBFilmesPopulares;
var
  lJSON: TJSONValue;
begin
  FClient.BaseURL := FURL.URL_BASE + '/movie/popular?language=' + pLinguagem + '?page=' + pPagina.ToString;
  FRequest.Execute;
  lJSON := FRequest.Response.JSONValue;
  Result := TJson.JsonToObject<TTMDBFilmesPopulares>(TJSONObject(lJSON));
end;

constructor TTheMovieDBApi.Create;
begin
  FClient := TRESTClient.Create(FURL.URL_BASE + '/authentication');
  FClient.Accept := 'application/json';

  FRequest := TRESTRequest.Create(FClient);
  FRequest.AddAuthParameter('Authorization', FURL.API_ACESS_TOKEN, TRESTRequestParameterKind.pkHTTPHEADER,
    [poDoNotEncode]);

  FUsuario := nil;
  FTipoSessao := tsNenhum;
  FTheMovieDBApi := nil;

  FRequest.Execute;
  FChaveValida := FRequest.StatusOK;

  if not FChaveValida then
  begin
    raise ETokenInvalido.Create('Chave inválida');
  end;
end;

procedure TTheMovieDBApi.CriarConta(const pNome: string; const pLogin: string; const pSenha: string);
var
  lDados: TDados;
  lToken: string;
begin
  if pNome.Trim.IsEmpty then
  begin
    raise ENomeVazio.Create('O nome não foi preenchido');
  end;

  if pLogin.Trim.IsEmpty then
  begin
    raise ELoginVazio.Create('O login não foi preenchido');
  end;

  if pSenha.IsEmpty then
  begin
    raise ESenhaVazia.Create('A senha não pode ser vazia');
  end;

  lDados := TDados.ObterInstancia;

  if lDados.VerificarExisteConta(pLogin) then
  begin
    raise ELoginJaExiste.Create('Esse login já foi cadastrado, tente outro');
  end;

  lToken := SolicitarToken;
  AutenticarToken(lToken);
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
    FClient.BaseURL := FURL.URL_BASE + '/authentication/guest_session/new';
    FRequest.Execute;
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

function TTheMovieDBApi.SolicitarToken: string;
var
  lJSON: TJSONValue;
  lSessaoConta: TTMDBSessaoConta;
begin
  FClient.BaseURL := FURL.URL_BASE + '/authentication/token/new';
  FRequest.Execute;
  lJSON := FRequest.Response.JSONValue;
  lSessaoConta := TJson.JsonToObject<TTMDBSessaoConta>(TJSONObject(lJSON));

  try
    Result := lSessaoConta.SessaoID;
  finally
    FreeAndNil(lSessaoConta);
  end;
end;

initialization

finalization
  FreeAndNil(TTheMovieDBApi.FTheMovieDBApi);

end.
