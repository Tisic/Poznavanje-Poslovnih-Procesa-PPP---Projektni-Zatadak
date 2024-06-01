unit Unit14;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm14 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle1: TRectangle;
    Button1: TButton;
    Label4: TLabel;
    Button2: TButton;
    Rectangle2: TRectangle;
    Label5: TLabel;
    Button3: TButton;
    Button4: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Rectangle3: TRectangle;
    Label9: TLabel;
    Rectangle4: TRectangle;
    Label10: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Rectangle5: TRectangle;
    Label14: TLabel;
    Rectangle6: TRectangle;
    Label15: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Label16: TLabel;
    Rectangle8: TRectangle;
    Label19: TLabel;
    Rectangle7: TRectangle;
    Label17: TLabel;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label20: TLabel;
    Label21: TLabel;
    procedure Button1Click(Sender: TObject);
  procedure FormCreate(Sender: TObject);private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.fmx}


procedure TForm14.Button1Click(Sender: TObject);
var
  currentValue: Integer;
begin
  // Proveri trenutnu vrednost iz Label-a
  currentValue := StrToInt(Label4.Name);

  // Povećaj vrednost za 1
  Inc(currentValue);

  // Prikaži novu vrednost u Label-u
  Label4.Name := IntToStr(currentValue);
end;
procedure TForm14.FormCreate(Sender: TObject);
begin
  Label4.Name := '0';
end;
end.
