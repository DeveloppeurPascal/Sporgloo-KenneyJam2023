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
  Signature : 7074b39f9dd7969cbe3e27eb6c052c7baa05c578
  ***************************************************************************
*)

unit cGrayBox;

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
  FMX.Layouts;

type
  TcadGrayBox = class(TFrame)
    rOutside: TRectangle;
    rBackground: TRectangle;
    sContent: TVertScrollBox;
  private
  public
    procedure AutoHeight;
  end;

implementation

{$R *.fmx}
{ TcadGrayBox }

procedure TcadGrayBox.AutoHeight;
var
  i: integer;
  h: single;
  c: tcontrol;
begin
  h := rOutside.Margins.Top + rOutside.Margins.Bottom + rBackground.Margins.Top
    + rBackground.Margins.Bottom;

  for i := 0 to rBackground.ChildrenCount - 1 do
    if (rBackground.Children[i] is tcontrol) then
    begin
      c := rBackground.Children[i] as tcontrol;
      if c.Visible then
        if c = sContent then
          h := h + c.Margins.Top + c.Margins.Bottom
        else
          h := h + c.Margins.Top + c.Height + c.Margins.Bottom;
    end;

  for i := 0 to sContent.Content.ChildrenCount - 1 do
    if (sContent.Content.Children[i] is tcontrol) then
    begin
      c := sContent.Content.Children[i] as tcontrol;
      if c.Visible then
        h := h + c.Margins.Top + c.Height + c.Margins.Bottom;
    end;

  if parent is tcustomform then
  begin
    if h > (parent as tcustomform).ClientHeight then
      h := (parent as tcustomform).ClientHeight;
  end
  else if parent is tcontrol then
  begin
    if h > (parent as tcontrol).Height then
      h := (parent as tcontrol).Height;
  end;
  Height := h;

  if parent is tcustomform then
  begin
    if width > (parent as tcustomform).ClientWidth then
      width := (parent as tcustomform).ClientWidth;
  end
  else if parent is tcontrol then
  begin
    if width > (parent as tcontrol).width then
      width := (parent as tcontrol).width;
  end;
end;

end.
