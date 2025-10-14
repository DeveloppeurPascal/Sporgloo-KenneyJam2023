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
  File last update : 2025-10-14T10:30:44.113+02:00
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
