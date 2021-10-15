object dmDatabase: TdmDatabase
  Height = 201
  Width = 389
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
end
