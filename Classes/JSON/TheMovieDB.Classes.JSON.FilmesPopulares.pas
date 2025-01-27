unit TheMovieDB.Classes.JSON.FilmesPopulares;

interface

uses
  System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types, System.Classes,
  System.Generics.Collections;

type
  TTMDBFilmePopularInfo = class
  private
    [JSONName('adult')]
    FAdulto: Boolean;
    [JSONName('backdrop_path')]
    FPlanoDeFundo: string;
    [JSONName('genre_ids')]
    FGenerosID: TArray<Integer>;
    [JSONName('id')]
    FID: Integer;
    [JSONName('original_language')]
    FLinguaguemOrigem: string;
    [JSONName('original_title')]
    FTituloOriginal: string;
    [JSONName('overview')]
    FResumo: string;
    [JSONName('popularity')]
    FPopularidade: Double;
    [JSONName('poster_path')]
    FCaminhoPoster: string;
    [JSONName('release_date')]
    FDataLancamento: string;
    [JSONName('title')]
    FTitulo: string;
    [JSONName('video')]
    FVideo: Boolean;
    [JSONName('vote_average')]
    FMediaVoto: Double;
    [JSONName('vote_count')]
    FContagemVoto: Integer;
  public
    destructor Destroy; override;
    property Adulto: Boolean read FAdulto write FAdulto;
    property PlanoDeFundo: string read FPlanoDeFundo write FPlanoDeFundo;
    property ID: Integer read FID write FID;
    property LinguaguemOrigem: string read FLinguaguemOrigem write FLinguaguemOrigem;
    property TituloOriginal: string read FTituloOriginal write FTituloOriginal;
    property Resumo: string read FResumo write FResumo;
    property Popularidade: Double read FPopularidade write FPopularidade;
    property CaminhoPoster: string read FCaminhoPoster write FCaminhoPoster;
    property DataLancamento: string read FDataLancamento write FDataLancamento;
    property Titulo: string read FTitulo write FTitulo;
    property Video: Boolean read FVideo write FVideo;
    property MediaVoto: Double read FMediaVoto write FMediaVoto;
    property ContagemVoto: Integer read FContagemVoto write FContagemVoto;
  end;

  TTMDBFilmesPopulares = class
  private
    [JSONName('page')]
    FPagina: Integer;
    [JSONName('results'), JSONMarshalled(False)]
    FResultado: TArray<TTMDBFilmePopularInfo>;
  public
    destructor Destroy; override;
    property Pagina: Integer read FPagina write FPagina;
    property Resultado: TArray<TTMDBFilmePopularInfo> read FResultado write FResultado;
  end;

implementation

uses
  System.SysUtils;


{ TTMDBFilmesPopulares }

destructor TTMDBFilmesPopulares.Destroy;
begin
  for var lItem in FResultado do
  begin
    FreeAndNil(lItem);
  end;

  FResultado := nil;
  inherited;
end;

{ TTMDBFilmePopularInfo }

destructor TTMDBFilmePopularInfo.Destroy;
begin
  FGenerosID := nil;
  inherited;
end;

end.
