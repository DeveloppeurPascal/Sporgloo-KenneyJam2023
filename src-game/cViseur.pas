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
  Signature : eee3523ab1c999c5d02fcc385152c6c5e9854b1d
  ***************************************************************************
*)

unit cViseur;

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
  FMX.Objects;

type
  TcadViseur = class(TFrame)
    Image1: TImage;
  private
  public
    procedure AfterConstruction; override;
  end;

implementation

{$R *.fmx}

uses
  Olf.Skia.SVGToBitmap,
  USVGUserInterface,
  uSVGRegister;

{ TcadViseur }

procedure TcadViseur.AfterConstruction;
begin
  inherited;

  tthread.forcequeue(nil,
    procedure
    begin
      Image1.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(SVGUserInterfaceListIndex,
        CSVGTargetRoundB, round(Image1.Width), round(Image1.height),
        Image1.Bitmap.bitmapscale));
    end);
end;

end.
