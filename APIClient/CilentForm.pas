unit CilentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, ClientModule, Vcl.DBActns,
  System.Actions, Vcl.ActnList;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    btnNew: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    ActionList1: TActionList;
    DatasetInsert1: TDataSetInsert;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    DatasetDelete1: TDataSetDelete;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure DatasetPost1Execute(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    if DataSource1.DataSet.FieldByName('GRAPHIC').IsBlob then
    begin
      if not (DataSource1.DataSet.State in [dsInsert, dsEdit]) then
        DataSource1.DataSet.Edit;

      TBlobField(DataSource1.DataSet.FieldByName('GRAPHIC')).LoadFromFile(OpenDialog1.FileName);
    end;
end;

procedure TForm4.DatasetDelete1Execute(Sender: TObject);
begin
  dmDatabase.DeleteData;
end;

procedure TForm4.DatasetPost1Execute(Sender: TObject);
begin
  dmDatabase.SaveData;
end;

procedure TForm4.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  dmDatabase.LoadImage(procedure(AStream: TMemoryStream)
    begin
      if Assigned(AStream) then
      begin
        var WIC := TWICImage.Create;
        WIC.LoadFromStream(AStream);
        Image1.Picture.Assign(WIC);
        WIC.Free;
      end
      else
        Image1.Picture.Assign(nil);
    end);
end;

end.
