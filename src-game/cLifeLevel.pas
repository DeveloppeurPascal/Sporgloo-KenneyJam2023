(* C2PP
  ***************************************************************************

  Sporgloo
  Copyright (c) 2023-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://sporgloo.gamolf.fr

  Project site :
  https://codeberg.org/Gamolf/Sporgloo-KenneyJam2023

  ***************************************************************************
  File last update : 2026-06-02T08:16:05.198+02:00
  Signature : 8e7a3103d5b80c32e71c121bd2db2d080ed42df1
  ***************************************************************************
*)

unit cLifeLevel;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ImgList,
  Olf.FMX.TextImageFrame,
  FMX.Objects;

type
  TcadLifeLevel = class(TFrame)
    Rectangle1: TRectangle;
    OlfFMXTextImageFrame1: TOlfFMXTextImageFrame;
    Image1: TImage;
    procedure FrameResized(Sender: TObject);
  private
    FLifeLevel: int64;
    procedure SetLifeLevel(const Value: int64);
  public
    procedure RefreshImage;
    procedure AfterConstruction; override;
    property LifeLevel: int64 read FLifeLevel write SetLifeLevel;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

uses
  udmAdobeStock_257147901,
  Olf.Skia.SVGToBitmap,
  USVGItems,
  uSVGRegister;

{ TFrame1 }

procedure TcadLifeLevel.AfterConstruction;
begin
  inherited;

  tthread.forcequeue(nil,
    procedure
    begin
      RefreshImage;
    end);
end;

constructor TcadLifeLevel.Create(AOwner: TComponent);
begin
  inherited;
  OlfFMXTextImageFrame1.Font := dmAdobeStock_257147901.ImageList;
  LifeLevel := 0;
end;

procedure TcadLifeLevel.FrameResized(Sender: TObject);
begin
  Image1.height := height - Image1.margins.left - Image1.margins.Right;
  Image1.Width := Image1.height;
  RefreshImage;
end;

procedure TcadLifeLevel.RefreshImage;
begin
  Image1.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(SVGItemsListIndex, CSVGCoeur,
    round(Image1.Width), round(Image1.height), Image1.Bitmap.bitmapscale));
end;

procedure TcadLifeLevel.SetLifeLevel(const Value: int64);
begin
  FLifeLevel := Value;
  OlfFMXTextImageFrame1.Text := FLifeLevel.ToString;
  Width := Image1.margins.left + Image1.Width + Image1.margins.Right +
    OlfFMXTextImageFrame1.margins.left + OlfFMXTextImageFrame1.Width +
    OlfFMXTextImageFrame1.margins.Right;
end;

end.
