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
  File last update : 2026-06-02T08:16:05.208+02:00
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
