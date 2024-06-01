unit Unit12;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit
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
  TForm12 = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label18: TLabel;
    Rectangle2: TRectangle;
    Line1: TLine;
    Edit1: TEdit;
    Label2: TLabel;
    Switch1: TSwitch;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Line2: TLine;
    Edit3: TEdit;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Line3: TLine;
    Edit2: TEdit;
    Rectangle4: TRectangle;
    Line4: TLine;
    Edit4: TEdit;
    Rectangle5: TRectangle;
    Line5: TLine;
    Edit5: TEdit;
    Rectangle6: TRectangle;
    Line6: TLine;
    Edit6: TEdit;
    Rectangle7: TRectangle;
    Line7: TLine;
    Edit7: TEdit;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Rectangle15: TRectangle;
    Label14: TLabel;
    Rectangle8: TRectangle;
    Label15: TLabel;
    Rectangle9: TRectangle;
    Line8: TLine;
    Edit8: TEdit;
    Label16: TLabel;
    Button1: TButton;
    Rectangle11: TRectangle;
    Label19: TLabel;
    Rectangle12: TRectangle;
    Label20: TLabel;
    Button3: TButton;
    procedure Switch1Switch(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MultiplyAndDisplay;
    procedure ShowThankYouMessage;
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.fmx}

uses Unit10;

procedure TForm12.Switch1Switch(Sender: TObject);
begin
  MultiplyAndDisplay;
end;

procedure TForm12.Button1Click(Sender: TObject);
begin

    Form10.Show;
    Self.Hide;
end;

procedure TForm12.Button3Click(Sender: TObject);
const
  GmailURL = 'https://mail.google.com';
begin
  {$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', PChar(GmailURL), nil, nil, SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF MACOS}
  var
    URL: NSURL;
  begin
    URL := TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR(GmailURL)));
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
    Intent.setData(StrToJURI(GmailURL));
    TAndroidHelper.Context.startActivity(Intent);
  end;
  {$ENDIF}
  {$IFDEF IOS}
  var
    URL: NSURL;
  begin
    URL := TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR(GmailURL)));
    if SharedApplication.canOpenURL(URL) then
      SharedApplication.openURL(URL);
  end;
  {$ENDIF}
  ShowThankYouMessage;
end;

procedure TForm12.Edit1Change(Sender: TObject);
begin
  MultiplyAndDisplay;
end;

procedure TForm12.MultiplyAndDisplay;
var
  Number1, Multiplier, Result: Double;
begin
  if TryStrToFloat(Edit1.Text, Number1) then
  begin
    if Switch1.IsChecked then
    begin
      if TryStrToFloat(Label14.Text, Multiplier) then
      begin
        Result := Number1 * Multiplier;
        Edit8.Text := FloatToStr(Result);
      end
      else
      begin
        ShowMessage('Invalid number in Label14');
      end;
    end
    else
    begin
      if TryStrToFloat(Label15.Text, Multiplier) then
      begin
        Result := Number1 * Multiplier;
        Edit8.Text := FloatToStr(Result);
      end
      else
      begin
        ShowMessage('Invalid number in Label15');
      end;
    end;
  end
  else
  begin
    Edit8.Text := '';
  end;
end;

procedure TForm12.ShowThankYouMessage;
begin
  {$IFDEF MSWINDOWS}
  ShowMessage('Hvala vam na saradnji');
  {$ENDIF}
  {$IFDEF MACOS}
  var
    Alert: NSAlert;
  begin
    Alert := TNSAlert.Create;
    Alert.setMessageText(NSSTR('Hvala vam na Saradnji!!!'));
    Alert.runModal;
  end;
  {$ENDIF}
  {$IFDEF ANDROID}
  var
    Toast: JToast;
  begin
    Toast := TJToast.JavaClass.makeText(TAndroidHelper.Context, StrToJCharSequence('Hvala vam na saradnji'), TJToast.JavaClass.LENGTH_SHORT);
    Toast.setGravity(TJGravity.JavaClass.CENTER, 0, 0);
    Toast.show;
  end;
  {$ENDIF}
  {$IFDEF IOS}
  var
    Alert: UIAlertController;
    AlertAction: UIAlertAction;
  begin
    Alert := TUIAlertController.Wrap(TUIAlertController.OCClass.alertControllerWithTitle(NSSTR(''), NSSTR('Hvala vam na saradnji'), UIAlertControllerStyleAlert));
    AlertAction := TUIAlertAction.Wrap(TUIAlertAction.OCClass.actionWithTitle(NSSTR('OK'), UIAlertActionStyleDefault, nil));
    Alert.addAction(AlertAction);
    TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication).keyWindow.rootViewController.presentViewController(Alert, True, nil);
  end;
  {$ENDIF}
end;

end.

