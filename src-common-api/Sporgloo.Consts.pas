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
