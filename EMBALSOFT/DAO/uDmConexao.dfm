object dmConexao: TdmConexao
  Height = 177
  Width = 211
  object SqlConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\EMBALSOFT\Dados\BDCANDITADO.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 40
  end
end
