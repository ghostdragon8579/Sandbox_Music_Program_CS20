void TicTacToeSinglePlayer () {
  //Win Streak Counter
  strokeWeight(2);
  rect(xWinStreak, yWinStreak, TicTacToeTextDIVWidth[10], TicTacToeTextDIVHeight[10]);
  rect(xWinStreakCounter, yWinStreakCounter, TicTacToeTextDIVWidth[11], TicTacToeTextDIVHeight[11]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[10]);
  text(Text[10], xWinStreak, yWinStreak, TicTacToeTextDIVWidth[10], TicTacToeTextDIVHeight[10]);
  textFont(TitleFont, FontSizes[11]);
  text(Text[11], xWinStreakCounter, yWinStreakCounter, TicTacToeTextDIVWidth[11], TicTacToeTextDIVHeight[11]);
}
void TicTacToeSinglePlayerMousePressed () {
    for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare)) {
      rect(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare);
    }
  }
}
void TicTacToeMultiPlayer () {
  //Turn Display and Score Board
  strokeWeight(2);
  rect(xTurn, yTurn, TicTacToeTextDIVWidth[3], TicTacToeTextDIVHeight[3]);
  rect(xTurnDisplay, yTurnDisplay, TicTacToeTextDIVWidth[4], TicTacToeTextDIVHeight[4]);
  rect(xScoreBoard, yScoreBoard, TicTacToeTextDIVWidth[5], TicTacToeTextDIVHeight[5]);
  rect(xScoreKeeper1, yScoreKeeper1, TicTacToeTextDIVWidth[6], TicTacToeTextDIVHeight[6]);
  rect(xScoreKeeper2, yScoreKeeper2, TicTacToeTextDIVWidth[7], TicTacToeTextDIVHeight[7]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[3]);
  text(Text[3], xTurn, yTurn, TicTacToeTextDIVWidth[3], TicTacToeTextDIVHeight[3]);
  textFont(TitleFont, FontSizes[4]);
  text(Text[4], xTurnDisplay, yTurnDisplay, TicTacToeTextDIVWidth[4], TicTacToeTextDIVHeight[4]);
  textFont(TitleFont, FontSizes[5]);
  text(Text[5], xScoreBoard, yScoreBoard, TicTacToeTextDIVWidth[5], TicTacToeTextDIVHeight[5]);
  textFont(TitleFont, FontSizes[6]);
  text(Text[6], xScoreKeeper1, yScoreKeeper1, TicTacToeTextDIVWidth[6], TicTacToeTextDIVHeight[6]);
  textFont(TitleFont, FontSizes[7]);
  text(Text[7], xScoreKeeper2, yScoreKeeper2, TicTacToeTextDIVWidth[7], TicTacToeTextDIVHeight[7]);
}
void TicTacToeMultiPlayerMousePressed () {
    for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare)) {
      rect(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare);
    }
  }
}
