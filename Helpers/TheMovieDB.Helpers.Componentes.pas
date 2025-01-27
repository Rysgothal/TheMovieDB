unit TheMovieDB.Helpers.Componentes;

interface

uses
  Vcl.Controls, Vcl.StdCtrls;

type
  TComponenteHelper = class Helper for TWinControl
  public
    procedure Focar;
  end;

  TCustomEditHelper = class Helper for TCustomEdit
  public
    function IsEmpty: Boolean;
  end;
  
implementation

uses
  System.SysUtils;

{ TComponenteHelper }

procedure TComponenteHelper.Focar;
begin
  if CanFocus then
  begin
    SetFocus;
  end;
end;

{ TCustomEditHelper }

function TCustomEditHelper.IsEmpty: Boolean;
begin
  Result := Trim(Text).IsEmpty;
end;

end.
