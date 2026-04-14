object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 500
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 200
      Height = 25
      Caption = 'Cadastro de Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBusca: TPanel
    Left = 0
    Top = 50
    Width = 780
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblBusca: TLabel
      Left = 16
      Top = 10
      Width = 40
      Height = 15
      Caption = 'Buscar:'
    end
    object edtBusca: TEdit
      Left = 62
      Top = 7
      Width = 300
      Height = 23
      TabOrder = 0
      OnKeyPress = edtBuscaKeyPress
    end
    object btnBuscar: TButton
      Left = 370
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object dbgUsuarios: TDBGrid
    Left = 0
    Top = 90
    Width = 780
    Height = 365
    Align = alClient
    DataSource = DM.dsUsuarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgUsuariosDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'd.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Caption = 'Login'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Title.Caption = 'Ativo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'Data Cadastro'
        Width = 130
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 455
    Width = 780
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnNovo: TButton
      Left = 16
      Top = 8
      Width = 90
      Height = 30
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 112
      Top = 8
      Width = 90
      Height = 30
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 208
      Top = 8
      Width = 90
      Height = 30
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAtualizar: TButton
      Left = 304
      Top = 8
      Width = 90
      Height = 30
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = btnAtualizarClick
    end
  end
end
