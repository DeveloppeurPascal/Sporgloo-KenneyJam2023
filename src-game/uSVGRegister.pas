(* C2PP
  ***************************************************************************

  Sporgloo

  Copyright 2023-2025 Patrick PREMARTIN under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://sporgloo.gamolf.fr

  Project site :
  https://github.com/DeveloppeurPascal/Sporgloo-KenneyJam2023

  ***************************************************************************
  File last update : 2025-10-14T10:30:44.118+02:00
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
