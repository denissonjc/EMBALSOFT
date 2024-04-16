object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 424
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 736
    Height = 313
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 63
    ExplicitWidth = 766
    ExplicitHeight = 420
    object Label1: TLabel
      Left = 140
      Top = 6
      Width = 88
      Height = 15
      Caption = 'Nome Reduzido '
    end
    object Label3: TLabel
      Left = 5
      Top = 63
      Width = 68
      Height = 15
      Caption = 'Raz'#227'o Social '
    end
    object Label5: TLabel
      Left = 126
      Top = 121
      Width = 59
      Height = 15
      Caption = 'CNPJ /CPF '
    end
    object Label7: TLabel
      Left = 5
      Top = 168
      Width = 107
      Height = 15
      Caption = 'Data de Nascimento'
    end
    object Label8: TLabel
      Left = 5
      Top = 6
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label6: TLabel
      Left = 4
      Top = 121
      Width = 59
      Height = 15
      Caption = 'CNPJ /CPF '
    end
    object Label9: TLabel
      Left = 157
      Top = 168
      Width = 90
      Height = 15
      Caption = 'Data de Cadastro'
    end
    object edNomeReduzido: TEdit
      Left = 139
      Top = 27
      Width = 274
      Height = 23
      TabOrder = 0
    end
    object edRazaoSocial: TEdit
      Left = 5
      Top = 84
      Width = 339
      Height = 23
      TabOrder = 1
    end
    object edCNPJ: TEdit
      Left = 126
      Top = 136
      Width = 116
      Height = 23
      TabOrder = 2
    end
    object edDtNascimento: TEdit
      Left = 4
      Top = 189
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object Panel4: TPanel
      Left = 452
      Top = 0
      Width = 284
      Height = 254
      Align = alRight
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitLeft = 478
      ExplicitHeight = 360
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 274
        Height = 146
        Align = alClient
        DataSource = dsPesquisar
        DrawingStyle = gdsGradient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 152
        Width = 280
        Height = 98
        Align = alBottom
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object btCancelar: TButton
      Left = 288
      Top = 218
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btCancelarClick
    end
    object Panel6: TPanel
      Left = 0
      Top = 254
      Width = 736
      Height = 59
      Align = alBottom
      TabOrder = 6
      ExplicitTop = 365
      ExplicitWidth = 766
      object Label2: TLabel
        Left = 5
        Top = 12
        Width = 36
        Height = 15
        Caption = 'Nome '
      end
      object edNomeContato: TEdit
        Left = 47
        Top = 21
        Width = 121
        Height = 23
        TabOrder = 0
      end
    end
    object edtCodigo: TEdit
      Left = 5
      Top = 27
      Width = 121
      Height = 23
      TabOrder = 7
    end
    object edCPF: TEdit
      Left = 4
      Top = 136
      Width = 116
      Height = 23
      TabOrder = 8
    end
    object edDtCadastro: TEdit
      Left = 157
      Top = 189
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 9
    end
    object btGravar: TButton
      Left = 369
      Top = 218
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 10
      OnClick = btGravarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 69
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 762
    object Label4: TLabel
      Left = 11
      Top = 4
      Width = 39
      Height = 15
      Caption = 'Codigo'
    end
    object btPesquisar: TButton
      Left = 223
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btPesquisarClick
    end
    object edPesquisar: TEdit
      Left = 3
      Top = 25
      Width = 164
      Height = 23
      TabOrder = 1
    end
    object btNovo: TButton
      Left = 320
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
      OnClick = btNovoClick
    end
    object btAlterar: TButton
      Left = 445
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 526
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btExcluirClick
    end
  end
  object Pnl: TPanel
    Left = 0
    Top = 382
    Width = 736
    Height = 42
    Align = alBottom
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 488
    ExplicitWidth = 762
    object btSair: TButton
      Left = 534
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btSairClick
    end
  end
  object dsPesquisar: TDataSource
    DataSet = dmPrincipal.qGrid
    Left = 400
    Top = 192
  end
end
