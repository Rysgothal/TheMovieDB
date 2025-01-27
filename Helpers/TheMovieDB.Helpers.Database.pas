unit TheMovieDB.Helpers.Database;

interface

uses
  IBX.IBQuery, IBX.IBDatabase;

type
  TIBQueryHelper = class helper for TIBQuery
  public
    constructor Criar(pBanco: TIBDatabase; pTransacao: TIBTransaction = nil); overload;
  end;

implementation

{ THelperQuery }

constructor TIBQueryHelper.Criar(pBanco: TIBDatabase; pTransacao: TIBTransaction = nil);
begin
  if not Assigned(pBanco) then
  begin
    Exit;
  end;

  if not Assigned(pTransacao) then
  begin
    pTransacao := TIBTransaction.Create(pBanco, ibtrReadCommitted);
  end;

  pTransacao.DefaultDatabase := pBanco;
  inherited Create(pTransacao);
  Close;
  SQL.Clear;
end;

end.
