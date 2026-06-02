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
  File last update : 2026-06-02T08:16:05.208+02:00
  Signature : 2975af7f9d4f05b7c268ca7d60acbc04b5735f27
  ***************************************************************************
*)

unit cStarsCount;

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
  FMX.Objects,
  Olf.FMX.TextImageFrame,
  FMX.ImgList;

type
  TcadStarsCount = class(TFrame)
    Rectangle1: TRectangle;
    OlfFMXTextImageFrame1: TOlfFMXTextImageFrame;
    Image1: TImage;
    procedure FrameResized(Sender: TObject);
  private
    FStarsCount: int64;
    procedure SetStarsCount(const Value: int64);
  public
    procedure RefreshImage;
    procedure AfterConstruction; override;
    property StarsCount: int64 read FStarsCount write SetStarsCount;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

uses
  udmAdobeStock_257147901,
  Olf.Skia.SVGToBitmap,
  USVGItems,
  uSVGRegister;

{ TcadStarsCount }

procedure TcadStarsCount.AfterConstruction;
begin
  inherited;

  tthread.forcequeue(nil,
    procedure
    begin
      RefreshImage;
    end);
end;

constructor TcadStarsCount.Create(AOwner: TComponent);
begin
  inherited;
  OlfFMXTextImageFrame1.Font := dmAdobeStock_257147901.ImageList;
  StarsCount := 0;
end;

procedure TcadStarsCount.FrameResized(Sender: TObject);
begin
  Image1.height := height - Image1.margins.left - Image1.margins.Right;
  Image1.Width := Image1.height;
  RefreshImage;
end;

procedure TcadStarsCount.RefreshImage;
begin
  Image1.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(SVGItemsListIndex, CSVGStar,
    round(Image1.Width), round(Image1.height), Image1.Bitmap.bitmapscale));
end;

procedure TcadStarsCount.SetStarsCount(const Value: int64);
begin
  FStarsCount := Value;
  OlfFMXTextImageFrame1.Text := FStarsCount.ToString;
  Width := Image1.margins.left + Image1.Width + Image1.margins.Right +
    OlfFMXTextImageFrame1.margins.left + OlfFMXTextImageFrame1.Width +
    OlfFMXTextImageFrame1.margins.Right;
end;

end.
