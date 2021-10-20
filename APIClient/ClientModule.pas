unit ClientModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.StorageBin, REST.Types,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TdmDatabase = class(TDataModule)
    qryBioLife: TFDQuery;
    conFishFact: TFDConnection;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    FDMemTable1SPECIES_NO: TFloatField;
    FDMemTable1CATEGORY: TWideStringField;
    FDMemTable1COMMON_NAME: TWideStringField;
    FDMemTable1SPECIES_NAME: TWideStringField;
    FDMemTable1LENGTH: TFloatField;
    FDMemTable1LENGTH_IN: TFloatField;
    FDMemTable1NOTES: TWideStringField;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTRequestDataSetAdapter1: TRESTRequestDataSetAdapter;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateData;
    procedure UpdateData;
  public
    { Public declarations }
    procedure SaveData;
    procedure DeleteData;

    procedure LoadImage(LoadProc: TProc<TMemoryStream>);
  end;

var
  dmDatabase: TdmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//uses
//  Data.DBJson;

procedure TdmDatabase.CreateData;
var
  Item: string;
begin
  Item := FDMemTable1.FieldByName('species_no').AsString;

  RESTRequest2.Method := rmPOST;
  RESTRequest2.Resource := 'biolifes/';
  RESTRequest2.Params.Clear;
  RESTRequest2.Params.AddItem('species_no', Item);

  RESTRequestDataSetAdapter1.Request := RESTRequest2; // JSON 데이터 자동 생성

  RESTRequest2.Execute;
end;

procedure TdmDatabase.UpdateData;
var
  Item: string;
begin
  Item := FDMemTable1.FieldByName('species_no').AsString;

  RESTRequest2.Method := rmPUT;
  RESTRequest2.Resource := 'biolifes/{item}';
  RESTRequest2.Params.ParameterByName('item').Value := Item;

  RESTRequestDataSetAdapter1.Request := RESTRequest2;

  RESTRequest2.Execute;
end;

procedure TdmDatabase.DeleteData;
var
  Item: string;
begin
  Item := FDMemTable1.FieldByName('species_no').AsString;

  RESTRequest2.Method := rmDelete;
  RESTRequest2.Resource := 'biolifes/{item}';
  RESTRequest2.Params.ParameterByName('item').Value := Item;

  RESTRequestDataSetAdapter1.Request := nil;

  RESTRequest2.Execute;

  FDMemTable1.Delete;
end;

procedure TdmDatabase.LoadImage(LoadProc: TProc<TMemoryStream>);
var
  Item: string;
  Stream: TMemoryStream;
begin
  Item := FDMemTable1.FieldByName('species_no').AsString;

  RESTRequest3.Method := rmGET;
  RESTRequest3.Resource := 'biolifes/{item}/photo/';
  RESTRequest3.Params.ParameterByName('item').Value := Item;

{
  RESTRequest3.Execute;
  if RESTResponse3.StatusCode = 404 then
    Exit;

  Stream := TMemoryStream.Create;
  try
    Stream.WriteData(RESTResponse3.RawBytes, RESTResponse3.ContentLength);
    LoadProc(Stream);
  finally
    Stream.Free;
  end;
}
  RESTRequest3.ExecuteAsync(procedure
    begin
      if RESTResponse3.StatusCode = 404 then
      begin
        LoadProc(nil);
        Exit;
      end;

      Stream := TMemoryStream.Create;
      try
        Stream.WriteData(RESTResponse3.RawBytes, RESTResponse3.ContentLength);
        LoadProc(Stream);
      finally
        Stream.Free;
      end;
    end);
end;

procedure TdmDatabase.SaveData;
begin
  if FDMemTable1.State = dsInsert then
    CreateData
  else if FDMemTable1.State = dsEdit then
    UpdateData
  else
    Exit;

  FDMemTable1.Post;
end;

procedure TdmDatabase.DataModuleCreate(Sender: TObject);
begin
//  RESTClient1.ContentType := 'application/json';

  // Json타입을 문자열로 처리
//  RESTResponseDataSetAdapter1.TypesMode := TJSONTypesMode.StringOnly;

  // Get List
  RESTRequest1.Execute;

  // 현재 선택된 레코드 대상
//  RESTRequestDataSetAdapter1.Area := TJSONDataSetArea.Current;
end;

end.
