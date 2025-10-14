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
  Signature : a9b0b4810c96f7b004da681b2a25a43600ad621c
  ***************************************************************************
*)

program Sporgloo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  fMain in 'fMain.pas' {frmMain},
  Gamolf.FMX.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.Joystick.pas',
  Gamolf.FMX.MusicLoop in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.MusicLoop.pas',
  Gamolf.RTL.Joystick.DirectInput.Win in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.DirectInput.Win.pas',
  Gamolf.RTL.Joystick.Mac in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Mac.pas',
  Gamolf.RTL.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.pas',
  iOSapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\iOSapi.GameController.pas',
  Macapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\Macapi.GameController.pas',
  Sporgloo.API.Messages in '..\src-common-api\Sporgloo.API.Messages.pas',
  uGameData in 'uGameData.pas',
  uConfig in 'uConfig.pas',
  Sporgloo.Types in '..\src-common-api\Sporgloo.Types.pas',
  Sporgloo.Database in '..\src-common-api\Sporgloo.Database.pas',
  Sporgloo.Consts in '..\src-common-api\Sporgloo.Consts.pas',
  Sporgloo.Messaging in 'Sporgloo.Messaging.pas',
  Sporgloo.MapFrame in 'Sporgloo.MapFrame.pas' {MapFrame: TFrame},
  Sporgloo.Client in 'Sporgloo.Client.pas',
  Olf.Net.Socket.Messaging in '..\lib-externes\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\src\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  u_urlOpen in '..\lib-externes\librairies\src\u_urlOpen.pas',
  Olf.RTL.Streams in '..\lib-externes\librairies\src\Olf.RTL.Streams.pas',
  udmAdobeStock_440583506 in '..\_PRIVATE\fontes\AdobeStock_440583506\udmAdobeStock_440583506.pas' {dmAdobeStock_440583506: TDataModule},
  udmAdobeStock_526775911 in '..\_PRIVATE\fontes\AdobeStock_526775911\udmAdobeStock_526775911.pas' {dmAdobeStock_526775911: TDataModule},
  cGrayBox in 'cGrayBox.pas' {cadGrayBox: TFrame},
  cYellowMenuButton in 'cYellowMenuButton.pas' {cadYellowMenuButton: TFrame},
  uBackgroundMusic in 'uBackgroundMusic.pas',
  cViseur in 'cViseur.pas' {cadViseur: TFrame},
  Olf.RTL.CryptDecrypt in '..\lib-externes\librairies\src\Olf.RTL.CryptDecrypt.pas',
  Olf.RTL.Maths.Conversions in '..\lib-externes\librairies\src\Olf.RTL.Maths.Conversions.pas',
  uDMAboutBoxLogo in 'uDMAboutBoxLogo.pas' {dmAboutBoxLogo: TDataModule},
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm},
  udmAdobeStock_257147901 in '..\_PRIVATE\fontes\AdobeStock_257147901\udmAdobeStock_257147901.pas' {dmAdobeStock_257147901: TDataModule},
  cStarsCount in 'cStarsCount.pas' {cadStarsCount: TFrame},
  cScore in 'cScore.pas' {cadScore: TFrame},
  cLifeLevel in 'cLifeLevel.pas' {cadLifeLevel: TFrame},
  cYellowGameButton in 'cYellowGameButton.pas' {cadYellowGameButton: TFrame},
  cYellowGameButtonPause in 'cYellowGameButtonPause.pas' {cadYellowGameButtonPause: TFrame},
  cYellowGameButtonMusicOnOff in 'cYellowGameButtonMusicOnOff.pas' {cadYellowGameButtonMusicOnOff: TFrame},
  Sporgloo.Utils in '..\src-common-api\Sporgloo.Utils.pas',
  USVGBackgrounds in '..\assets\graphics\Backgrounds\USVGBackgrounds.pas',
  USVGItems in '..\assets\graphics\Items\USVGItems.pas',
  USVGPersos in '..\assets\graphics\Persos\USVGPersos.pas',
  USVGTrees in '..\assets\graphics\Trees\USVGTrees.pas',
  USVGUserInterface in '..\assets\graphics\UserInterface\USVGUserInterface.pas',
  Olf.Skia.SVGToBitmap in '..\lib-externes\librairies\src\Olf.Skia.SVGToBitmap.pas',
  uSVGRegister in 'uSVGRegister.pas',
  cShowMessageBox in 'cShowMessageBox.pas' {cadShowMessageBox: TFrame},
  cShowYesNoBox in 'cShowYesNoBox.pas' {cadShowYesNoBox: TFrame},
  cChoosePlayerImageID in 'cChoosePlayerImageID.pas' {cadChoosePlayerImageID: TFrame};

{$R *.res}

begin
  SporglooProjectType := TSporglooProjectType.Client;
  GlobalUseSkia := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait, TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TdmAdobeStock_440583506, dmAdobeStock_440583506);
  Application.CreateForm(TdmAdobeStock_526775911, dmAdobeStock_526775911);
  Application.CreateForm(TdmAboutBoxLogo, dmAboutBoxLogo);
  Application.CreateForm(TdmAdobeStock_257147901, dmAdobeStock_257147901);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
