unit Unit8;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm8 = class(TForm)
    V: TImage;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

uses Unit9, Unit11, Unit14, Unit15, Unit16, Unit17, Unit28, Unit3meni, Unit10;








procedure TForm8.Button1Click(Sender: TObject);
begin
Form11 := TForm11.Create(Self);
  try
    // Prikazivanje nove forme
    Form11.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form11.Free;
  end;
end;


procedure TForm8.Button2Click(Sender: TObject);
begin
Form9 := TForm9.Create(Self);
  try
    // Prikazivanje nove forme
    Form9.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form9.Free;
  end;
end;


procedure TForm8.Button3Click(Sender: TObject);
begin
          // Kreirajte instancu nove forme
  Form28 := TForm28.Create(Self);
  try
    // Prikazivanje nove forme
    Form28.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form28.Free;
  end;
end;


procedure TForm8.Button4Click(Sender: TObject);
begin

  Form14 := TForm14.Create(Self);
  try

    Form14.ShowModal;
  finally

    Form14.Free;
  end;
end;


procedure TForm8.Button5Click(Sender: TObject);
begin
      Form15 := TForm15.Create(Self);
  try
    // Prikazivanje nove forme
    Form15.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form15.Free;
  end;
end;


procedure TForm8.Button6Click(Sender: TObject);
begin
Form16 := TForm16.Create(Self);
  try
    // Prikazivanje nove forme
    Form16.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form16.Free;
  end;
end;


procedure TForm8.Button7Click(Sender: TObject);
begin

  Form17 := TForm17.Create(Self);
  try
    // Prikazivanje nove forme
    Form17.ShowModal;
  finally
    // Oslobađanje memorije kada se forma zatvori
    Form17.Free;
  end;
end;


procedure TForm8.Button8Click(Sender: TObject);
begin
Form10.show;
    Self.Hide;
end;

end.
