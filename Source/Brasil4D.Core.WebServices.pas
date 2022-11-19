unit Brasil4D.Core.WebServices;

interface

uses
  Brasil4D.Core.Constants,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DCoreWebServices = class
  protected
    FRequest: TBrasil4DRestRequestBase;
    FResponse: TBrasil4DRestResponseBase;
    FBaseUrl: string;
    FResource: string;

    procedure EnviarRequest;
    procedure ValidarArgumento(ALabel, AValue: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property BaseUrl: string read FBaseUrl write FBaseUrl;
  end;

implementation

{ TBrasil4DCoreWebServices }

constructor TBrasil4DCoreWebServices.Create;
begin
  FBaseUrl := BASE_URL;
  FRequest := TBrasil4DRestRequestClient.Create;
end;

destructor TBrasil4DCoreWebServices.Destroy;
begin
  FreeAndNil(FRequest);
  inherited;
end;

procedure TBrasil4DCoreWebServices.EnviarRequest;
begin
  FResponse := FRequest.Send;
end;

procedure TBrasil4DCoreWebServices.ValidarArgumento(ALabel, AValue: string);
begin
  if AValue.Trim.IsEmpty then
    raise EArgumentException.CreateFmt('Informe o par�metro %s.', [ALabel]);
end;

end.
