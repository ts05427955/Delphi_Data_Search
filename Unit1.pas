unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.DBGrids,
  Vcl.Grids, MyAccess, Vcl.StdCtrls, Vcl.DBCtrls, MemDS, DBAccess, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Mask;

type
  TForm1 = class(TForm)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    MyQuery2: TMyQuery;
    DataSource2: TDataSource;
    MyQuery3: TMyQuery;
    DataSource3: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    procedure UpdateTabVisibility;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // 初始化資料庫連接
  MyConnection1.Server := 'localhost';
  MyConnection1.Port := 3306;
  MyConnection1.Database := 'testdb';
  MyConnection1.Username := 'root';
  MyConnection1.Password := 'p#x]m[n7R$=35*48!qE%rv';

  try
    MyConnection1.Connect;
    
    // 設定主要查詢
    MyQuery1.SQL.Text := 'SELECT * FROM customers';
    MyQuery1.Active := True;
    
    // 設定聯絡資料查詢
    MyQuery2.SQL.Text := 'SELECT * FROM contact_details WHERE customer_id = :id AND contact_type = ''Email''';
    MyQuery2.Active := True;
    
    MyQuery3.SQL.Text := 'SELECT * FROM contact_details WHERE customer_id = :id AND contact_type = ''Telephone''';
    MyQuery3.Active := True;

    // 強制刷新數據
    MyQuery1.Refresh;
    MyQuery2.Refresh;
    MyQuery3.Refresh;

    // 初始化 Tab 可見性
    UpdateTabVisibility;
  except
    on E: Exception do
      ShowMessage('資料庫連接錯誤: ' + E.Message);
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  UpdateTabVisibility;
end;

procedure TForm1.UpdateTabVisibility;
begin
  // 控制 Emails TabSheet
  DBGrid2.Visible := PageControl1.ActivePage = TabSheet1;
  DBNavigator2.Visible := PageControl1.ActivePage = TabSheet1;

  // 控制 Phones TabSheet
  DBGrid3.Visible := PageControl1.ActivePage = TabSheet2;
  DBNavigator3.Visible := PageControl1.ActivePage = TabSheet2;
end;

end.
