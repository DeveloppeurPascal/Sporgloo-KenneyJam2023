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
  File last update : 2025-10-14T10:30:44.113+02:00
  Signature : 8f83d2df3ed4b5d00c2cd900045893e032a3785e
  ***************************************************************************
*)

unit uBackgroundMusic;

interface

type
  TBackgroundMusic = class
  private
    class var FCurrent: TBackgroundMusic;
    class function GetCurrent: TBackgroundMusic; static;
  protected
  public
    class property Current: TBackgroundMusic read GetCurrent;
    constructor Create;
    procedure OnOff(aOn: boolean);
    procedure Volume(AVolume: integer);
  end;

implementation

uses
  System.SysUtils,
  System.IOUtils,
  uConfig,
  Gamolf.FMX.MusicLoop,
  System.Classes,
  System.Messaging,
  Sporgloo.Messaging;

{ TBackgroundMusic }

constructor TBackgroundMusic.Create;
var
  folder: string;
begin
  inherited;

{$IF defined(ANDROID)}
  // deploy in .\assets\internal\
  folder := System.IOUtils.tpath.GetDocumentsPath;
{$ELSEIF defined(MSWINDOWS)}
  // deploy in ;\
{$IFDEF DEBUG}
  folder := '..\..\..\_PRIVATE\music\JoelSteudlerMusic_com\';
{$ELSE}
  folder := extractfilepath(paramstr(0));
{$ENDIF}
{$ELSEIF defined(IOS)}
  // deploy in .\
  folder := extractfilepath(paramstr(0));
{$ELSEIF defined(MACOS)}
  // deploy in Contents\MacOS
  folder := extractfilepath(paramstr(0));
{$ELSEIF Defined(LINUX)}
  folder := extractfilepath(paramstr(0));
{$ELSE}
{$MESSAGE FATAL 'OS non supporté'}
{$ENDIF}
  TMusicLoop.Current.Load(tpath.combine(folder, 'Mysterious_Passage_126s.wav'));

  Volume(TConfig.Current.BackgroundMusicVolume);
end;

class function TBackgroundMusic.GetCurrent: TBackgroundMusic;
begin
  if not assigned(FCurrent) then
    FCurrent := TBackgroundMusic.Create;

  result := FCurrent;
end;

procedure TBackgroundMusic.OnOff(aOn: boolean);
begin
  if aOn then
    TMusicLoop.Current.Play
  else
    TMusicLoop.Current.Stop;

  if aOn <> TConfig.Current.BackgroundMusic then
    TConfig.Current.BackgroundMusic := aOn;

  tthread.ForceQueue(nil,
    procedure
    begin
      TMessageManager.DefaultManager.SendMessage(nil,
        TBackgroundMusicStatusMessage.Create(aOn));
    end);
end;

procedure TBackgroundMusic.Volume(AVolume: integer);
begin
  if AVolume in [0 .. 100] then
  begin
    TMusicLoop.Current.Volume := AVolume;
    if TConfig.Current.BackgroundMusicVolume <> AVolume then
      TConfig.Current.BackgroundMusicVolume := AVolume;
  end;
end;

initialization

TBackgroundMusic.FCurrent := nil;

finalization

TBackgroundMusic.FCurrent.free;

end.
