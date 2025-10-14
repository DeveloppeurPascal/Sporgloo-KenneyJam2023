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
  File last update : 2025-10-14T10:30:44.096+02:00
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
