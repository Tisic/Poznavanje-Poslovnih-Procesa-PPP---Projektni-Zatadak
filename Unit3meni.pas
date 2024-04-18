unit Unit3meni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label1: TLabel;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Image2: TImage;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

end.
procedure TForm.WordWrap1Click(Sender: TObject);
 begin
   with Editor do
   begin
     WordWrap := not WordWrap;  { toggle word wrapping }
     if WordWrap then
       ScrollBars := ssVertical  { wrapped requires only vertical }
     else
       ScrollBars := ssBoth;  { unwrapped might need both }
       WordWrap1.Checked := WordWrap;  { check menu item to match property }
   end;
 end;
void __fastcall TEditForm::WordWrap1Click(TObject *Sender) {
TfrmSecond = class(TForm)
    lblSecond: TLabel; // Primer elementa na drugoj formi
    btnClose: TButton; // Primer dugmeta na drugoj formi
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TForm2 = class(TForm)
    // Elementi za TForm2
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  frmSecond: TfrmSecond; // Deklaracija promenljive za drugu formu

implementation

{$R *.fmx}

const
  PricePerKilogram = 10; // Cena po kilogramu sušene šljive

procedure TfrmMain.btnCalculateClick(Sender: TObject);
var
  Quantity, TotalPrice: Double;
begin
  // Provera da li je korisnik unio brojčanu vrednost
  if TryStrToFloat(edtQuantity.Text, Quantity) then
  begin
    // Izračun ukupne cene
    TotalPrice := Quantity * PricePerKilogram;
    // Prikaz rezultata
    lblResult.Text := Format('Ukupna cena: %.2f dinara', [TotalPrice]);
  end
  else
  begin
    // Obaveštenje korisniku ako nije uneo brojčanu vrednost
    ShowMessage('Molimo unesite brojčanu vrednost za količinu sušene šljive.');
    edtQuantity.SetFocus;
  end;
end;

procedure TfrmSecond.btnCloseClick(Sender: TObject);
begin
  Close; // Zatvaranje druge forme
end;

end.




