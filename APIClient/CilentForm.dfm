object Form4: TForm4
  Left = 0
  Top = 0
  Caption = '[RSX] Fish fact'
  ClientHeight = 513
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
    Top = 176
    Width = 63
    Height = 15
    Caption = 'SPECIES NO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 224
    Width = 58
    Height = 15
    Caption = 'CATEGORY'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 272
    Top = 176
    Width = 96
    Height = 15
    Caption = 'COMMON_NAME'
  end
  object Label4: TLabel
    Left = 272
    Top = 224
    Width = 79
    Height = 15
    Caption = 'SPECIES NAME'
  end
  object Label5: TLabel
    Left = 272
    Top = 280
    Width = 74
    Height = 15
    Caption = 'LENGTH (CM)'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 432
    Top = 280
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
  object Image1: TImage
    Left = 16
    Top = 312
    Width = 241
    Height = 161
    Stretch = True
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 585
    Height = 145
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 192
    Width = 154
    Height = 23
    DataField = 'SPECIES_NO'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 240
    Width = 250
    Height = 23
    DataField = 'CATEGORY'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 272
    Top = 296
    Width = 154
    Height = 23
    DataField = 'LENGTH'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 432
    Top = 296
    Width = 154
    Height = 23
    DataField = 'LENGTH_IN'
    DataSource = DataSource1
    TabOrder = 4
  end
  object btnNew: TButton
    Left = 16
    Top = 479
    Width = 75
    Height = 25
    Action = DatasetInsert1
    TabOrder = 5
  end
  object btnSave: TButton
    Left = 430
    Top = 479
    Width = 75
    Height = 25
    Action = DatasetPost1
    TabOrder = 6
  end
  object btnCancel: TButton
    Left = 511
    Top = 479
    Width = 75
    Height = 25
    Action = DatasetCancel1
    TabOrder = 7
  end
  object Button1: TButton
    Left = 16
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 479
    Width = 75
    Height = 25
    Action = DatasetDelete1
    TabOrder = 9
  end
  object DBEdit3: TDBEdit
    Left = 272
    Top = 192
    Width = 300
    Height = 23
    DataField = 'COMMON_NAME'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit4: TDBEdit
    Left = 272
    Top = 240
    Width = 300
    Height = 23
    DataField = 'SPECIES_NAME'
    DataSource = DataSource1
    TabOrder = 11
  end
  object DBMemo1: TDBMemo
    Left = 272
    Top = 325
    Width = 314
    Height = 148
    DataField = 'NOTES'
    DataSource = DataSource1
    TabOrder = 12
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 504
    Top = 56
  end
  object ActionList1: TActionList
    Left = 304
    Top = 232
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
      OnExecute = DatasetPost1Execute
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
      OnExecute = DatasetDelete1Execute
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 128
    Top = 272
  end
end
