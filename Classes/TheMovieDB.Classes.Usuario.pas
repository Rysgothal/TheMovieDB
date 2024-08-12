unit TheMovieDB.Classes.Usuario;

interface

type
  TUsuario = class
  private
    FCodigo: Integer;
    FNome: string;
    FSessao: string;
    constructor Create(const pID: Integer);
    class var FUsuario: TUsuario;
  public
    class function ObterInstancia(const pID: Integer): TUsuario;
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Sessao: string read FSessao write FSessao;
  end;

implementation

uses
  System.SysUtils, IBX.IBQuery, TheMovieDB.Classes.Banco;

{ TUsuario }

constructor TUsuario.Create(const pID: Integer);
var
  lQuery: TIBQuery;
  lDados: TDados;
begin
  lDados := TDados.ObterInstancia;
  lQuery := lDados.CriarQuery;

  try
    lQuery.SQL.Add('select C.CODIGO, C.NOME, C.SESSAO from conta c where c.codigo = :pID');
    lQuery.Open;

    FCodigo := lQuery.FieldByName('codigo').AsInteger;
    FNome := lQuery.FieldByName('nome').AsString;
    FSessao := lQuery.FieldByName('sessao').AsString;
  finally
    FreeAndNil(lQuery);
  end;
end;

class function TUsuario.ObterInstancia(const pID: Integer): TUsuario;
begin
  if not Assigned(FUsuario) then
  begin
    FUsuario := TUsuario.Create(pID);
  end;

  Result := TUsuario.FUsuario;
end;

initialization

finalization
  FreeAndNil(TUsuario.FUsuario);

end.
