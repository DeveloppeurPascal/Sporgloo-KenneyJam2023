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
  Signature : 0ab8a1048c45dc5a6fe5e244ce25a4b0faea2a4d
  ***************************************************************************
*)

unit Sporgloo.Utils;

interface

/// <summary>
/// Generate the ServerAuthKey used in REGISTER message between the game client and the server
/// </summary>
function GetServerAuthKey(DeviceID: string): string;

/// <summary>
/// Generate the TokenID used in LOGIN message between the game client and the server
/// </summary>
function GetTokenID(PlayerID, DeviceID, DeviceAuthKey: string): string;

implementation

uses
  System.Types,
  Olf.RTL.CryptDecrypt;

var
  Password: string;
  Keys: TByteDynArray;

function GetServerAuthKey(DeviceID: string): string;
var
  s: string;
begin
  s := DeviceID + Password;
  result := s;
  // TODO :  result := TOlfCryptDecrypt.XORCrypt(s, Keys);
end;

function GetTokenID(PlayerID, DeviceID, DeviceAuthKey: string): string;
var
  s: string;
begin
  s := PlayerID + DeviceID + DeviceAuthKey + Password;
  result := s;
  // TODO :  result := TOlfCryptDecrypt.XORCrypt(s, Keys);
end;

initialization

{$IFDEF RELEASE}
{$I '..\_PRIVATE\src\LoginGamePassword.inc'}
{$I '..\_PRIVATE\src\LoginGameXORKey.inc'}
{$ELSE}
{$I 'LoginGamePassword.inc'}
{$I 'LoginGameXORKey.inc'}
{$ENDIF}

end.
