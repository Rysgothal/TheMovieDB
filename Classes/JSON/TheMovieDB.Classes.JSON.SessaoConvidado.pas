unit TheMovieDB.Classes.JSON.SessaoConvidado;

interface

uses
  System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TTMDBSessaoConvidado = class
  private
    [JSONName('success')]
    FSucesso: Boolean;
    [JSONName('guest_session_id')]
    FSessaoID: string;
    [JSONName('expires_at')]
    FDataExpiracao: string;
  public
    property Sucesso: Boolean read FSucesso write FSucesso;
    property SessaoID: string read FSessaoID write FSessaoID;
    property DataExpiracao: string read FDataExpiracao write FDataExpiracao;
  end;

implementation

end.