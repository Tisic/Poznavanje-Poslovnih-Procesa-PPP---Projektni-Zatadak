unit Unit232313;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, Data.Win.ADODB, Data.DB;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Line1: TLine;
    Edit1: TEdit;       // Polje za korisničko ime
    Line2: TLine;
    Edit2: TEdit;       // Polje za lozinku
    Button1: TButton;   // Dugme za prijavu
    Button2: TButton;   // Drugo dugme
    Button3: TButton;   // Dugme za registraciju
    ADOConnection1: TADOConnection;  // Komponenta za povezivanje sa bazom
    ADOTable1: TADOTable;            // Komponenta za rad sa tabelom
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Unit3meni, Unit10, Unit29;

procedure TForm2.Button1Click(Sender: TObject);
var
  Username, Password: string;
  UserFound: Boolean;
begin
  Username := Edit1.Text;
  Password := Edit2.Text;

  // Provera da li je konekcija otvorena i zatvaranje ako je potrebno
  if ADOConnection1.Connected then
    ADOConnection1.Connected := False;

  // Povezivanje na bazu
  ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\dimit\OneDrive\Desktop\PLUM123.mdb;';
  ADOConnection1.Connected := True;

  // Provera da li je tabela već otvorena i zatvaranje ako je potrebno
  if ADOTable1.Active then
    ADOTable1.Close;

  // Otvaranje tabele
  ADOTable1.Connection := ADOConnection1;
  ADOTable1.TableName := 'Users';
  ADOTable1.Open;

  // Provera korisničkog imena i lozinke
  UserFound := False;
  ADOTable1.First;
  while not ADOTable1.Eof do
  begin
    if (ADOTable1.FieldByName('Name').AsString = Username) and
       (ADOTable1.FieldByName('Password').AsString = Password) then
    begin
      UserFound := True;
      Break;
    end;
    ADOTable1.Next;
  end;

  if UserFound then
  begin
    ShowMessage('Login successful!');
    Form3.Show; // Prikazivanje sledeće forme
    Self.Hide;
  end
  else
  begin
    ShowMessage('Invalid username or password. Please try again.');
  end;

  // Zatvaranje tabele i konekcije
  ADOTable1.Close;
  ADOConnection1.Connected := False;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form10.Show;
  Self.Hide;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form29.Show;
  Self.Hide;
end;

end.

