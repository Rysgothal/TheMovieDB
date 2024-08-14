unit TheMovieDB.DataModule.Principal;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.Controls;

type
  TdtmPrincipal = class(TDataModule)
    imcLogos: TImageCollection;
    imcPostersPopulares: TImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
