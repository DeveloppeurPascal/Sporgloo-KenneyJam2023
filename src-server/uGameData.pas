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
  File last update : 2026-06-02T08:16:05.214+02:00
  Signature : 283637b222913b87c602dc348fc7e2902b14d733
  ***************************************************************************
*)

unit uGameData;

interface

uses
  Sporgloo.Database;

type
  /// <summary>
  /// This TGameData in server project is empty.
  /// It's only there to compile common units.
  /// </summary>
  TGameData = class
  private
  protected
  public
    OtherPlayers: TSporglooPlayersList;
    class function Current: TGameData;
    procedure GetInfosPlayer(const PlayerID: string);
  end;

implementation

{ TGameData }

class function TGameData.Current: TGameData;
begin
  result := nil;
end;

procedure TGameData.GetInfosPlayer(const PlayerID: string);
begin
  //
end;

end.
