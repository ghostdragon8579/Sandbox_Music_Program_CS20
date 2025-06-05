float TitleFontSize;
float[] InitialFontSizes = new float[TicTacToeTextDIVHeight.length];
float[] FontSizes = new float[TicTacToeTextDIVHeight.length];
String[] Text = new String[22];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry();
}
void stringVarsEntry() {
  //
  if (!GameModeSinglePlayer && !GameModeMultiPlayer) {
    Text[0] = "Select your Game Mode:";
  } else if (GameModeSinglePlayer) { 
    Text[0] = "Game Mode: SinglePlayer";
  } else if (GameModeMultiPlayer) {
    Text[0] = "Game Mode: MultiPlayer";
  }
  Text[1] = "SinglePlayer";
  Text[2] = "MultiPlayer";
  Text[3] = "Whose turn it is:";
  if (!PlayerO && PlayerX) {
  Text[4] = "X";
  } else if (!PlayerX && PlayerO) {
  Text[4] = "O";
  }
  Text[5] = "Score:";
  Text[6] = "X: "+MultiPlayerXScore;
  Text[7] = "O: "+MultiPlayerOScore;
  Text[8] = "New Game";
  Text[9] = "Reset";
  Text[10] = "Win Streak:";
  Text[11] = ""+SinglePlayerWinStreak;
  Text[12] = "Player X Wins!";
  Text[13] = "Player O Wins!";
  Text[14] = "Choose your difficulty:";
  Text[15] = "Easy";
  Text[16] = "Medium";
  Text[17] = "Hard";
  Text[18] = "";
  if (DifficultySelected && DifficultyEasy) {
    Text[18] = "Difficulty: Easy";
  } else if (DifficultySelected && DifficultyMedium) {
    Text[18] = "Difficulty: Medium";
  } else if (DifficultySelected && DifficultyHard) {
    Text[18] = "Difficulty: Hard";
  }
  Text[19] = "You Win!";
  Text[20] = "You Lose!";
  if (!MusicPlayer) {
  Text[21] = "Music Player";
  } else if (MusicPlayer) { 
  Text[21] = "Return";
  }
  //
}
void MusicPanelTextSetup2() {
  TitleFontSize = ShorterSide;
  for (int i=0; i<TicTacToeTextDIVHeight.length; i++) {
    if (TitleFontSize > TicTacToeTextDIVHeight[i]) 
    TitleFontSize = TicTacToeTextDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 0.97;
  TitleFontSize = TitleFontSize * TimesNewRomanBoldAspectRatio;
  //
  for (int i = 0; i < TicTacToeTextDIVHeight.length; i++) {
    float TemporaryFontSize = TicTacToeTextDIVHeight[i];
    textFont(TitleFont, TemporaryFontSize);
    while (textWidth(Text[i]) > TicTacToeTextDIVWidth[i]) {
      TemporaryFontSize *= 0.99;
      textFont(TitleFont, TemporaryFontSize);
    }
    FontSizes[i] = TemporaryFontSize;
    textFont(TitleFont, TemporaryFontSize);
  }
}
void TicTacToe () {
}
void Tic_Tac_Toe_CS20_HoverOver () {
  color DefaultHoverOverColor=color(255, 255, 255, 96);
  color HoverOverGreen=color(96, 227, 41, 96);
  color HoverOverOrange=color(225, 200, 46, 96);
  color HoverOverRed=color(250, 33, 47, 96);
  color HoverOverColor=color(255, 255, 255, 96); 
  if (MouseIsOver(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]) && !GameModeSinglePlayer && !GameModeMultiPlayer) {
    fill(HoverOverColor);
    rect(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xMultiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]) && !GameModeSinglePlayer && !GameModeMultiPlayer) {
    fill(HoverOverColor);
    rect(xMultiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8])) {
    fill(HoverOverColor);
    rect(xNewGameButton, yNewGameButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9])) {
    fill(HoverOverColor);
    rect(xResetButton, yResetButton, TicTacToeTextDIVWidth[9], TicTacToeTextDIVHeight[9]);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21])) {
    fill(HoverOverColor);
    rect(xMusicPlayer, yMusicPlayer, TicTacToeTextDIVWidth[21], TicTacToeTextDIVHeight[21]);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton)) {
    fill(HoverOverColor);
    stroke(HoverOverColor);
    rect(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xDifficultyEasy, yDifficultyEasy, TicTacToeTextDIVWidth[15], TicTacToeTextDIVHeight[15]) && GameModeSinglePlayer && !DifficultySelected) {
    HoverOverColor = HoverOverGreen;
    fill(HoverOverColor);
    rect(xDifficultyEasy, yDifficultyEasy, TicTacToeTextDIVWidth[15], TicTacToeTextDIVHeight[15]);
    HoverOverColor = DefaultHoverOverColor;
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xDifficultyMedium, yDifficultyMedium, TicTacToeTextDIVWidth[16], TicTacToeTextDIVHeight[16]) && GameModeSinglePlayer && !DifficultySelected) {
    HoverOverColor = HoverOverOrange;
    fill(HoverOverColor);
    rect(xDifficultyMedium, yDifficultyMedium, TicTacToeTextDIVWidth[16], TicTacToeTextDIVHeight[16]);
    HoverOverColor = DefaultHoverOverColor;
    fill(ResetDefaultInk);
    stroke(Black);
  } else if (MouseIsOver(xDifficultyHard, yDifficultyHard, TicTacToeTextDIVWidth[17], TicTacToeTextDIVHeight[17]) && GameModeSinglePlayer && !DifficultySelected) {
    HoverOverColor = HoverOverRed;
    fill(HoverOverColor);
    rect(xDifficultyHard, yDifficultyHard, TicTacToeTextDIVWidth[17], TicTacToeTextDIVHeight[17]);
    HoverOverColor = DefaultHoverOverColor;
    fill(ResetDefaultInk);
    stroke(Black);
  }
  //Array Hover Over Goes on the end to prevent miscoloring
  for (int i = 1; i <= 9; i++) {
  if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare)) {
    fill(HoverOverColor);
    stroke(HoverOverColor);
    rect(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare);
    fill(ResetDefaultInk);
    stroke(Black);
  }
 }
}
