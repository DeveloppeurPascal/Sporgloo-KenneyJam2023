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
