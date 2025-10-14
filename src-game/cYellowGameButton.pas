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
  File last update : 2025-10-14T10:30:44.108+02:00
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
