program TheMovieDB;

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  TheMovieDB.Forms.Autenticacao in 'Forms\TheMovieDB.Forms.Autenticacao.pas' {frmAutenticacao},
  TheMovieDB.Forms.Principal in 'Forms\TheMovieDB.Forms.Principal.pas' {frmPrincipal},
  TheMovieDB.Classes.Banco in 'Classes\TheMovieDB.Classes.Banco.pas',
  TheMovieDB.Classes.Configuracao in 'Classes\TheMovieDB.Classes.Configuracao.pas',
  TheMovieDB.Classes.Exceptions in 'Classes\TheMovieDB.Classes.Exceptions.pas',
  TheMovieDB.Classes.TheMovieDBApi in 'Classes\TheMovieDB.Classes.TheMovieDBApi.pas',
  TheMovieDB.Helpers.TheMovieDB in 'Helpers\TheMovieDB.Helpers.TheMovieDB.pas',
  TheMovieDB.Helpers.Database in 'Helpers\TheMovieDB.Helpers.Database.pas',
  TheMovieDB.Helpers.Componentes in 'Helpers\TheMovieDB.Helpers.Componentes.pas',
  TheMovieDB.Helpers.TiposAuxiliares in 'Helpers\TheMovieDB.Helpers.TiposAuxiliares.pas',
  TheMovieDB.Classes.JSON.SessaoConvidado in 'Classes\JSON\TheMovieDB.Classes.JSON.SessaoConvidado.pas',
  TheMovieDB.Classes.JSON.FilmesPopulares in 'Classes\JSON\TheMovieDB.Classes.JSON.FilmesPopulares.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TfrmAutenticacao, frmAutenticacao);
  Application.MainFormOnTaskbar := True;

  if frmAutenticacao.ShowModal <> mrOk then
  begin
    Application.Terminate;
  end;

  FreeAndNil(frmAutenticacao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
