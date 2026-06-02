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
  Signature : afd26d5ea65b13f95a3b7edc89c32c70e0675388
  ***************************************************************************
*)

unit cYellowGameButton;

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
  FMX.Objects,
  FMX.Effects;

type
  TcadYellowGameButton = class(TFrame)
    rUp: TRectangle;
    rDown: TRectangle;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    imgDown: TImage;
    imgUp: TImage;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FrameMouseLeave(Sender: TObject);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FisDown: boolean;
    procedure SetisDown(const Value: boolean);
  protected
    procedure onButtonDown; virtual;
    procedure onButtonUp; virtual;
  public
    property isDown: boolean read FisDown write SetisDown;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

constructor TcadYellowGameButton.Create(AOwner: TComponent);
begin
  inherited;
  isDown := false;
end;

procedure TcadYellowGameButton.FrameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  isDown := true;
end;

procedure TcadYellowGameButton.FrameMouseLeave(Sender: TObject);
begin
  isDown := false;
end;

procedure TcadYellowGameButton.FrameMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  isDown := false;
end;

procedure TcadYellowGameButton.onButtonDown;
begin
  // Nothing to do there
end;

procedure TcadYellowGameButton.onButtonUp;
begin
  // Nothing to do there
end;

procedure TcadYellowGameButton.SetisDown(const Value: boolean);
begin
  FisDown := Value;
  rDown.Visible := FisDown;
  rUp.Visible := not FisDown;
  if FisDown then
    onButtonDown
  else
    onButtonUp;
end;

end.
