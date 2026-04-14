object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Usu'#225'rio'
  ClientHeight = 340
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object lblTituloCad: TLabel
      Left = 16
      Top = 8
      Width = 100
      Height = 21
      Caption = 'Novo Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object lblNome: TLabel
    Left = 24
    Top = 56
    Width = 39
    Height = 15
    Caption = 'Nome:'
  end
  object edtNome: TEdit
    Left = 24
    Top = 74
    Width = 370
    Height = 23
    MaxLength = 100
    TabOrder = 1
  end
  object lblEmail: TLabel
    Left = 24
    Top = 106
    Width = 41
    Height = 15
    Caption = 'E-mail:'
  end
  object edtEmail: TEdit
    Left = 24
    Top = 124
    Width = 370
    Height = 23
    MaxLength = 150
    TabOrder = 2
  end
  object lblLogin: TLabel
    Left = 24
    Top = 156
    Width = 35
    Height = 15
    Caption = 'Login:'
  end
  object edtLogin: TEdit
    Left = 24
    Top = 174
    Width = 180
    Height = 23
    MaxLength = 50
    TabOrder = 3
  end
  object lblSenha: TLabel
    Left = 214
    Top = 156
    Width = 38
    Height = 15
    Caption = 'Senha:'
  end
  object edtSenha: TEdit
    Left = 214
    Top = 174
    Width = 180
    Height = 23
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 4
  end
  object chkAtivo: TCheckBox
    Left = 24
    Top = 216
    Width = 97
    Height = 17
    Caption = 'Ativo'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 290
    Width = 420
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object btnSalvar: TButton
      Left = 224
      Top = 10
      Width = 85
      Height = 30
      Caption = 'Salvar'
      Default = True
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 316
      Top = 10
      Width = 85
      Height = 30
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
