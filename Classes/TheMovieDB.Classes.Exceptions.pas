unit TheMovieDB.Classes.Exceptions;

interface

uses
  System.SysUtils;

type
  ETokenInvalido = class(Exception);
  ESenhaIncorreta = class(Exception);
  ELoginNaoExiste = class(Exception);

implementation

end.
