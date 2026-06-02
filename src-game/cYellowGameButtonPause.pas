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
  Signature : 9090e3c75ce5c7fff91ae15745ef1ec69be182c3
  ***************************************************************************
*)

unit cYellowGameButtonPause;

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
  cYellowGameButton,
  FMX.Effects,
  FMX.Objects;

type
  TcadYellowGameButtonPause = class(TcadYellowGameButton)
  private
  protected
  public
    procedure AfterConstruction; override;
  end;

var
  cadYellowGameButtonPause: TcadYellowGameButtonPause;

implementation

{$R *.fmx}

uses
  Olf.Skia.SVGToBitmap,
  USVGUserInterface,
  uSVGRegister;

{ TcadYellowGameButtonPause }

procedure TcadYellowGameButtonPause.AfterConstruction;
begin
  inherited;

  tthread.ForceQueue(nil,
    procedure
    var
      bmp: TBitmap;
    begin
      bmp := TOlfSVGBitmapList.Bitmap(SVGUserInterfaceListIndex, CSVGPause,
        round(imgUp.Width), round(imgUp.height), imgUp.Bitmap.bitmapscale);
      imgUp.Bitmap.Assign(bmp);
      imgdown.Bitmap.Assign(bmp);
    end);
end;

end.
