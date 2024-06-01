unit Unit10;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, Data.DB, Data.Win.ADODB;

type
  TForm10 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Line1: TLine;
    Edit1: TEdit;       // Polje za korisničko ime
    Line2: TLine;
    Edit2: TEdit;       // Polje za lozinku
    Edit3: TEdit;       // Polje za IDZaposlenog
    Button1: TButton;   // Dugme za prijavu
    ADOConnection1: TADOConnection;  // Komponenta za povezivanje sa bazom
    ADOTable1: TADOTable;            // Komponenta za rad sa tabelom
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

uses Unit8, Unit11;

procedure TForm10.Button1Click(Sender: TObject);
var
  Username, Password, IDZaposlenog: string;
  UserFound: Boolean;
begin
  Username := Edit1.Text;
  Password := Edit2.Text;
  IDZaposlenog := Edit3.Text;

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
  ADOTable1.TableName := 'Zaposleni'; // Promenite u naziv vaše tabele
  ADOTable1.Open;

  // Provera korisničkog imena, lozinke i IDZaposlenog
  UserFound := False;
  ADOTable1.First;
  while not ADOTable1.Eof do
  begin
    if (ADOTable1.FieldByName('Name').AsString = Username) and
       (ADOTable1.FieldByName('Password').AsString = Password) and
       (ADOTable1.FieldByName('IDZaposlenog').AsString = IDZaposlenog) then
    begin
      UserFound := True;
      Break;
    end;
    ADOTable1.Next;
  end;

  if UserFound then
  begin
    ShowMessage('Login successful!');
    Form8 := TForm8.Create(Self);
    try
      Form8.ShowModal;
    finally
      Form8.Free;
    end;
  end
  else
  begin
    ShowMessage('Invalid username, password, or ID. Please try again.');
  end;

  // Zatvaranje tabele i konekcije
  ADOTable1.Close;
  ADOConnection1.Connected := False;
end;

end.

