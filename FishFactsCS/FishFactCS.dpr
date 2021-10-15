program FishFactCS;

uses
  Vcl.Forms,
  CSForm in 'CSForm.pas' {Form4},
  CSModule in 'CSModule.pas' {dmDatabase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
