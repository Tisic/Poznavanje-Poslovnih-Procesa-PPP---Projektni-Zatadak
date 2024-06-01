unit Unit11;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FMX.Layouts, FMX.WebBrowser
  {$IFDEF MSWINDOWS}
  , Winapi.Windows, Winapi.ShellAPI
  {$ENDIF}
  {$IFDEF MACOS}
  , Macapi.Foundation, Macapi.AppKit
  {$ENDIF}
  {$IFDEF ANDROID}
  , Androidapi.Helpers, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.App
  {$ENDIF}
  {$IFDEF IOS}
  , iOSapi.Foundation, iOSapi.UIKit
  {$ENDIF};

type
  TForm11 = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label18: TLabel;
    Rectangle1: TRectangle;
    Line2: TLine;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Line1: TLine;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Rectangle3: TRectangle;
    Line3: TLine;
    Edit3: TEdit;
    Label6: TLabel;
    Rectangle6: TRectangle;
    Line5: TLine;
    Edit5: TEdit;
    Button1: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MultiplyNumbers;
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

uses Unit10;

procedure TForm11.Button1Click(Sender: TObject);
begin

    Form10.Show;
    Self.Hide;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', 'https://mail.google.com', nil, nil, SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF MACOS}
  var
    URL: NSURL;
  begin
    URL := TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR('https://mail.google.com')));
    if TNSWorkspace.Wrap(TNSWorkspace.OCClass.sharedWorkspace).openURL(URL) then
      Exit;
  end;
  {$ENDIF}
  {$IFDEF ANDROID}
  var
    Intent: JIntent;
  begin
    Intent := TJIntent.Create;
    Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
    Intent.setData(StrToJURI('https://mail.google.com'));
    TAndroidHelper.Context.startActivity(Intent);
  end;
  {$ENDIF}
  {$IFDEF IOS}
  var
    URL: NSURL;
  begin
    URL := TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR('https://mail.google.com')));
    if SharedApplication.canOpenURL(URL) then
      SharedApplication.openURL(URL);
  end;
  {$ENDIF}
end;

procedure TForm11.Edit1Change(Sender: TObject);
begin
  MultiplyNumbers;
end;

procedure TForm11.Edit2Change(Sender: TObject);
begin
  MultiplyNumbers;
end;

procedure TForm11.MultiplyNumbers;
var
  Number1, Number2, Result: Double;
begin
  if TryStrToFloat(Edit1.Text, Number1) and TryStrToFloat(Edit2.Text, Number2) then
  begin
    Result := Number1 * Number2;
    Edit3.Text := FloatToStr(Result);
  end
  else
  begin
    Edit3.Text := '';  // Prazni Edit3 ako unos nije validan broj
  end;
end;

end.

