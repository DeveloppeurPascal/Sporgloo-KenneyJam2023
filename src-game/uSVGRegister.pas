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
  File last update : 2026-06-02T08:16:05.214+02:00
  Signature : bf9c3bd730e4821cd13915afcede310f8d1fdb22
  ***************************************************************************
*)

unit uSVGRegister;

interface

var
  /// <summary>
  /// List index of registered SVG backgrounds in TOlfSVGBitmapList
  /// </summary>
  SVGBackgroundsListIndex,
  /// <summary>
  /// List index of registered SVG items in TOlfSVGBitmapList
  /// </summary>
  SVGItemsListIndex,
  /// <summary>
  /// List index of registered SVG characters in TOlfSVGBitmapList
  /// </summary>
  SVGPersosListIndex,
  /// <summary>
  /// List index of registered SVG trees in TOlfSVGBitmapList
  /// </summary>
  SVGTreesListIndex,
  /// <summary>
  /// List index of registered SVG user interface items in TOlfSVGBitmapList
  /// </summary>
  SVGUserInterfaceListIndex: word;

implementation

uses
  Olf.Skia.SVGToBitmap,
  USVGBackgrounds,
  USVGItems,
  USVGPersos,
  USVGTrees,
  USVGUserInterface;

procedure Register;
begin
  SVGBackgroundsListIndex := TOlfSVGBitmapList.AddAList;
  for var i := 0 to length(SVGBackgrounds) - 1 do
    TOlfSVGBitmapList.AddItemAt(SVGBackgroundsListIndex, i, SVGBackgrounds[i]);

  SVGItemsListIndex := TOlfSVGBitmapList.AddAList;
  for var i := 0 to length(SVGitems) - 1 do
    TOlfSVGBitmapList.AddItemAt(SVGItemsListIndex, i, SVGitems[i]);

  SVGPersosListIndex := TOlfSVGBitmapList.AddAList;
  for var i := 0 to length(SVGPersos) - 1 do
    TOlfSVGBitmapList.AddItemAt(SVGPersosListIndex, i, SVGPersos[i]);

  SVGTreesListIndex := TOlfSVGBitmapList.AddAList;
  for var i := 0 to length(SVGtrees) - 1 do
    TOlfSVGBitmapList.AddItemAt(SVGTreesListIndex, i, SVGtrees[i]);

  SVGUserInterfaceListIndex := TOlfSVGBitmapList.AddAList;
  for var i := 0 to length(SVGUserInterface) - 1 do
    TOlfSVGBitmapList.AddItemAt(SVGUserInterfaceListIndex, i,
      SVGUserInterface[i]);
end;

initialization

Register;

end.
