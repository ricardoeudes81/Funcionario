unit Entidade.Entidade;

interface

uses
  System.Classes, SimpleAttributes;

type

  TEntidade = class(TPersistent)
  private
    FId: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    [Campo('ID'), PK, NotNull]
    property Id: Integer read FId write FId;
  end;

implementation

{ TEntidade }

constructor TEntidade.Create;
begin
  inherited;
end;

destructor TEntidade.Destroy;
begin

  inherited;
end;

end.
