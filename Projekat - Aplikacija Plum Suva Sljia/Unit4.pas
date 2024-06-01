unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Colors, FMX.Controls.Presentation;

type
  TForm4 = class(TForm)
    Image3: TImage;
    Image1: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses Unit3meni;

procedure TForm4.Button1Click(Sender: TObject);
begin
 Form3.show;
    Self.Hide;
end;

end.
