     unit MainForm123;


interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfrmMain = class(TForm)
    lblTitle: TLabel;
    lblQuantity: TLabel;
    edtQuantity: TEdit;
    btnCalculate: TButton;
    lblResult: TLabel;
    procedure btnCalculateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

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





