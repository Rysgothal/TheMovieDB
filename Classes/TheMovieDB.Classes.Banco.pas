unit TheMovieDB.Classes.Banco;

interface

uses
  IBX.IBDatabase, TheMovieDB.Classes.Configuracao, System.IniFiles;

type
  TDados = class
  private
    FDataBase: TIBDataBase;

    const HASH_SALTING = '#01010q�L5]:01108��rj3Nx�i01W�a$,5&�25Z|&OuSLCMx|K';
    constructor Create;
    class var FDados: TDados;
    procedure ConfigurarBanco;
    procedure LerConfiguracaoINI(const pIni: TINIFile);
    function VerificarExisteConta(const pNome: string): Boolean;
  public
    destructor Destroy; override;
    procedure FazerLogin(const pNome, pSenha: string);
    procedure TestarConexao;
    class function ObterInstancia: TDados;
  end;

implementation

uses
  System.SysUtils, IBX.IBQuery, Vcl.Forms, TheMovieDB.Helpers.DataBase, Data.DB, System.Hash,
  TheMovieDB.Classes.Exceptions, IBX.IB, System.IOUtils;

{ TDados }

procedure TDados.ConfigurarBanco;
var
  lCaminhoIni: string;
  lIni: TIniFile;
begin
  lCaminhoIni := ExtractFilePath(Application.ExeName);
  lIni := TIniFile.Create(TPath.Combine(lCaminhoIni, 'BANCO.INI'));

  try
    if not FileExists(TPath.Combine(lCaminhoIni, 'BANCO.INI')) then
    begin
      lIni.WriteString('DATABASE', 'caminho_banco', TPath.Combine(lCaminhoIni, 'TheMovieDB.IB'));
      lIni.WriteString('DATABASE', 'ip_servidor', '127.0.0.1');
    end;

    LerConfiguracaoINI(lIni);

    FDataBase.Connected := False;
    FDataBase.LoginPrompt := False;
    FDataBase.DatabaseName := TConfiguracao.Servidor + ':' + TConfiguracao.Banco;
    FDataBase.Params.Clear;
    FDataBase.Params.AddPair('user_name', 'SYSDBA');
    FDataBase.Params.AddPair('password', '1652498327');
    FDataBase.Params.AddPair('lc_ctype', 'WIN_1252');
  finally
    FreeAndNil(lIni);
  end;
end;

constructor TDados.Create;
begin
  FDataBase := TIBDatabase.Create(nil);
  ConfigurarBanco;
end;

destructor TDados.Destroy;
begin
  FreeAndNil(FDataBase);
  inherited;
end;

procedure TDados.FazerLogin(const pNome, pSenha: string);
var
  lQuery: TIBQuery;
begin
  try
    lQuery := TIBQuery.Criar(FDataBase);
    lQuery.SQL.Add(' select c.senha from conta c');
    lQuery.SQL.Add(' where c.login = :pLogin');
    lQuery.ParamByName('pLogin').Value := pNome;
    lQuery.Open;
    lQuery.First;

    if not VerificarExisteConta(pNome) then
    begin
      raise ELoginNaoExiste.Create('A conta n�o existe');
    end;

    if lQuery.FieldByName('SENHA').AsString <> THashMD5.GetHashString(pSenha + HASH_SALTING) then
    begin
      raise ESenhaIncorreta.Create('A senha est� incorreta');
    end;
  finally
    FreeAndNil(lQuery);
  end;
end;

procedure TDados.LerConfiguracaoINI(const pIni: TIniFile);
begin
  TConfiguracao.Banco := pIni.ReadString('DATABASE', 'caminho_banco', '');
  TConfiguracao.Servidor := pIni.ReadString('DATABASE', 'ip_servidor', '127.0.0.1');
end;

class function TDados.ObterInstancia: TDados;
begin
  if not Assigned(FDados) then
  begin
    FDados := TDados.Create;
  end;

  Result := FDados;
end;

procedure TDados.TestarConexao;
begin
  FDataBase.Connected := False;
  FDataBase.Connected := True;
end;

function TDados.VerificarExisteConta(const pNome: string): Boolean;
var
  lQuery: TIBQuery;
begin
  try
    lQuery := TIBQuery.Criar(FDataBase);
    lQuery.SQL.Add(' select c.login from conta c');
    lQuery.SQL.Add(' where c.login = :pLogin');
    lQuery.ParamByName('pLogin').Value := pNome;
    lQuery.Open;
    lQuery.First;

    Result := not lQuery.IsEmpty;
  finally
    FreeAndNil(lQuery);
  end;
end;

initialization

finalization
  FreeAndNil(TDados.FDados);

end.