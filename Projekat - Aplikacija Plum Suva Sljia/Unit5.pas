unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TForm5 = class(TForm)
    Image3: TImage;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Image1: TImage;
    Button1: TButton;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses Unit3meni;

procedure TForm5.Button1Click(Sender: TObject);
begin
 Form3.Show;
    Self.Hide;
end;

end.
