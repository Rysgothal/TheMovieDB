unit TheMovieDB.Classes.JSON.SessaoBase;

interface

uses
  System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TTMDBSessaoBase = class
  private
    [JSONName('success')]
    FSucesso: Boolean;
    [JSONName('expires_at')]
    FDataExpiracao: string;
  public
    property Sucesso: Boolean read FSucesso write FSucesso;
    property DataExpiracao: string read FDataExpiracao write FDataExpiracao;
  end;

implementation

end.
