object Form4: TForm4
  Left = 0
  Top = 0
  Caption = '[C/S] Fish fact'
  ClientHeight = 606
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 256
    Width = 63
    Height = 15
    Caption = 'SPECIES NO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 304
    Width = 58
    Height = 15
    Caption = 'CATEGORY'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 272
    Top = 256
    Width = 96
    Height = 15
    Caption = 'COMMON_NAME'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 272
    Top = 304
    Width = 79
    Height = 15
    Caption = 'SPECIES NAME'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 272
    Top = 360
    Width = 74
    Height = 15
    Caption = 'LENGTH (CM)'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 432
    Top = 360
    Width = 61
    Height = 15
    Caption = 'LENGTH_IN'
    FocusControl = DBEdit6
  end
  object Label8: TLabel
    Left = 320
    Top = 688
    Width = 50
    Height = 15
    Caption = 'GRAPHIC'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 585
    Height = 217
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SPECIES_NO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMON_NAME'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPECIES_NAME'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LENGTH'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LENGTH_IN'
        Width = 60
        Visible = True
      end>
  end
  object DBImage1: TDBImage
    Left = 16
    Top = 392
    Width = 250
    Height = 161
    DataField = 'GRAPHIC'
    DataSource = DataSource1
    Stretch = True
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 272
    Top = 405
    Width = 314
    Height = 148
    DataField = 'NOTES'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 272
    Width = 154
    Height = 23
    DataField = 'SPECIES_NO'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 320
    Width = 250
    Height = 23
    DataField = 'CATEGORY'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 272
    Top = 272
    Width = 300
    Height = 23
    DataField = 'COMMON_NAME'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 272
    Top = 320
    Width = 300
    Height = 23
    DataField = 'SPECIES_NAME'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 272
    Top = 376
    Width = 154
    Height = 23
    DataField = 'LENGTH'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 432
    Top = 376
    Width = 154
    Height = 23
    DataField = 'LENGTH_IN'
    DataSource = DataSource1
    TabOrder = 8
  end
  object btnNew: TButton
    Left = 16
    Top = 559
    Width = 75
    Height = 25
    Action = DatasetInsert1
    TabOrder = 9
  end
  object btnSave: TButton
    Left = 430
    Top = 559
    Width = 75
    Height = 25
    Action = DatasetPost1
    TabOrder = 10
  end
  object btnCancel: TButton
    Left = 511
    Top = 559
    Width = 75
    Height = 25
    Action = DatasetCancel1
    TabOrder = 11
  end
  object Button1: TButton
    Left = 16
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 559
    Width = 75
    Height = 25
    Action = DatasetDelete1
    TabOrder = 13
  end
  object DataSource1: TDataSource
    DataSet = dmDatabase.qryBioLife
    Left = 504
    Top = 56
  end
  object ActionList1: TActionList
    Left = 304
    Top = 312
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 128
    Top = 352
  end
end
