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
  Signature : cc5a8d59e01102e46c3e602b2d9bd86dd77b09e8
  ***************************************************************************
*)

unit cShowMessageBox;

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
  FMX.Objects,
  cYellowMenuButton;

type
  TcadShowMessageBox = class(TcadGrayBox)
    lButtons: TLayout;
    btnOk: TcadYellowMenuButton;
    Text1: TText;
    procedure btnOkClick(Sender: TObject);
  private
  protected
    FOnClick: TProc;
  public
    class procedure ShowModal(const ACurForm: TForm; const Text: string;
      const OnClick: TProc = nil);
  end;

implementation

{$R *.fmx}

procedure TcadShowMessageBox.btnOkClick(Sender: TObject);
begin
  if assigned(FOnClick) then
    FOnClick;
  tthread.ForceQueue(nil,
    procedure
    begin
      if assigned(TagObject) and (TagObject is trectangle) then
        TagObject.free;
      self.free;
    end);
end;

class procedure TcadShowMessageBox.ShowModal(const ACurForm: TForm;
const Text: string; const OnClick: TProc);
var
  smb: TcadShowMessageBox;
  r: trectangle;
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

  smb := TcadShowMessageBox.Create(ACurForm);
  smb.name := '';
  smb.TagObject := r;
  smb.Parent := ACurForm;
  smb.btnOk.txtImage.Text := 'Ok';
  smb.Text1.Text := Text;
  smb.FOnClick := OnClick;

  smb.AutoHeight;
end;

end.
