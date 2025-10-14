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
  File last update : 2025-10-14T10:30:44.103+02:00
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
