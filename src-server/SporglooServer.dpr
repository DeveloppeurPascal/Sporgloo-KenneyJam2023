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
  Signature : df73ead06a15a2e61e0b404997ecae294d2efec7
  ***************************************************************************
*)

program SporglooServer;

{$APPTYPE CONSOLE}
{$R *.res}

uses
{$IFDEF LINUX}
  Posix.Stdlib,
  Posix.SysStat,
  Posix.SysTypes,
  Posix.Unistd,
  Posix.Signal,
  Posix.Fcntl,
{$ENDIF}
  System.SysUtils,
  Sporgloo.API.Messages in '..\src-common-api\Sporgloo.API.Messages.pas',
  Sporgloo.Types in '..\src-common-api\Sporgloo.Types.pas',
  Sporgloo.Database in '..\src-common-api\Sporgloo.Database.pas',
  Sporgloo.Server in 'Sporgloo.Server.pas',
  Sporgloo.Consts in '..\src-common-api\Sporgloo.Consts.pas',
  Olf.Net.Socket.Messaging
    in '..\lib-externes\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  Olf.RTL.Streams in '..\lib-externes\librairies\src\Olf.RTL.Streams.pas',
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  Olf.RTL.Maths.Conversions
    in '..\lib-externes\librairies\src\Olf.RTL.Maths.Conversions.pas',
  uGameData in 'uGameData.pas',
  Sporgloo.Messaging in 'Sporgloo.Messaging.pas',
  Olf.RTL.CryptDecrypt
    in '..\lib-externes\librairies\src\Olf.RTL.CryptDecrypt.pas',
  Sporgloo.Utils in '..\src-common-api\Sporgloo.Utils.pas',
  Olf.RTL.GenRandomID
    in '..\lib-externes\librairies\src\Olf.RTL.GenRandomID.pas';

{$IFDEF LINUX}

const
  // Missing from linux/StdlibTypes.inc !!! <stdlib.h>
  EXIT_FAILURE = 1;
  EXIT_SUCCESS = 0;

var
  pid: pid_t;
  fid: Integer;
  idx: Integer;
  running: Boolean;

procedure HandleSignals(SigNum: Integer); cdecl;
begin
  case SigNum of
    SIGTERM:
      begin
        running := False;
      end;
    SIGHUP:
      begin
        // syslog(LOG_NOTICE, 'daemon: reloading config');
        // Reload configuration
      end;
  end;
end;

{$ENDIF}

procedure StartServer(const Port: word);
var
  GameServer: TSporglooServer;
begin
  GameServer := TSporglooServer.Create('0.0.0.0', Port);
  try
    // TODO : change IP and port depending on the server
    // TODO : check if IPv6 is available and open a listening server for it too
    GameServer.Listen;
  finally
    GameServer.Free;
  end;
end;

var
  Port: Integer;
  paramvalue: string;

begin
  SporglooProjectType := TSporglooProjectType.Serveur;

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
  try
    if findcmdlineswitch('h') then
    begin
      Writeln('Sporgloo Server');
      Writeln('(c) 2023-2024 Patrick Prémartin');
      Writeln('');
      Writeln('-h => display this help');
      Writeln('-port number => port number to listen (' +
        CDefaultServerPort.ToString + ' by default)');
{$IFDEF LINUX}
      Writeln('-daemon => start the server as Linux daemon');
{$ENDIF}
    end
    else
    begin
      if findcmdlineswitch('port', paramvalue, true, [clstValueNextParam]) then
        Port := paramvalue.ToInteger
      else
        Port := CDefaultServerPort;

{$IFDEF LINUX}
      // Want to understand how to create a Linux daemon ?
      // Look at Paolo Rossi blog :
      // https://blog.paolorossi.net/building-a-real-linux-daemon-with-delphi-part-1/
      // https://blog.paolorossi.net/building-a-real-linux-daemon-with-delphi-part-2/
      if findcmdlineswitch('daemon') then
      begin
        // openlog(nil, LOG_PID or LOG_NDELAY, LOG_DAEMON);
        try
          if getppid() > 1 then
          begin
            pid := fork();
            if pid < 0 then
              raise exception.Create('Error forking the process');

            if pid > 0 then
              Halt(EXIT_SUCCESS);

            if setsid() < 0 then
              raise exception.Create
                ('Impossible to create an independent session');

            Signal(SIGCHLD, TSignalHandler(SIG_IGN));
            Signal(SIGHUP, HandleSignals);
            Signal(SIGTERM, HandleSignals);

            pid := fork();
            if pid < 0 then
              raise exception.Create('Error forking the process');

            if pid > 0 then
              Halt(EXIT_SUCCESS);

            for idx := sysconf(_SC_OPEN_MAX) downto 0 do
              __close(idx);

            fid := __open('/dev/null', O_RDWR);
            dup(fid);
            dup(fid);

            umask(027);

            chdir('/');
          end;

          running := true;

          StartServer(Port);

          ExitCode := EXIT_SUCCESS;
        except
          on E: exception do
          begin
            // syslog(LOG_ERR, 'Error: ' + E.Message);
            ExitCode := EXIT_FAILURE;
          end;
        end;

        // syslog(LOG_NOTICE, 'daemon stopped');
        // closelog();
      end
      else
{$ENDIF}
        StartServer(Port);
    end;

  except
    on E: exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
