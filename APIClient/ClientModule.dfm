object dmDatabase: TdmDatabase
  OnCreate = DataModuleCreate
  Height = 409
  Width = 736
  PixelsPerInch = 96
  object qryBioLife: TFDQuery
    Active = True
    Connection = conFishFact
    SQL.Strings = (
      'SELECT * FROM BIOLIFE')
    Left = 85
    Top = 105
  end
  object conFishFact: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\FIshFactsRSX\Data\BIOLIFE.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 85
    Top = 32
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/fishfacts'
    Params = <>
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 288
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = 'biolifes/'
    Response = RESTResponse1
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 288
    Top = 72
  end
  object RESTResponse1: TRESTResponse
    Left = 392
    Top = 72
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 544
    Top = 72
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 544
    Top = 136
    object FDMemTable1SPECIES_NO: TFloatField
      FieldName = 'SPECIES_NO'
    end
    object FDMemTable1CATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 11
    end
    object FDMemTable1COMMON_NAME: TWideStringField
      FieldName = 'COMMON_NAME'
      Size = 17
    end
    object FDMemTable1SPECIES_NAME: TWideStringField
      FieldName = 'SPECIES_NAME'
      Size = 25
    end
    object FDMemTable1LENGTH: TFloatField
      FieldName = 'LENGTH'
    end
    object FDMemTable1LENGTH_IN: TFloatField
      FieldName = 'LENGTH_IN'
    end
    object FDMemTable1NOTES: TWideStringField
      FieldName = 'NOTES'
      Size = 701
    end
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'item'
        Options = [poAutoCreated]
      end>
    Resource = 'biolifes/{item}'
    Response = RESTResponse2
    Left = 288
    Top = 216
  end
  object RESTResponse2: TRESTResponse
    Left = 544
    Top = 216
  end
  object RESTRequestDataSetAdapter1: TRESTRequestDataSetAdapter
    Request = RESTRequest2
    Dataset = FDMemTable1
    Area = Current
    Left = 416
    Top = 216
  end
  object RESTRequest3: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse3
    Left = 288
    Top = 304
  end
  object RESTResponse3: TRESTResponse
    Left = 416
    Top = 304
  end
end
