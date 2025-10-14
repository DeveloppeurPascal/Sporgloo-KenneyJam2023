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
  File last update : 2025-10-14T10:30:44.120+02:00
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
