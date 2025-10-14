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
  Signature : f9c9312adfc05c491fd9e27ebe18f94a34f01edb
  ***************************************************************************
*)

unit cYellowGameButtonMusicOnOff;

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
  TcadYellowGameButtonMusicOnOff = class(TcadYellowGameButton)
  private
  protected
    procedure SetGlyphImage(Const MusicOnOff: boolean);
  public
    procedure AfterConstruction; override;
  end;

var
  cadYellowGameButtonMusicOnOff: TcadYellowGameButtonMusicOnOff;

implementation

{$R *.fmx}

uses
  System.Messaging,
  Sporgloo.Messaging,
  uConfig,
  Olf.Skia.SVGToBitmap,
  USVGUserInterface,
  uSVGRegister;

{ TcadYellowGameButtonMusicOnOff }

procedure TcadYellowGameButtonMusicOnOff.AfterConstruction;
begin
  inherited;

  tthread.ForceQueue(nil,
    procedure
    begin
      SetGlyphImage(TConfig.Current.BackgroundMusic);
    end);

  TMessageManager.DefaultManager.SubscribeToMessage
    (TBackgroundMusicStatusMessage,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      if (M is TBackgroundMusicStatusMessage) then
        SetGlyphImage((M as TBackgroundMusicStatusMessage).Value);
    end);
end;

procedure TcadYellowGameButtonMusicOnOff.SetGlyphImage(const MusicOnOff
  : boolean);
var
  bmp: TBitmap;
begin
  if MusicOnOff then
    bmp := TOlfSVGBitmapList.Bitmap(SVGUserInterfaceListIndex, CSVGMusicOff,
      round(imgUp.Width), round(imgUp.height), imgUp.Bitmap.bitmapscale)
  else
    bmp := TOlfSVGBitmapList.Bitmap(SVGUserInterfaceListIndex, CSVGMusicOn,
      round(imgUp.Width), round(imgUp.height), imgUp.Bitmap.bitmapscale);

  imgUp.Bitmap.Assign(bmp);
  imgdown.Bitmap.Assign(bmp);
end;

end.
