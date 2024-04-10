program Project3;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm123 in 'MainForm123.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  // Koristimo TfrmMain umesto TForm2
  Application.Run;
end.

