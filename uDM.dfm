object DM: TDM
  OnCreate = DataModuleCreate
  Height = 240
  Width = 320
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object qryUsuarios: TFDQuery
    Connection = FDConnection
    Left = 56
    Top = 88
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 56
    Top = 152
  end
end
