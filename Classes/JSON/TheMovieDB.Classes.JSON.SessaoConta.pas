unit TheMovieDB.Classes.JSON.SessaoConta;

interface

uses
  System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TTMDBSessaoConta = class
  private
    [JSONName('request_token')]
    FSessaoID: string;
  public
    property SessaoID: string read FSessaoID write FSessaoID;
  end;

implementation

end.
