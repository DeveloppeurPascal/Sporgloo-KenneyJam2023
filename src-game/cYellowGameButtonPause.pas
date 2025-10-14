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
