unit Unit17;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm17 = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Line1: TLine;
    Line2: TLine;
    Line3: TLine;
    V: TLine;
    Line5: TLine;
    Line7: TLine;
    Line6: TLine;
    Line8: TLine;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.fmx}

uses Unit20;

procedure TForm17.Button1Click(Sender: TObject);
begin
  Form20 := TForm20.Create(Self);
  try
    // Prikazivanje nove forme
    Form20.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form20.Free;
  end;

  // Prikazivanje poruke "Uplaćeno je" nakon zatvaranja forme
  ShowMessage('Uplaćeno je');
end;

end.

