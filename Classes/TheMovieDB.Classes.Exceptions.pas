unit TheMovieDB.Classes.Exceptions;

interface

uses
  System.SysUtils;

type
  ETokenInvalido = class(Exception);
  ESenhaIncorreta = class(Exception);
  ELoginNaoExiste = class(Exception);
  ELoginVazio = class(Exception);
  ESenhaVazia = class(Exception);
  ENomeVazio = class(Exception);
  ELoginJaExiste = class(Exception);

implementation

end.
