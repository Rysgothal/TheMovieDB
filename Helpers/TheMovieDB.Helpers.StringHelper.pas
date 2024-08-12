unit TheMovieDB.Helpers.StringHelper;

interface


type
  TStringHelper = class abstract
  public
    class function GerarStringAleatoria(pTamanho: Word = 32): string;
  end;

implementation

uses
  System.SysUtils, System.Hash;

{ TStringHelper }

class function TStringHelper.GerarStringAleatoria(pTamanho: Word): string;
begin
  Result := THash.GetRandomString(pTamanho);
end;

end.
