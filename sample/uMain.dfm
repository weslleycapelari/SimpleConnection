object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Connection Sample'
  ClientHeight = 313
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Reference Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 278
    Width = 433
    Height = 35
    Align = alBottom
    TabOrder = 0
    object btnConnect: TButton
      AlignWithMargins = True
      Left = 354
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Connect'
      TabOrder = 0
      OnClick = btnConnectClick
    end
    object btnQuery: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Query'
      TabOrder = 1
      OnClick = btnQueryClick
    end
  end
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 278
    Align = alClient
    TabOrder = 1
    object pnlFields1: TPanel
      Left = 1
      Top = 1
      Width = 431
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblDriver: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 58
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Driver'
        Layout = tlCenter
      end
      object cbbDriver: TComboBox
        AlignWithMargins = True
        Left = 67
        Top = 3
        Width = 361
        Height = 23
        Align = alClient
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Firebird'
        Items.Strings = (
          'Firebird'
          'MySQL')
      end
    end
    object pnlFields2: TPanel
      Left = 1
      Top = 28
      Width = 431
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblHostname: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 58
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Hostname'
        Layout = tlCenter
      end
      object lblPort: TLabel
        AlignWithMargins = True
        Left = 347
        Top = 3
        Width = 23
        Height = 21
        Align = alRight
        Caption = 'Port'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object edtHostname: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 3
        Width = 274
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'localhost'
        ExplicitHeight = 23
      end
      object edtPort: TEdit
        AlignWithMargins = True
        Left = 376
        Top = 3
        Width = 52
        Height = 21
        Align = alRight
        TabOrder = 1
        Text = '3050'
        ExplicitHeight = 23
      end
    end
    object pnlFields3: TPanel
      Left = 1
      Top = 55
      Width = 431
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblDatabase: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 58
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Database'
        Layout = tlCenter
      end
      object edtDatabase: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 3
        Width = 361
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = '../../database/examples.fdb'
        ExplicitHeight = 23
      end
    end
    object pnlFields21: TPanel
      Left = 1
      Top = 82
      Width = 431
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object lblUsername: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 58
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Username'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object lblPassword: TLabel
        AlignWithMargins = True
        Left = 220
        Top = 3
        Width = 54
        Height = 21
        Align = alRight
        Caption = 'Password'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object edtUsername: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 3
        Width = 147
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'SYSDBA'
        ExplicitHeight = 23
      end
      object edtPassword: TEdit
        AlignWithMargins = True
        Left = 280
        Top = 3
        Width = 148
        Height = 21
        Align = alRight
        PasswordChar = '*'
        TabOrder = 1
        Text = 'masterkey'
        ExplicitHeight = 23
      end
    end
    object pnlFields31: TPanel
      Left = 1
      Top = 109
      Width = 431
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object lblLibrary: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 58
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Library'
        Layout = tlCenter
      end
      object edtLibrary: TEdit
        AlignWithMargins = True
        Left = 67
        Top = 3
        Width = 361
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'fbclient.dll'
        ExplicitHeight = 23
      end
    end
    object mmoResult: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 139
      Width = 425
      Height = 135
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
  end
end
