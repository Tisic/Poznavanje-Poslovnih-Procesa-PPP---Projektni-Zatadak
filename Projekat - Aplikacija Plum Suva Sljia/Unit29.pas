unit Unit29;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, Data.Win.ADODB, Data.DB,
  Unit232313; // Dodajte ovu liniju da uključite drugi form

type
  TForm29 = class(TForm)
    Image1: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Line1: TLine;
    Edit1: TEdit;       // Polje za ime
    Line2: TLine;
    Button1: TButton;
    Edit3: TEdit;
    Line3: TLine;
    Edit2: TEdit;       // Polje za lozinku
    Line4: TLine;
    Edit5: TEdit;       // Polje za email
    Label4: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    procedure Line1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

{$R *.fmx}

procedure TForm29.Button1Click(Sender: TObject);
var
  Name, Password, Email: string;
begin
  Name := Edit1.Text;     // Pretpostavljam da je Edit1 polje za ime
  Password := Edit2.Text; // Pretpostavljam da je Edit2 polje za lozinku
  Email := Edit5.Text;    // Pretpostavljam da je Edit5 polje za email

  // Otvorite tabelu
  ADOTable1.TableName := 'Users'; // Ime tabele u bazi
  ADOTable1.Open;

  // Dodajte novi zapis
  ADOTable1.Insert;
  ADOTable1.FieldByName('Name').AsString := Name;
  ADOTable1.FieldByName('Password').AsString := Password;
  ADOTable1.FieldByName('Email').AsString := Email;
  ADOTable1.Post;

  // Zatvorite tabelu
  ADOTable1.Close;

  ShowMessage('User registered successfully!');

  // Prebacivanje na Form232313
  Form2.Show; // Prikazivanje drugog forma
  Form29.Hide;     // Sakrivanje trenutnog forma
end;

procedure TForm29.Label2Click(Sender: TObject);
begin
  // Implementacija za Label2 klik događaj
end;

procedure TForm29.Label4Click(Sender: TObject);
begin
  // Implementacija za Label4 klik događaj
end;

procedure TForm29.Line1Click(Sender: TObject);
begin
  // Implementacija za Line1 klik događaj
end;

end.
