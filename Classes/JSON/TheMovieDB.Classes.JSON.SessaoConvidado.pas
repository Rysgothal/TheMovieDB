unit TheMovieDB.Classes.JSON.SessaoConvidado;

interface

uses
  System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types,
  TheMovieDB.Classes.JSON.SessaoBase;

type
  TTMDBSessaoConvidado = class(TTMDBSessaoBase)
  private
    [JSONName('guest_session_id')]
    FSessaoID: string;
  public
    property SessaoID: string read FSessaoID write FSessaoID;
  end;

implementation

end.
