//Global Variables
float xBackground, yBackground, widthBackground, heightBackground;
float xQuitButton, yQuitButton, widthQuitButton, heightQuitButton;
float[] xGameGrid = new float[10];
float[] yGameGrid = new float[10];
float widthGameGrid, heightGameGrid;
float widthGameGridSquare, heightGameGridSquare;
float widthPlayerOGameGridCircle;
float[] TextDIVWidth = new float[18];
float[] TextDIVHeight = new float[18];
float[] TicTacToeTextDIVWidth = new float[22];
float[] TicTacToeTextDIVHeight = new float[22];
float xGameModeSelection, yGameModeSelection;
float xSinglePlayer, ySinglePlayer;
float xMultiPlayer, yMultiPlayer;
float xScoreBoard, yScoreBoard;
float xScoreKeeper1, yScoreKeeper1;
float xScoreKeeper2, yScoreKeeper2;
float xTurn, yTurn;
float xTurnDisplay, yTurnDisplay;
float xNewGameButton, yNewGameButton;
float xResetButton, yResetButton;
float xWinStreak, yWinStreak;
float xWinStreakCounter, yWinStreakCounter;
float xPlayerXWin, yPlayerXWin;
float xPlayerOWin, yPlayerOWin;
float xDifficultySelection, yDifficultySelection;
float xDifficultyEasy, yDifficultyEasy;
float xDifficultyMedium, yDifficultyMedium;
float xDifficultyHard, yDifficultyHard;
float xDifficultyDisplay, yDifficultyDisplay;
float xPlayerWin, yPlayerWin;
float xComputerWin, yComputerWin;
float xMusicPlayer, yMusicPlayer;
PFont TitleFont;
PImage Quit;
color ResetDefaultInk=#FFFFFF;
color Black=#000000;
color LightGray=#EAE8E8;
color Green=#60E329;
color Orange=#FFC82E;
color Red=#FA212F;
color Gold=#FFD700;
color RoseGold=#FFC0CB;
int appWidth, appHeight;
int size;
int ShorterSide;
int MultiPlayerXScore = 0;
int MultiPlayerOScore = 0;
int SinglePlayerWinStreak = 0;
int[] GridState = new int[10];
boolean GameModeSinglePlayer = false;
boolean GameModeMultiPlayer = false;
boolean PlayerX = true;
boolean PlayerO = false;
boolean GameWon = false;
boolean DifficultySelected = false;
boolean DifficultyEasy = false;
boolean DifficultyMedium = false;
boolean DifficultyHard = false;
boolean PlayerTurn = true;
boolean ComputerTurn = false;
boolean IsFontSizeUpdated = false;
boolean MusicPlayer = false;
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
  //Game Mode Selection
  xGameModeSelection = appWidth*1/3; yGameModeSelection = appHeight*1/24; TicTacToeTextDIVWidth[0] = appWidth*1/3; TicTacToeTextDIVHeight[0] = appHeight*1/16;
  xSinglePlayer = appWidth*1/3; ySinglePlayer = appHeight*1/8; TicTacToeTextDIVWidth[1] = appWidth*1/7; TicTacToeTextDIVHeight[1] = appHeight*1/16;
  xMultiPlayer = appWidth*2/3-appWidth*1/7; yMultiPlayer = ySinglePlayer; TicTacToeTextDIVWidth[2] = TicTacToeTextDIVWidth[1]; TicTacToeTextDIVHeight[2] = TicTacToeTextDIVHeight[1];
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
  //SinglePlayer WinStreak and Difficulty Selection
  xWinStreak = xScoreBoard; yWinStreak = yScoreBoard; TicTacToeTextDIVWidth[10] = TicTacToeTextDIVWidth[5]; TicTacToeTextDIVHeight[10] = TicTacToeTextDIVHeight[5];
  xWinStreakCounter = appWidth*1/12; yWinStreakCounter = appHeight*7/18; TicTacToeTextDIVWidth[11] = appWidth*1/8; TicTacToeTextDIVHeight[11] = TicTacToeTextDIVHeight[5];
  xDifficultySelection = appWidth*1/24; yDifficultySelection = appHeight*1/3; TicTacToeTextDIVWidth[14] = appWidth*1/5; TicTacToeTextDIVHeight[14] = appHeight*1/12;
  xDifficultyEasy = xDifficultySelection+TicTacToeTextDIVWidth[14]*1/6; yDifficultyEasy = yDifficultySelection+TicTacToeTextDIVHeight[14]*3/2; TicTacToeTextDIVWidth[15] = TicTacToeTextDIVWidth[14]*2/3; TicTacToeTextDIVHeight[15] = appHeight*1/24;
  xDifficultyMedium = xDifficultyEasy; yDifficultyMedium = yDifficultySelection+TicTacToeTextDIVHeight[14]*5/2; TicTacToeTextDIVWidth[16] = TicTacToeTextDIVWidth[14]*2/3; TicTacToeTextDIVHeight[16] = appHeight*1/24;
  xDifficultyHard = xDifficultyEasy; yDifficultyHard = yDifficultySelection+TicTacToeTextDIVHeight[14]*7/2; TicTacToeTextDIVWidth[17] = TicTacToeTextDIVWidth[14]*2/3; TicTacToeTextDIVHeight[17] = appHeight*1/24;
  xDifficultyDisplay = appWidth*2/5; yDifficultyDisplay = ySinglePlayer; TicTacToeTextDIVWidth[18] = appWidth*1/5; TicTacToeTextDIVHeight[18] = TicTacToeTextDIVHeight[1];
  //
  //Win Displays
  xPlayerXWin = xGameModeSelection; yPlayerXWin = yGameModeSelection; TicTacToeTextDIVWidth[12] = TicTacToeTextDIVWidth[0]; TicTacToeTextDIVHeight[12] = TicTacToeTextDIVHeight[0];
  xPlayerOWin = xGameModeSelection; yPlayerOWin = yGameModeSelection; TicTacToeTextDIVWidth[13] = TicTacToeTextDIVWidth[0]; TicTacToeTextDIVHeight[13] = TicTacToeTextDIVHeight[0];
  xPlayerWin = xGameModeSelection; yPlayerWin = yGameModeSelection; TicTacToeTextDIVWidth[19] = TicTacToeTextDIVWidth[0]; TicTacToeTextDIVHeight[19] = TicTacToeTextDIVHeight[0];
  xComputerWin = xGameModeSelection; yComputerWin = yGameModeSelection; TicTacToeTextDIVWidth[20] = TicTacToeTextDIVWidth[0]; TicTacToeTextDIVHeight[20] = TicTacToeTextDIVHeight[0];
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
  widthPlayerOGameGridCircle = widthGameGridSquare*2/3;
  //
  MusicPlayerVoidSetup();
  //
  //Music Player
  xMusicPlayer = appWidth-appWidth*1/10; yMusicPlayer = appHeight*23/24; TicTacToeTextDIVWidth[21] = appWidth*1/10; TicTacToeTextDIVHeight[21] = appHeight*1/24;
  //
  //Fonts
  TitleFont = createFont("Times New Roman Bold", 55);
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  TextSetup1();
  TextSetup2();
  MusicPanelTextSetup1();
  MusicPanelTextSetup2();
  //
  //Background
  fill(Black);
  noStroke();
  rect(xBackground, yBackground, widthBackground, heightBackground);
  fill(ResetDefaultInk);
  //
  if (!MusicPlayer) {
  //
  //Game Grid and Grid Squares
  strokeWeight(3);
  stroke(Gold);
  fill(Black);
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
  for (int i = 1; i <= 9; i++) {
    if (GridState[i] == 1) {
      stroke(RoseGold);
      strokeWeight(10);
      line(xGameGrid[i], yGameGrid[i], xGameGrid[i] + widthGameGridSquare, yGameGrid[i] + heightGameGridSquare); // Diagonal line 1
      line(xGameGrid[i], yGameGrid[i] + heightGameGridSquare, xGameGrid[i] + widthGameGridSquare, yGameGrid[i]); // Diagonal line 2
    } else if (GridState[i] == 2) {
      stroke(RoseGold);
      strokeWeight(10);
      circle(xGameGrid[i]+widthGameGridSquare*1/2, yGameGrid[i]+heightGameGridSquare*1/2, widthPlayerOGameGridCircle);
    }
  }
  strokeWeight(1);
  //
  //Game Mode Selection
  strokeWeight(3);
  stroke(Gold);
  rect(xGameModeSelection, yGameModeSelection, TicTacToeTextDIVWidth[0], TicTacToeTextDIVHeight[0]);
  if (!GameModeSinglePlayer && !GameModeMultiPlayer) {
  rect(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
  rect(xMultiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
  }
  //
  //Buttons Affected by MusicPlayer
  strokeWeight(3);
  stroke(Gold);
  rect(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
  rect(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9]);
  //
  //Text
  textAlign(CENTER, CENTER);
  fill(RoseGold);
  textFont(TitleFont, FontSizes[0]);
  strokeWeight(3);
  text(Text[0], xGameModeSelection, yGameModeSelection, TicTacToeTextDIVWidth[0], TicTacToeTextDIVHeight[0]);
  if (!GameModeSinglePlayer && !GameModeMultiPlayer) {
  textFont(TitleFont, FontSizes[1]);
  text(Text[1], xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
  textFont(TitleFont, FontSizes[2]);
  text(Text[2], xMultiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
  }
  textFont(TitleFont, FontSizes[8]);
  text(Text[8], xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
  textFont(TitleFont, FontSizes[8]);
  text(Text[9], xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9]);
  fill(ResetDefaultInk);
  }
  //
  if (MusicPlayer) {
    MusicPlayerVoidDraw();
  }
  //
  //Buttons Unaffected by MusicPlayer
  fill(Black);
  strokeWeight(3);
  stroke(Gold);
  rect(xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21]);
  fill(RoseGold);
  textFont(TitleFont, FontSizes[21]);
  text(Text[21], xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21]);
  rect(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
  //
  stringVarsEntry();
  //
  //Images
  image(Quit, xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
  //
  if (GameModeMultiPlayer) {
  TicTacToeMultiPlayer();
  } else if (GameModeSinglePlayer) {
  TicTacToeSinglePlayer();
  }
  Tic_Tac_Toe_CS20_HoverOver ();
  //
} //End draw
//
void keyPressed() {
  //
  if (MusicPlayer) {
    MusicPlayerKeyPressed();
  }
  //
} //End keyPressed
//
void mousePressed() {
  //
  if (!MusicPlayer) {
  //
  if (GameModeMultiPlayer) {
  TicTacToeMultiPlayerMousePressed();
  } else if (GameModeSinglePlayer) {
  TicTacToeSinglePlayerMousePressed();
  }
  //
  if (MouseIsOver(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1])) {
    if (!GameModeMultiPlayer && !GameModeSinglePlayer) {
      GameModeSinglePlayer = true; }
  } else if (MouseIsOver(xMultiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2])) {
    if (!GameModeMultiPlayer && !GameModeSinglePlayer) {
      GameModeMultiPlayer = true; }
  } else if (MouseIsOver(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8])) {
    GameModeSinglePlayer = false;
    GameModeMultiPlayer = false;
    PlayerX = true; PlayerO = false;
    GameWon = false;
    DifficultySelected = false; DifficultyEasy = false;
    DifficultyMedium = false; DifficultyHard = false;
    for (int i = 1; i <= 9; i++) {
      GridState[i] = 0;
    }
  } else if (MouseIsOver(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9])) {
    GameModeSinglePlayer = false;
    GameModeMultiPlayer = false;
    PlayerX = true; PlayerO = false;
    GameWon = false;
    MultiPlayerXScore = 0;
    MultiPlayerOScore = 0;
    DifficultySelected = false; DifficultyEasy = false;
    DifficultyMedium = false; DifficultyHard = false;
    SinglePlayerWinStreak = 0;
    for (int i = 1; i <= 9; i++) {
      GridState[i] = 0;
    }
  } 
  }
  if (MouseIsOver(xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21]) && !MusicPlayer) {
    MusicPlayer = true;
  } else if (MouseIsOver(xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21]) && MusicPlayer) {
    MusicPlayer = false;
  } else if (MouseIsOver(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton)) {
    exit();
  }
  if (MusicPlayer) {
    MusicPlayerMousePressed();
  }
  //
} //End mousePressed
//
void mouseReleased() {
  //
  //
}
//
//End MAIN Program
