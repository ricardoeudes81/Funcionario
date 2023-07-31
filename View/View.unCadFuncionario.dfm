object frmCadFuncionario: TfrmCadFuncionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 504
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 201
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 528
    object lblId: TLabel
      Left = 16
      Top = 24
      Width = 10
      Height = 15
      Caption = 'Id'
    end
    object lblNome: TLabel
      Left = 16
      Top = 53
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblCPF: TLabel
      Left = 16
      Top = 83
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object lblSalario: TLabel
      Left = 16
      Top = 112
      Width = 35
      Height = 15
      Caption = 'Sal'#225'rio'
    end
    object lblValorINSS: TLabel
      Left = 16
      Top = 141
      Width = 53
      Height = 15
      Caption = 'Valor INSS'
    end
    object lblValorIR: TLabel
      Left = 16
      Top = 171
      Width = 39
      Height = 15
      Caption = 'Valor IR'
    end
    object edtId: TEdit
      Left = 88
      Top = 21
      Width = 33
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 88
      Top = 50
      Width = 361
      Height = 23
      TabOrder = 1
    end
    object edtSalario: TEdit
      Left = 88
      Top = 109
      Width = 85
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      OnExit = edtSalarioExit
      OnKeyPress = edtSalarioKeyPress
    end
    object edtINSS: TEdit
      Left = 88
      Top = 138
      Width = 85
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      OnExit = edtINSSExit
    end
    object edtIR: TEdit
      Left = 88
      Top = 168
      Width = 85
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      OnExit = edtIRExit
    end
    object edtCPF: TMaskEdit
      Left = 88
      Top = 80
      Width = 85
      Height = 23
      EditMask = '999\.999\.999\-99;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '   .   .   -  '
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 459
    Width = 532
    Height = 45
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 458
    ExplicitWidth = 528
    DesignSize = (
      532
      45)
    object grbBotoes: TGroupBox
      Left = 23
      Top = 9
      Width = 482
      Height = 26
      Anchors = [akTop, akBottom]
      ShowFrame = False
      TabOrder = 0
      ExplicitLeft = 21
      object btnNovo: TButton
        Left = 1
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnPesquisar: TButton
        Left = 82
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = btnPesquisarClick
      end
      object btnEditar: TButton
        Left = 163
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 2
        OnClick = btnEditarClick
      end
      object btnCancelar: TButton
        Left = 244
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
      object btnExcluir: TButton
        Left = 325
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnSalvar: TButton
        Left = 406
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 5
        OnClick = btnSalvarClick
      end
    end
  end
  object grbDependentes: TGroupBox
    Left = 0
    Top = 201
    Width = 532
    Height = 258
    Align = alClient
    Caption = 'Dependentes'
    TabOrder = 1
    ExplicitWidth = 528
    ExplicitHeight = 257
    DesignSize = (
      532
      258)
    object grdDependentes: TDBGrid
      Left = 14
      Top = 24
      Width = 407
      Height = 228
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dscDependentes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALCULA_IR_SIMNAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALCULA_INSS_SIMNAO'
          Visible = True
        end>
    end
    object btnInserirDependente: TBitBtn
      Left = 427
      Top = 25
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Inserir'
      TabOrder = 1
      OnClick = btnInserirDependenteClick
      ExplicitLeft = 423
    end
    object btnAtualizarDependente: TBitBtn
      Left = 427
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = btnAtualizarDependenteClick
      ExplicitLeft = 423
    end
    object btnRemoverDependente: TBitBtn
      Left = 427
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Remover'
      TabOrder = 3
      OnClick = btnRemoverDependenteClick
      ExplicitLeft = 423
    end
  end
  object cdsDependentes: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'idxDependente'
        Fields = 'ID_FUNCIONARIO;ID;NOME'
      end>
    IndexName = 'idxDependente'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsDependentesCalcFields
    Left = 200
    Top = 273
    object cdsDependentesID_FUNCIONARIO: TIntegerField
      DisplayLabel = 'Id Funcion'#225'rio'
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsDependentesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object cdsDependentesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 80
    end
    object cdsDependentesCALCULA_IR: TIntegerField
      FieldName = 'CALCULA_IR'
    end
    object cdsDependentesCALCULA_INSS: TIntegerField
      FieldName = 'CALCULA_INSS'
    end
    object cdsDependentesCALCULA_IR_SIMNAO: TStringField
      DisplayLabel = 'Calcula IR'
      FieldKind = fkCalculated
      FieldName = 'CALCULA_IR_SIMNAO'
      Size = 3
      Calculated = True
    end
    object cdsDependentesCALCULA_INSS_SIMNAO: TStringField
      DisplayLabel = 'Calcula INSS'
      FieldKind = fkCalculated
      FieldName = 'CALCULA_INSS_SIMNAO'
      Size = 3
      Calculated = True
    end
  end
  object dscDependentes: TDataSource
    DataSet = cdsDependentes
    Left = 304
    Top = 273
  end
end
