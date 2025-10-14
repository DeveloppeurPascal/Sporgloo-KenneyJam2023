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
  Signature : 8e7a3103d5b80c32e71c121bd2db2d080ed42df1
  ***************************************************************************
*)

unit cLifeLevel;

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
  FMX.ImgList,
  Olf.FMX.TextImageFrame,
  FMX.Objects;

type
  TcadLifeLevel = class(TFrame)
    Rectangle1: TRectangle;
    OlfFMXTextImageFrame1: TOlfFMXTextImageFrame;
    Image1: TImage;
    procedure FrameResized(Sender: TObject);
  private
    FLifeLevel: int64;
    procedure SetLifeLevel(const Value: int64);
  public
    procedure RefreshImage;
    procedure AfterConstruction; override;
    property LifeLevel: int64 read FLifeLevel write SetLifeLevel;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

uses
  udmAdobeStock_257147901,
  Olf.Skia.SVGToBitmap,
  USVGItems,
  uSVGRegister;

{ TFrame1 }

procedure TcadLifeLevel.AfterConstruction;
begin
  inherited;

  tthread.forcequeue(nil,
    procedure
    begin
      RefreshImage;
    end);
end;

constructor TcadLifeLevel.Create(AOwner: TComponent);
begin
  inherited;
  OlfFMXTextImageFrame1.Font := dmAdobeStock_257147901.ImageList;
  LifeLevel := 0;
end;

procedure TcadLifeLevel.FrameResized(Sender: TObject);
begin
  Image1.height := height - Image1.margins.left - Image1.margins.Right;
  Image1.Width := Image1.height;
  RefreshImage;
end;

procedure TcadLifeLevel.RefreshImage;
begin
  Image1.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(SVGItemsListIndex, CSVGCoeur,
    round(Image1.Width), round(Image1.height), Image1.Bitmap.bitmapscale));
end;

procedure TcadLifeLevel.SetLifeLevel(const Value: int64);
begin
  FLifeLevel := Value;
  OlfFMXTextImageFrame1.Text := FLifeLevel.ToString;
  Width := Image1.margins.left + Image1.Width + Image1.margins.Right +
    OlfFMXTextImageFrame1.margins.left + OlfFMXTextImageFrame1.Width +
    OlfFMXTextImageFrame1.margins.Right;
end;

end.
