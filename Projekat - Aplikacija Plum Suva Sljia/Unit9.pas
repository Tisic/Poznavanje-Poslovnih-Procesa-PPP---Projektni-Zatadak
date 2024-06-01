unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, Data.Win.ADODB, FMX.Edit;

type
  TForm9 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle10: TRectangle;
    Label16: TLabel;
    Rectangle4: TRectangle;
    Label1: TLabel;
    Rectangle5: TRectangle;
    Label2: TLabel;
    Rectangle6: TRectangle;
    Label3: TLabel;
    Rectangle7: TRectangle;
    Label4: TLabel;
    Rectangle8: TRectangle;
    Label5: TLabel;
    Rectangle9: TRectangle;
    Label6: TLabel;
    Rectangle11: TRectangle;
    Label7: TLabel;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.FormCreate(Sender: TObject);
begin
  try
    ADOConnection1.Connected := True;
    ShowMessage('Connection established successfully.');
  except
    on E: Exception do
      ShowMessage('Error connecting to database: ' + E.Message);
  end;
end;

procedure TForm9.LoadData;
var
  Sakosticom, Bezkostice: String;
begin
  try
    ADOTable1.Close;
    ADOTable1.TableName := 'Magacin za sljivu'; // Pretpostavimo da je ime tabele "Magacin"
    ADOTable1.Open;
    ShowMessage('Table opened successfully.');

    if not ADOTable1.IsEmpty then
    begin
      Sakosticom := ADOTable1.FieldByName('Sa kosticom').AsString;
      Bezkostice := ADOTable1.FieldByName('Bez kostice').AsString;
      Edit7.Text := SaKosticom;
      Edit8.Text := BezKostice;
    end
    else
    begin
      ShowMessage('Table is empty.');
    end;
  except
    on E: Exception do
      ShowMessage('Error accessing table: ' + E.Message);
  end;
  ADOTable1.Close;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  LoadData;
end;

end.


