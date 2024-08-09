unit TheMovieDB.Helpers.TheMovieDB;

interface

uses
  REST.Client;

type
  THelperRequest = class Helper for TRESTRequest
    function StatusOK: Boolean;
  end;

implementation

{ THelperRequest }

function THelperRequest.StatusOK: Boolean;
begin
  if Response = nil then
  begin
    Exit(False);
  end;

  Result := (Response.StatusCode >= 200) and (Response.StatusCode <= 299);
end;

end.
