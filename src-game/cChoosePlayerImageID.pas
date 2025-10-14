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
  Signature : 5a5353983e0b4bad5a9b5e970071903b5af9feb3
  ***************************************************************************
*)

unit cChoosePlayerImageID;

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
  cGrayBox,
  FMX.Layouts,
  Olf.FMX.TextImageFrame,
  FMX.Objects;

type
  TcadChoosePlayerImageID = class(TcadGrayBox)
    OlfFMXTextImageFrame1: TOlfFMXTextImageFrame;
    Layout1: TLayout;
    FlowLayout1: TFlowLayout;
  private
  protected
    procedure SelfDestroy;
    procedure CharacterClick(Sender: TObject);
  public
    class procedure Execute(const ACurForm: TForm);
  end;

implementation

{$R *.fmx}

uses
  udmAdobeStock_257147901,
  USVGPersos,
  Olf.Skia.SVGToBitmap,
  uSVGRegister,
  Sporgloo.Consts,
  cYellowGameButton,
  uGameData;

{ TcadChoosePlayerImageID }

procedure TcadChoosePlayerImageID.CharacterClick(Sender: TObject);
begin
  if Sender is Timage then
  begin
    tgamedata.Current.player.ImageID := (Sender as Timage).tag;
    tgamedata.Current.APIClient.SendPlayerImageChanged
      (tgamedata.Current.session.SessionID, tgamedata.Current.player.ImageID);
    SelfDestroy;
  end;
end;

class procedure TcadChoosePlayerImageID.Execute(const ACurForm: TForm);
var
  smb: TcadChoosePlayerImageID;
  r: trectangle;
  i, ImageID: integer;
  bmp: TBitmap;
  img: Timage;
  h: single;
  c: tcontrol;
begin
  if not assigned(ACurForm) then
    raise exception.Create('Specify the parent form !');
  // TODO : intercepter ESC / RETURN (ou Joystick/télécommande) de la fiche parente pour déclencher le clic sur ce bouton

  r := trectangle.Create(ACurForm);
  r.Parent := ACurForm;
  r.Align := TAlignLayout.contents;
  r.Opacity := 0.6;
  r.HitTest := true;
  r.Stroke.Kind := tbrushkind.None;
  r.fill.Kind := tbrushkind.Solid;
  r.fill.Color := talphacolors.Lightgray;

  smb := TcadChoosePlayerImageID.Create(ACurForm);
  smb.TagObject := r;
  smb.Parent := ACurForm;

  smb.OlfFMXTextImageFrame1.Font := dmAdobeStock_257147901.ImageList;
  smb.OlfFMXTextImageFrame1.Text := 'Choose your look'.ToUpper;
  // TODO : à traduire
  // TODO : changer la fonte pour une avec majuscules et minuscules

  for ImageID := 0 to length(SVGPersos) - 1 do
  begin
    img := Timage.Create(smb);
    img.Parent := smb.FlowLayout1;
    img.Width := CSporglooTileSize;
    img.height := CSporglooTileSize;
    img.margins.top := 5;
    img.margins.Right := 5;
    img.margins.Bottom := 5;
    img.margins.Left := 5;
    bmp := TOlfSVGBitmapList.Bitmap(SVGPersosListIndex, ImageID,
      CSporglooTileSize, CSporglooTileSize, img.Bitmap.bitmapscale);
    img.Bitmap.Assign(bmp);
    img.HitTest := true;
    img.tag := ImageID;
    img.OnClick := smb.CharacterClick;
  end;

  h := 0;
  for i := 0 to smb.FlowLayout1.ChildrenCount - 1 do
    if smb.FlowLayout1.Children[i] is tcontrol then
    begin
      c := smb.FlowLayout1.Children[i] as tcontrol;
      if h < c.Position.y + c.height + c.margins.Bottom then
        h := c.Position.y + c.height + c.margins.Bottom;
    end;
  smb.FlowLayout1.height := h;

  smb.AutoHeight;
end;

procedure TcadChoosePlayerImageID.SelfDestroy;
begin
  tthread.ForceQueue(nil,
    procedure
    begin
      if assigned(TagObject) and (TagObject is trectangle) then
        TagObject.free;
      self.free;
    end);
end;

end.
