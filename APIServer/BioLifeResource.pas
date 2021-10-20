unit BioLifeResource;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, EMS.DataSetResource,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  [ResourceName('fishfacts')]
  TFishfactResource1 = class(TDataModule)
    [ResourceName('biolifes')]
    EMSDataSetResource1: TEMSDataSetResource;
    qryBioLife: TFDQuery;
    conFishFact: TFDConnection;
    qryBioLifePhoto: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  published
    [ResourceSuffix('biolifes/{item}/photo/')]
    procedure GetItemPhoto(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TFishfactResource1.DataModuleCreate(Sender: TObject);
begin
  EMSDataSetResource1.AllowedActions := [
    TEMSBaseResource.TAction.List,
    TEMSBaseResource.TAction.Get,
    TEMSBaseResource.TAction.Post,
    TEMSBaseResource.TAction.Put,
    TEMSBaseResource.TAction.Delete];

  EMSDataSetResource1.DataSet := qryBioLife;
  EMSDataSetResource1.KeyFields := 'SPECIES_NO';
  EMSDataSetResource1.ValueFields := 'SPECIES_NO;CATEGORY;COMMON_NAME;SPECIES_NAME;LENGTH;LENGTH_IN;NOTES';
end;

procedure TFishfactResource1.GetItemPhoto(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  item: string;
  Stream: TMemoryStream;
begin
  item := ARequest.Params.Values['item'];
  Stream := TMemoryStream.Create;
  try
    qryBioLifePhoto.Close;
    qryBioLifePhoto.ParamByName('item').AsString := item;
    qryBioLifePhoto.Open;

    if qryBioLifePhoto.RecordCount = 0 then
      AResponse.RaiseNotFound('Not found', '''' + item + ''' is not found');

    TBlobField(qryBioLifePhoto.FieldByName('GRAPHIC')).SaveToStream(Stream);

    if Stream.Size = 0 then
      AResponse.RaiseNotFound('Not found', '''' + item + ''' is not found');

    Stream.Position := 0;
    AResponse.Body.SetStream(Stream, 'image/jpeg', True);
  except
    Stream.Free;
    raise;
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TFishfactResource1));
end;

initialization
  Register;
end.


