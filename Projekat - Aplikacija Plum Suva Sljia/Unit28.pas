 unit Unit28;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.Win.ADODB,
  Data.DB, System.Rtti, FMX.Grid.Style, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm28 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.fmx}

procedure TForm28.FormCreate(Sender: TObject);
var
  I, J: Integer;
  Column: TColumn;
begin
  ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Path\To\Database.mdb;';
  ADOConnection1.Connected := True;
  ADOTable1.TableName := 'TableName'; // Zamenite sa stvarnim imenom tabele
  ADOTable1.Open;

  // Postavite broj kolona u StringGrid
  StringGrid1.BeginUpdate;
  try
    StringGrid1.RowCount := ADOTable1.RecordCount + 1; // +1 za zaglavlja kolona
    StringGrid1.ClearColumns;

    // Dodavanje kolona
    for I := 0 to ADOTable1.FieldCount - 1 do
    begin
      Column := TStringColumn.Create(StringGrid1);
      Column.Header := ADOTable1.Fields[I].FieldName;
      Column.Width := 100; // Postavite širinu kolone po potrebi
      StringGrid1.AddObject(Column);
    end;

    // Popunite StringGrid sa podacima
    I := 1;
    ADOTable1.First;
    while not ADOTable1.Eof do
    begin
      for J := 0 to ADOTable1.FieldCount - 1 do
        StringGrid1.Cells[J, I] := ADOTable1.Fields[J].AsString;
      Inc(I);
      ADOTable1.Next;
    end;
  finally
    StringGrid1.EndUpdate;
  end;

  ADOTable1.Close;
end;

end.

