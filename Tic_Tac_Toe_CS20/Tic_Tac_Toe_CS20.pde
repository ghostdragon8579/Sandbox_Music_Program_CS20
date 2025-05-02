//Global Variables
color ResetDefaultInk=#FFFFFF;
color LightGray=#EAE8E8;
float xBackground, yBackground, widthBackground, heightBackground;
float xGameModeSelection, yGameModeSelection, widthGameModeSelection, heightGameModeSelection;
float xSinglePlayer, ySinglePlayer, widthSinglePlayer, heightSinglePlayer;
float xMutiPlayer, yMultiPlayer, widthMultiPlayer, heightMultiPlayer;
float xResetButton, yResetButton, widthResetButton, heightResetButton;
float xQuitButton, yQuitButton, widthQuitButton, heightQuitButton;
float[] xGameGrid = new float[10];
float[] yGameGrid = new float[10];
float widthGameGrid, heightGameGrid;
float widthGameGridSquare, heightGameGridSquare;
int appWidth, appHeight;
int size;
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
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
  xGameModeSelection = appWidth*1/3; yGameModeSelection = appHeight*1/24; widthGameModeSelection = appWidth*1/3; heightGameModeSelection = appHeight*1/16;
  xSinglePlayer = appWidth*1/3; ySinglePlayer = appHeight*1/8; widthSinglePlayer = appWidth*1/7; heightSinglePlayer = appHeight*1/16;
  xMutiPlayer = appWidth*2/3-appWidth*1/7; yMultiPlayer = ySinglePlayer; widthMultiPlayer = widthSinglePlayer; heightMultiPlayer = heightSinglePlayer;
  //
  //Buttons
  xResetButton = appWidth*11/24; yResetButton = appHeight*31/36; widthResetButton = appWidth*1/12; heightResetButton = appHeight*1/24;
  xQuitButton = appWidth*15/16; yQuitButton = appHeight*0; widthQuitButton = appWidth*1/16; heightQuitButton = appHeight*1/24;
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  //Background
  fill(LightGray);
  rect(xBackground, yBackground, widthBackground, heightBackground);
  fill(ResetDefaultInk);
  //
  //Game Grid and Grid Squares
  fill(LightGray);
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
  fill(ResetDefaultInk);
  //
  //Game Mode Selection
  rect(xGameModeSelection, yGameModeSelection, widthGameModeSelection, heightGameModeSelection);
  rect(xSinglePlayer, ySinglePlayer, widthSinglePlayer, heightSinglePlayer);
  rect(xMutiPlayer, yMultiPlayer, widthMultiPlayer, heightMultiPlayer);
  //
  //Buttons
  rect(xResetButton, yResetButton, widthResetButton, heightResetButton);
  rect(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
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
  //
} //End mousePressed
//
//End MAIN Program
