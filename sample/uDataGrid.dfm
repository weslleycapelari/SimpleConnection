object FrmDataGrid: TFrmDataGrid
  Left = 0
  Top = 0
  Caption = 'Data Grid'
  ClientHeight = 478
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 478
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object dbgrdData: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 736
      Height = 470
      Align = alClient
      DataSource = dsData
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsData: TDataSource
    Left = 8
    Top = 8
  end
end
