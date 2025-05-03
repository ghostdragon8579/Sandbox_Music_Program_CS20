float TitleFontSize;
float[] InitialFontSizes = new float[TicTacToeTextDIVHeight.length];
float[] FontSizes = new float[TicTacToeTextDIVHeight.length];
String[] Text = new String[5];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry();
}
void stringVarsEntry() {
  if (GameModeSinglePlayer == false && GameModeMultiPlayer == false) {
  Text[0] = "Choose your Game Mode:";
  } else if (GameModeSinglePlayer == true) { 
  Text[0] = "Game Mode: SinglePlayer";
  } else if (GameModeMultiPlayer == true) {
  Text[0] = "Game Mode: MultiPlayer";
  }
  Text[1] = "SinglePlayer";
  Text[2] = "MultiPlayer";
  Text[3] = "Reset?";
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
