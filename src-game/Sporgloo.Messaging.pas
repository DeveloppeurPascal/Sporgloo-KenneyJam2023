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
