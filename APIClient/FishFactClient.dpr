program FishFactClient;

uses
  Vcl.Forms,
  CilentForm in 'CilentForm.pas' {Form4},
  ClientModule in 'ClientModule.pas' {dmDatabase: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
