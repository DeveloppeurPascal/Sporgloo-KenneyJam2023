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
  Signature : f1026d2805ddfea6dfb2d8e1db7943d33c92bfb9
  ***************************************************************************
*)

unit cYellowMenuButton;

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
  Olf.FMX.TextImageFrame;

type
  TcadYellowMenuButton = class(TFrame)
    rUp: TRectangle;
    rDown: TRectangle;
    txtImage: TOlfFMXTextImageFrame;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FrameMouseLeave(Sender: TObject);
  private
    FisDown: boolean;
    procedure SetisDown(const Value: boolean);
  protected
    function GetImageIndexOfUnknowChar(Sender: TOlfFMXTextImageFrame;
      AChar: char): integer;
  public
    property isDown: boolean read FisDown write SetisDown;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

uses
  udmAdobeStock_440583506;

constructor TcadYellowMenuButton.Create(AOwner: TComponent);
begin
  inherited;
  isDown := false;
  txtImage.Font := dmAdobeStock_440583506.ImageList;
  txtImage.OnGetImageIndexOfUnknowChar := GetImageIndexOfUnknowChar;
end;

procedure TcadYellowMenuButton.FrameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  isDown := true;
end;

procedure TcadYellowMenuButton.FrameMouseLeave(Sender: TObject);
begin
  isDown := false;
end;

procedure TcadYellowMenuButton.FrameMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  isDown := false;
end;

function TcadYellowMenuButton.GetImageIndexOfUnknowChar
  (Sender: TOlfFMXTextImageFrame; AChar: char): integer;
begin
  result := Sender.getImageIndexOfChar('_' + AChar);
end;

procedure TcadYellowMenuButton.SetisDown(const Value: boolean);
begin
  FisDown := Value;
  rDown.Visible := FisDown;
  rUp.Visible := not FisDown;
  txtImage.height := rDown.height - 20;
  if rDown.Visible then
    txtImage.Margins.top := 4
  else
    txtImage.Margins.top := 0;
end;

end.
