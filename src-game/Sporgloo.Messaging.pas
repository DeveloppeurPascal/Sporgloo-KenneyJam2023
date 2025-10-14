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
  File last update : 2025-10-14T10:30:44.098+02:00
  Signature : 1001fae0b3fea336d56ed22daa4c019749dd9f20
  ***************************************************************************
*)

unit Sporgloo.Messaging;

interface

uses
  System.Messaging,
  Sporgloo.Types,
  Sporgloo.Client,
  Sporgloo.Database;

type
  /// <summary>
  /// Sent when the client is connected to a server
  /// </summary>
  TServerConnectedMessage = class(TMessage<TSporglooClient>)
  end;

  /// <summary>
  /// Connection to the server has been lost
  /// </summary>
  TLostServerMessage = class(TMessage<TSporglooClient>)
  end;

  /// <summary>
  /// This message is sent by the client/server API to send
  /// the new TileID to the subscribers
  /// </summary>
  TMapCellUpdateMessage = class(TMessage<TSporglooMapCell>)
  end;

  /// <summary>
  /// Used to force the redraw of the map on screen
  /// </summary>
  TMapUpdateMessage = class(TMessage)
  end;

  /// <summary>
  /// Sent from the client or the server to close the loop and the connection
  /// </summary>
  TDisconnectMessage = class(TMessage)
  end;

  /// <summary>
  /// Sent when the server deny a player move.
  /// </summary>
  TPlayerMoveDeniedByTheServerMessage = class(TMessage)
  end;

  /// <summary>
  /// Sent when the coins count is changed. The UI must refresh score panel with the new value.
  /// </summary>
  TPlayerCoinsCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

  /// <summary>
  /// Sent when the stars count is changed. The UI must refresh stars count panel with the new value.
  /// </summary>
  TPlayerStarsCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

  /// <summary>
  /// Sent when the lives count is changed. The UI must refresh life level panel with the new value.
  /// </summary>
  TPlayerLivesCountUpdatedMessage = class(TMessage<TSporglooAPINumber>)
  end;

  /// <summary>
  /// Sent by the TBackgroundMusic class when the music status change (Play or Pause/Stop)
  /// </summary>
  TBackgroundMusicStatusMessage = class(TMessage<boolean>)
  end;

  /// <summary>
  /// The server answered to the LOGIN message.
  /// </summary>
  TLoginOKMessage = class(TMessage)
  end;

implementation

end.
