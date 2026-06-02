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
  File last update : 2026-06-02T08:16:05.198+02:00
  Signature : d174360dbedb15a972e0f097506f4547692314ea
  ***************************************************************************
*)

unit Sporgloo.Consts;

interface

const
  CAPIVersion = 20240623;

  CDefaultServerPort = 8080;

  CSporglooTileForest = 0;
  CSporglooTilePath = 1;
  CSporglooTileStar = 2;

  CSporglooTileSize = 64;

  /// <summary>
  /// Marge used to get the all map from the server (as a viewport left/right margin)
  /// </summary>
{$IFDEF DEBUG}
  CColMargins = 1;
{$ELSE}
  CColMargins = 3;
{$ENDIF}
  /// <summary>
  /// Marge used to get the all map from the server (as a viewport top/bottom margin)
  /// </summary>
{$IFDEF DEBUG}
  CRowMargins = 1;
{$ELSE}
  CRowMargins = 3;
{$ENDIF}
  CSporglooIDSize = 16;

  CStartStarsCount = 12;
  CStartLifeLevel = 24;
{$IFDEF DEBUG}
  CStartDistanceFromLastPlayer = 10;
{$ELSE}
  CStartDistanceFromLastPlayer = 50;
{$ENDIF}

type
{$SCOPEDENUMS ON}
  TSporglooErrorCode = (NoError = 0, WrongDeviceID = 1, WrongPlayerID = 2,
    WrongSessionID = 3, WrongAPIVersion = 4, UnknowPlayerID = 5,
    WrongDeviceForPlayerID = 6, UnknowSessionID = 7,
    WrongDeviceOrPlayerForSessionID = 8, PlayerMoveDenied = 9, WrongToken = 10);

implementation

end.
