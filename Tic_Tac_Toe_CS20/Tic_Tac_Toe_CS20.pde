//Global Variables
float xBackground, yBackground, widthBackground, heightBackground;
float xQuitButton, yQuitButton, widthQuitButton, heightQuitButton;
float[] xGameGrid = new float[10];
float[] yGameGrid = new float[10];
float widthGameGrid, heightGameGrid;
float widthGameGridSquare, heightGameGridSquare;
float[] TicTacToeTextDIVWidth = new float[10];
float[] TicTacToeTextDIVHeight = new float[10];
float xGameModeSelection, yGameModeSelection;
float xSinglePlayer, ySinglePlayer;
float xMutiPlayer, yMultiPlayer;
float xScoreBoard, yScoreBoard;
float xScoreKeeper1, yScoreKeeper1;
float xScoreKeeper2, yScoreKeeper2;
float xTurn, yTurn;
float xTurnDisplay, yTurnDisplay;
float xNewGameButton, yNewGameButton;
float xResetButton, yResetButton;
PFont TitleFont;
PImage Quit;
color ResetDefaultInk=#FFFFFF;
color Black=#000000;
color LightGray=#EAE8E8;
int appWidth, appHeight;
int size;
int ShorterSide;
boolean GameModeSinglePlayer = false;
boolean GameModeMultiPlayer = false;
boolean IsFontSizeUpdated = false;
boolean MouseIsOver(float xVariable, float yVariable, float widthVariable, float heightVariable) {
  return mouseX > xVariable && mouseX < xVariable + widthVariable && mouseY > yVariable && mouseY < yVariable + heightVariable;
}
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  ShorterSide = (appWidth >= appHeight) ? appHeight : appWidth;
  //
  String up = "..";
  String open = "/";
  String ImageFolder = "Music_Program_Images";
  String Imagepathway = up + open;
  String QuitImage = "exit.png";
  Quit = loadImage(Imagepathway + ImageFolder + open + QuitImage);
  //
  //Background
  xBackground = appWidth*0; yBackground = appHeight*0; widthBackground = appWidth-1; heightBackground = appHeight-1;
  //
  //Game Grid and Grid Squares
  widthGameGrid = appWidth*14/36; heightGameGrid = widthGameGrid;
  xGameGrid[0] = appWidth*11/36; yGameGrid[0] = appHeight*1/4;
  widthGameGridSquare = widthGameGrid*1/3; heightGameGridSquare = widthGameGridSquare;
  xGameGrid[1] = xGameGrid[0]; yGameGrid[1] = yGameGrid[0];
  xGameGrid[2] = xGameGrid[0]+widthGameGridSquare; yGameGrid[2] = yGameGrid[0];
  xGameGrid[3] = xGameGrid[0]+widthGameGridSquare*2; yGameGrid[3] = yGameGrid[0];
  xGameGrid[4] = xGameGrid[0]; yGameGrid[4] = yGameGrid[0]+heightGameGridSquare;
  xGameGrid[5] = xGameGrid[0]+widthGameGridSquare; yGameGrid[5] = yGameGrid[0]+heightGameGridSquare;
  xGameGrid[6] = xGameGrid[0]+widthGameGridSquare*2; yGameGrid[6] = yGameGrid[0]+heightGameGridSquare;
  xGameGrid[7] = xGameGrid[0]; yGameGrid[7] = yGameGrid[0]+heightGameGridSquare*2;
  xGameGrid[8] = xGameGrid[0]+widthGameGridSquare; yGameGrid[8] = yGameGrid[0]+heightGameGridSquare*2;
  xGameGrid[9] = xGameGrid[0]+widthGameGridSquare*2; yGameGrid[9] = yGameGrid[0]+heightGameGridSquare*2;
  //
  //Game Mode Selection
  xGameModeSelection = appWidth*1/3; yGameModeSelection = appHeight*1/24; TicTacToeTextDIVWidth[0] = appWidth*1/3; TicTacToeTextDIVHeight[0] = appHeight*1/16;
  xSinglePlayer = appWidth*1/3; ySinglePlayer = appHeight*1/8; TicTacToeTextDIVWidth[1] = appWidth*1/7; TicTacToeTextDIVHeight[1] = appHeight*1/16;
  xMutiPlayer = appWidth*2/3-appWidth*1/7; yMultiPlayer = ySinglePlayer; TicTacToeTextDIVWidth[2] = TicTacToeTextDIVWidth[1]; TicTacToeTextDIVHeight[2] = TicTacToeTextDIVHeight[1];
  //
  //Turn Display and Score Board
  xScoreBoard = appWidth*1/24; yScoreBoard = appHeight*1/3; TicTacToeTextDIVWidth[5] = appWidth*5/24; TicTacToeTextDIVHeight[5] = appHeight*1/24;
  xScoreKeeper1 = appWidth*1/24; yScoreKeeper1 = appHeight*7/18; TicTacToeTextDIVWidth[6] = TicTacToeTextDIVWidth[5]*1/2; TicTacToeTextDIVHeight[6] = TicTacToeTextDIVHeight[5];
  xScoreKeeper2 = appWidth*3.5/24; yScoreKeeper2 = appHeight*7/18; TicTacToeTextDIVWidth[7] = TicTacToeTextDIVWidth[5]*1/2; TicTacToeTextDIVHeight[7] = TicTacToeTextDIVHeight[5];
  xTurn = appWidth*1/16; yTurn = appHeight*1/2; TicTacToeTextDIVWidth[3] = appWidth*1/7; TicTacToeTextDIVHeight[3] = appHeight*1/16;
  xTurnDisplay = xTurn; yTurnDisplay = yTurn+TicTacToeTextDIVHeight[3]; TicTacToeTextDIVWidth[4] = TicTacToeTextDIVWidth[3]; TicTacToeTextDIVHeight[4] = appHeight*1/6;
  //
  //Buttons
  xNewGameButton = appWidth*9/20; yNewGameButton = appHeight*31/36; TicTacToeTextDIVWidth[8] = appWidth*1/10; TicTacToeTextDIVHeight[8] = appHeight*1/24;
  xResetButton = appWidth*11/24; yResetButton = appHeight*33/36; TicTacToeTextDIVWidth[9] = appWidth*1/12; TicTacToeTextDIVHeight[9] = appHeight*1/24;
  xQuitButton = appWidth*15/16; yQuitButton = appHeight*0; widthQuitButton = appWidth*1/16; heightQuitButton = appHeight*1/24;
  //
  //Fonts
  TitleFont = createFont("Times New Roman Bold", 55);
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  MusicPanelTextSetup1();
  MusicPanelTextSetup2();
  if (!IsFontSizeUpdated) {
    MusicPanelTextSetup2();
    IsFontSizeUpdated = true;
  }
  //
  //Background
  fill(LightGray);
  rect(xBackground, yBackground, widthBackground, heightBackground);
  fill(ResetDefaultInk);
  //
  //Game Grid and Grid Squares
  strokeWeight(4);
  rect(xGameGrid[0], yGameGrid[0], widthGameGrid, heightGameGrid);
  rect(xGameGrid[1], yGameGrid[1], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[2], yGameGrid[2], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[3], yGameGrid[3], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[4], yGameGrid[4], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[5], yGameGrid[5], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[6], yGameGrid[6], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[7], yGameGrid[7], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[8], yGameGrid[8], widthGameGridSquare, heightGameGridSquare);
  rect(xGameGrid[9], yGameGrid[9], widthGameGridSquare, heightGameGridSquare);
  strokeWeight(1);
  //
  //Game Mode Selection
  strokeWeight(2);
  rect(xGameModeSelection, yGameModeSelection, TicTacToeTextDIVWidth[0], TicTacToeTextDIVHeight[0]);
  rect(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
  rect(xMutiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
  strokeWeight(1);
  //
  //Turn Display and Score Board
  strokeWeight(2);
  rect(xScoreBoard, yScoreBoard, TicTacToeTextDIVWidth[5], TicTacToeTextDIVHeight[5]);
  rect(xScoreKeeper1, yScoreKeeper1, TicTacToeTextDIVWidth[6], TicTacToeTextDIVHeight[6]);
  rect(xScoreKeeper2, yScoreKeeper2, TicTacToeTextDIVWidth[7], TicTacToeTextDIVHeight[7]);
  strokeWeight(1);
  //
  //Buttons
  strokeWeight(2);
  rect(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
  rect(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9]);
  rect(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
  strokeWeight(1);
  //
  textAlign(CENTER, CENTER);
  fill(Black);
  textFont(TitleFont, FontSizes[0]);
  text(Text[0], xGameModeSelection, yGameModeSelection, TicTacToeTextDIVWidth[0], TicTacToeTextDIVHeight[0]);
  textFont(TitleFont, FontSizes[1]);
  text(Text[1], xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
  textFont(TitleFont, FontSizes[2]);
  text(Text[2], xMutiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
  textFont(TitleFont, FontSizes[5]);
  text(Text[5], xScoreBoard, yScoreBoard, TicTacToeTextDIVWidth[5], TicTacToeTextDIVHeight[5]);
  textFont(TitleFont, FontSizes[6]);
  text(Text[6], xScoreKeeper1, yScoreKeeper1, TicTacToeTextDIVWidth[6], TicTacToeTextDIVHeight[6]);
  textFont(TitleFont, FontSizes[7]);
  text(Text[7], xScoreKeeper2, yScoreKeeper2, TicTacToeTextDIVWidth[7], TicTacToeTextDIVHeight[7]);
  textFont(TitleFont, FontSizes[8]);
  text(Text[8], xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
  textFont(TitleFont, FontSizes[8]);
  text(Text[9], xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9]);
  fill(ResetDefaultInk);
  //
  //Images
  image(Quit, xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
  //
  if (GameModeMultiPlayer == true) {
  TicTacToeMultiPlayer ();
  }
  //TicTacToeSinglePlayer ();
  Tic_Tac_Toe_CS20_HoverOver ();
  //
} //End draw
//
void keyPressed() {
  //
  //
} //End keyPressed
//
void mousePressed() {
  //
  if (MouseIsOver(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1])) {
    if (!GameModeMultiPlayer && !GameModeSinglePlayer) {
      GameModeSinglePlayer = true; }
  } else if (MouseIsOver(xMutiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2])) {
    if (!GameModeMultiPlayer && !GameModeSinglePlayer) {
      GameModeMultiPlayer = true; }
  } else if (MouseIsOver(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8])) {
    GameModeSinglePlayer = false;
    GameModeMultiPlayer = false;
  } else if (MouseIsOver(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9])) {
    GameModeSinglePlayer = false;
    GameModeMultiPlayer = false;
  }
  //
} //End mousePressed
//
//End MAIN Program
