float TitleFontSize;
float[] InitialFontSizes = new float[TicTacToeTextDIVHeight.length];
float[] FontSizes = new float[TicTacToeTextDIVHeight.length];
String[] Text = new String[9];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry();
}
void stringVarsEntry() {
  if (GameModeSinglePlayer == false && GameModeMultiPlayer == false) {
  Text[0] = "Select your Game Mode:";
  } else if (GameModeSinglePlayer == true) { 
  Text[0] = "Game Mode: SinglePlayer";
  } else if (GameModeMultiPlayer == true) {
  Text[0] = "Game Mode: MultiPlayer";
  }
  Text[1] = "SinglePlayer";
  Text[2] = "MultiPlayer";
  Text[3] = "Whose turn it is:";
  Text[4] = "X";
  Text[5] = "Score:";
  Text[6] = "X: 0";
  Text[7] = "O: 0";
  Text[8] = "Reset";
}
void MusicPanelTextSetup2() {
  TitleFontSize = ShorterSide;
  for (int i=0; i<TicTacToeTextDIVHeight.length; i++) {
    if (TitleFontSize > TicTacToeTextDIVHeight[i]) 
    TitleFontSize = TicTacToeTextDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 1.04;
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
void Tic_Tac_Toe_CS20_HoverOver () {
  color HoverOverColor=color(255, 255, 255, 64);
  if (MouseIsOver(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1])) {
    fill(HoverOverColor);
    rect(xSinglePlayer, ySinglePlayer, TicTacToeTextDIVWidth[1], TicTacToeTextDIVHeight[1]);
    fill(ResetDefaultInk);
   } else if (MouseIsOver(xMutiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2])) {
    fill(HoverOverColor);
    rect(xMutiPlayer, yMultiPlayer, TicTacToeTextDIVWidth[2], TicTacToeTextDIVHeight[2]);
    fill(ResetDefaultInk);
  } else if (MouseIsOver(xResetButton, yResetButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8])) {
    fill(HoverOverColor);
    rect(xResetButton, yResetButton, TicTacToeTextDIVWidth[8], TicTacToeTextDIVHeight[8]);
    fill(ResetDefaultInk);
  } else if (MouseIsOver(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton)) {
    fill(HoverOverColor);
    rect(xQuitButton, yQuitButton, widthQuitButton, heightQuitButton);
    fill(ResetDefaultInk);
  }
}
