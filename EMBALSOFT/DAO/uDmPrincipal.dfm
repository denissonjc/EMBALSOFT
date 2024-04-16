object dmPrincipal: TdmPrincipal
  Height = 480
  Width = 640
  object dspPesquisar: TDataSetProvider
    DataSet = qPesquisar
    Constraints = False
    Left = 184
    Top = 136
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
        Size = 128
      end>
    ProviderName = 'dspPesquisar'
    Left = 176
    Top = 208
    object cdsPesquisarIdCliente: TAutoIncField
      FieldName = 'IdCliente'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsPesquisarNomeReduzido: TStringField
      FieldName = 'NomeReduzido'
    end
    object cdsPesquisarRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object cdsPesquisarCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsPesquisarCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsPesquisarDtNascimento: TDateTimeField
      FieldName = 'DtNascimento'
    end
    object cdsPesquisarDtTmCadastro: TDateTimeField
      FieldName = 'DtTmCadastro'
    end
  end
  object qPesquisar: TFDQuery
    Connection = dmConexao.SqlConnection
    SQL.Strings = (
      'select *'
      'from TbClientes C'
      'where c.idcliente =:Codigo'
      'order by c.idcliente')
    Left = 176
    Top = 60
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
    object qPesquisarIdCliente: TFDAutoIncField
      FieldName = 'IdCliente'
      ReadOnly = True
    end
    object qPesquisarNomeReduzido: TStringField
      FieldName = 'NomeReduzido'
    end
    object qPesquisarRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object qPesquisarCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qPesquisarCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qPesquisarDtNascimento: TDateTimeField
      FieldName = 'DtNascimento'
    end
    object qPesquisarDtTmCadastro: TDateTimeField
      FieldName = 'DtTmCadastro'
    end
  end
  object qInserir: TFDQuery
    Connection = dmConexao.SqlConnection
    SQL.Strings = (
      
        'insert into TbClientes (NomeReduzido, RazaoSocial, CNPJ, CPF, Dt' +
        'Nascimento, DtTmCadastro)'
      
        'values (:NomeReduzido, :RazaoSocial, :CNPJ, :CPF, :DtNascimento,' +
        ' :DtTmCadastro)')
    Left = 236
    Top = 60
    ParamData = <
      item
        Name = 'NOMEREDUZIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = 'q'
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = 'q'
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
        Value = 'q'
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'q'
      end
      item
        Name = 'DTNASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
        Value = 32836d
      end
      item
        Name = 'DTTMCADASTRO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object qAlterar: TFDQuery
    Connection = dmConexao.SqlConnection
    SQL.Strings = (
      'update TbClientes'
      'set NomeReduzido = :NomeReduzido,'
      '    RazaoSocial = :RazaoSocial,'
      '    CNPJ = :CNPJ,'
      '    CPF = :CPF,'
      '    DtNascimento = :DtNascimento'
      'where (idCliente = :idCliente)'
      ''
      '')
    Left = 298
    Top = 60
    ParamData = <
      item
        Name = 'NOMEREDUZIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = Null
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
        Value = Null
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = Null
      end
      item
        Name = 'DTNASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qAlterarNomeReduzido: TStringField
      FieldName = 'NomeReduzido'
      Origin = 'NomeReduzido'
    end
    object qAlterarRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Origin = 'RazaoSocial'
      Size = 60
    end
    object qAlterarCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qAlterarCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qAlterarDtNascimento: TDateTimeField
      FieldName = 'DtNascimento'
      Origin = 'DtNascimento'
    end
    object qAlterarIdCliente: TFDAutoIncField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object qExcluir: TFDQuery
    Connection = dmConexao.SqlConnection
    SQL.Strings = (
      'delete from TbClientes'
      'where (idCliente = :idCliente)')
    Left = 360
    Top = 60
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qGrid: TFDQuery
    Connection = dmConexao.SqlConnection
    SQL.Strings = (
      'select *'
      'from TbClientes C'
      'order by c.idcliente')
    Left = 112
    Top = 60
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'IdCliente'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'NomeReduzido'
    end
    object StringField2: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object StringField4: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DtNascimento'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DtTmCadastro'
    end
  end
end
