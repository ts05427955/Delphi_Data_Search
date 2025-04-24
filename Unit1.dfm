object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Customer Contact System'
  ClientHeight = 589
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 854
    Height = 200
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'Customer ID'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'Email'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telephone'
        Title.Caption = 'Phone'
        Width = 150
        Visible = True
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 225
    Width = 854
    Height = 364
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Emails'
      object DBGrid2: TDBGrid
        Left = 0
        Top = 25
        Width = 846
        Height = 311
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'contact_value'
            Title.Caption = 'Email'
            Width = 300
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 0
        Width = 846
        Height = 25
        DataSource = DataSource2
        Align = alTop
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Phones'
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 0
        Top = 25
        Width = 846
        Height = 311
        Align = alClient
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'contact_value'
            Title.Caption = 'Phone'
            Width = 200
            Visible = True
          end>
      end
      object DBNavigator3: TDBNavigator
        Left = 0
        Top = 0
        Width = 846
        Height = 25
        DataSource = DataSource3
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 854
    Height = 25
    DataSource = DataSource1
    Align = alTop
    TabOrder = 2
  end
  object MyConnection1: TMyConnection
    Database = 'testdb'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 376
    EncryptedPassword = 
      '8FFFDCFF87FFA2FF92FFA4FF91FFC8FFADFFDBFFC2FFCCFFCAFFD5FFCBFFC7FF' +
      'DEFF8EFFBAFFDAFF8DFF89FF'
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT * FROM customers')
    Active = True
    Left = 128
    Top = 384
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 232
    Top = 392
  end
  object MyQuery2: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT * FROM contact_details'
      'WHERE customer_id = :id AND contact_type = '#39'Email'#39)
    MasterSource = DataSource1
    MasterFields = 'id'
    Active = True
    Left = 336
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object DataSource2: TDataSource
    DataSet = MyQuery2
    Left = 416
    Top = 360
  end
  object MyQuery3: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'SELECT * FROM contact_details'
      'WHERE customer_id = :id AND contact_type = '#39'Telephone'#39)
    MasterSource = DataSource1
    MasterFields = 'id'
    Active = True
    Left = 504
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object DataSource3: TDataSource
    DataSet = MyQuery3
    Left = 560
    Top = 312
  end
end
