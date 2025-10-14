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
  File last update : 2025-10-14T10:30:44.118+02:00
  Signature : 578c59e8e9482c64f74d445fa66394f46124b68f
  ***************************************************************************
*)

unit Sporgloo.Messaging;

interface

/// <summary>
/// This unit is a server side unit for compilation compatibility with common
/// units between the server and the client. Don't use it for an other reason !
/// </summary>

uses
  System.Messaging,
  Sporgloo.Types;

type
  /// <summary>
  /// For COMPILATION reason in the server program, don't use this class !
  /// </summary>
  TPlayerCoinsCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

  /// <summary>
  /// For COMPILATION reason in the server program, don't use this class !
  /// </summary>
  TPlayerStarsCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

  /// <summary>
  /// For COMPILATION reason in the server program, don't use this class !
  /// </summary>
  TPlayerLivesCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

implementation

end.
