unit TheMovieDB.Forms.Principal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Vcl.VirtualImage,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.DBCtrls, Vcl.WinXCtrls;

type
  TfrmPrincipal = class(TForm)
    sbxPopulares: TScrollBox;
    ImageCollection1: TImageCollection;
    Panel20: TPanel;
    VirtualImage20: TVirtualImage;
    Panel19: TPanel;
    VirtualImage19: TVirtualImage;
    Panel18: TPanel;
    VirtualImage18: TVirtualImage;
    Panel17: TPanel;
    VirtualImage17: TVirtualImage;
    Panel16: TPanel;
    VirtualImage16: TVirtualImage;
    Panel15: TPanel;
    VirtualImage15: TVirtualImage;
    Panel14: TPanel;
    VirtualImage14: TVirtualImage;
    Panel13: TPanel;
    VirtualImage13: TVirtualImage;
    Panel12: TPanel;
    VirtualImage12: TVirtualImage;
    Panel11: TPanel;
    VirtualImage11: TVirtualImage;
    Panel10: TPanel;
    VirtualImage10: TVirtualImage;
    Panel9: TPanel;
    VirtualImage9: TVirtualImage;
    Panel8: TPanel;
    VirtualImage8: TVirtualImage;
    Panel7: TPanel;
    VirtualImage7: TVirtualImage;
    Panel6: TPanel;
    VirtualImage6: TVirtualImage;
    Panel5: TPanel;
    VirtualImage5: TVirtualImage;
    Panel4: TPanel;
    VirtualImage4: TVirtualImage;
    Panel3: TPanel;
    VirtualImage3: TVirtualImage;
    Panel2: TPanel;
    VirtualImage2: TVirtualImage;
    Panel1: TPanel;
    VirtualImage1: TVirtualImage;
    btnMaisPopulares: TButton;
    pnlCarregandoFilmesPopulares: TPanel;
    LoadingFilmesPopular: TActivityIndicator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarFilmesPopulares;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.Net.HttpClient, TheMovieDB.Classes.TheMovieDBApi,
  TheMovieDB.Classes.JSON.FilmesPopulares, TheMovieDB.Classes.Thread;


{$R *.dfm}

procedure TfrmPrincipal.CarregarFilmesPopulares;
var
  lThread: TThreadCarregarPoster;
begin
  lThread := TThreadCarregarPoster.Create;
  lThread.Start;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarFilmesPopulares;
end;

end.
