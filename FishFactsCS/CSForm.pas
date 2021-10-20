unit CSForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, CSModule, Vcl.DBActns,
  System.Actions, Vcl.ActnList;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
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
    procedure Button1Click(Sender: TObject);
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

end.
