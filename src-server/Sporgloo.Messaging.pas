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
