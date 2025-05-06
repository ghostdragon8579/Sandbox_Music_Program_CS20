void TicTacToeSinglePlayer () {
}
void TicTacToeSinglePlayerMousePressed () {
    for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare)) {
      rect(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare);
    }
  }
}
void TicTacToeMultiPlayer () {
  strokeWeight(2);
  rect(xTurn, yTurn, TicTacToeTextDIVWidth[3], TicTacToeTextDIVHeight[3]);
  rect(xTurnDisplay, yTurnDisplay, TicTacToeTextDIVWidth[4], TicTacToeTextDIVHeight[4]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[3]);
  text(Text[3], xTurn, yTurn, TicTacToeTextDIVWidth[3], TicTacToeTextDIVHeight[3]);
  textFont(TitleFont, FontSizes[4]);
  text(Text[4], xTurnDisplay, yTurnDisplay, TicTacToeTextDIVWidth[4], TicTacToeTextDIVHeight[4]);
}
void TicTacToeMultiPlayerMousePressed () {
    for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare)) {
      rect(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare);
    }
  }
}
