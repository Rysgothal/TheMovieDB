unit TheMovieDB.Classes.Configuracao;

interface

type
  TConfiguracao = class abstract
    class var Banco: string;
    class var Servidor: string;
    class var Porta: string;
    class var Usuario: string;
    class var Senha: string;
  end;

implementation

end.

