object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'TMDB - The Movie Database'
  ClientHeight = 660
  ClientWidth = 967
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
  object shpContaBase: TShape
    Left = 8
    Top = 8
    Width = 73
    Height = 73
    Brush.Color = 4532238
    Shape = stCircle
  end
  object shpContaDados: TShape
    Left = 40
    Top = 8
    Width = 219
    Height = 74
    Brush.Color = 4532238
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object shpImagemConta: TShape
    Left = 12
    Top = 12
    Width = 65
    Height = 64
    Brush.Color = 14988289
    Shape = stCircle
  end
  object shpDetalhe: TShape
    Left = 72
    Top = 59
    Width = 179
    Height = 17
    Brush.Style = bsBDiagonal
    Pen.Mode = pmMerge
    Shape = stRoundRect
  end
  object lblBemVindo: TLabel
    Left = 83
    Top = 12
    Width = 65
    Height = 15
    Caption = 'Bem-vindo, '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblNome: TLabel
    Left = 83
    Top = 33
    Width = 30
    Height = 15
    Caption = 'Guest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object shpFilmesPopulares: TShape
    Left = 4
    Top = 99
    Width = 960
    Height = 196
    Brush.Color = 4138253
  end
  object sbxPopulares: TScrollBox
    Left = 8
    Top = 103
    Width = 953
    Height = 188
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    object Panel20: TPanel
      Left = 2223
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 0
      object VirtualImage20: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator20: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel19: TPanel
      Left = 2106
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 1
      object VirtualImage19: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator19: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel18: TPanel
      Left = 1989
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 2
      object VirtualImage18: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator18: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel17: TPanel
      Left = 1872
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 3
      object VirtualImage17: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator17: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel16: TPanel
      Left = 1755
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 4
      object VirtualImage16: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator16: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel15: TPanel
      Left = 1638
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 5
      object VirtualImage15: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator15: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel14: TPanel
      Left = 1521
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 6
      object VirtualImage14: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator14: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel13: TPanel
      Left = 1404
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 7
      object VirtualImage13: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator13: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel12: TPanel
      Left = 1287
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 8
      object VirtualImage12: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator12: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel11: TPanel
      Left = 1170
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 9
      object VirtualImage11: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator11: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel10: TPanel
      Left = 1053
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 10
      object VirtualImage10: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator10: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel9: TPanel
      Left = 936
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 11
      object VirtualImage9: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator9: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel8: TPanel
      Left = 819
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 12
      object VirtualImage8: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator8: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel7: TPanel
      Left = 702
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 13
      object VirtualImage7: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator7: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel6: TPanel
      Left = 585
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 14
      object VirtualImage6: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator6: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel5: TPanel
      Left = 468
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 15
      object VirtualImage5: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator5: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel4: TPanel
      Left = 351
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 16
      object VirtualImage4: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator4: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel3: TPanel
      Left = 234
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 17
      object VirtualImage3: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator3: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel2: TPanel
      Left = 117
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 18
      object VirtualImage2: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator2: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 117
      Height = 167
      Align = alLeft
      TabOrder = 19
      object VirtualImage1: TVirtualImage
        Left = 1
        Top = 1
        Width = 115
        Height = 165
        Align = alClient
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = -1
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 135
        ExplicitHeight = 130
      end
      object ActivityIndicator1: TActivityIndicator
        Left = 43
        Top = 68
        Animate = True
        FrameDelay = 31
        IndicatorType = aitSectorRing
      end
    end
  end
  object btnMaisPopulares: TButton
    Left = 884
    Top = 297
    Width = 75
    Height = 25
    Caption = 'Mais...'
    TabOrder = 1
  end
  object ImageCollection1: TImageCollection
    Images = <>
    Left = 864
    Top = 8
  end
end
