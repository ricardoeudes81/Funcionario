unit unMaskEditHelper;

interface

uses
  Vcl.Mask, System.SysUtils;

type

  TMaskEditHelper = class Helper for TMaskEdit
  public
    function EditValue(): string;
    procedure SetEditValue(texto: string);
  end;


implementation

{ TMaskEditHelper }

function TMaskEditHelper.EditValue: string;
begin
  var Mascara := Self.EditMask;
  Self.EditMask := string.Empty;
  Result := Self.Text;
  Self.EditMask := Mascara;
end;

procedure TMaskEditHelper.SetEditValue(texto: string);
begin
  var Mascara := Self.EditMask;
  Self.EditMask := string.Empty;
  Self.Text := texto;
  Self.EditMask := Mascara;

end;

end.
