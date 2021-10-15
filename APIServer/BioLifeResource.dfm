object FishfactResource1: TFishfactResource1
  OnCreate = DataModuleCreate
  Height = 300
  Width = 600
  PixelsPerInch = 96
  object EMSDataSetResource1: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryBioLife
    KeyFields = 'SPECIES_NO'
    ValueFields = 
      'SPECIES_NO;CATEGORY;COMMON_NAME;SPECIES_NAME;LENGTH;LENGTH_IN;NO' +
      'TES'
    Left = 248
    Top = 32
  end
  object qryBioLife: TFDQuery
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
    LoginPrompt = False
    Left = 85
    Top = 32
  end
  object qryBioLifePhoto: TFDQuery
    Connection = conFishFact
    SQL.Strings = (
      'SELECT GRAPHIC FROM biolife '
      'WHERE SPECIES_NO = :ITEM')
    Left = 88
    Top = 168
    ParamData = <
      item
        Name = 'ITEM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
  end
end
