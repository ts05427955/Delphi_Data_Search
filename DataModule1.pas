unit DataModule1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MyAccess, MemDS, DBAccess;

type
  TDataModule1 = class(TDataModule)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    MyQuery2: TMyQuery;
    DataSource2: TDataSource;
    MyQuery3: TMyQuery;
    DataSource3: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
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
  except
    on E: Exception do
      ShowMessage('資料庫連接錯誤: ' + E.Message);
  end;
end;

end. 