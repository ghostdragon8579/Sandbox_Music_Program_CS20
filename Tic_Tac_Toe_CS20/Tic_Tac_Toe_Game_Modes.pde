boolean CheckWin(int player) {
  int[][] WinningCombinations = {
    {1, 2, 3}, // Top row
    {4, 5, 6}, // Middle row
    {7, 8, 9}, // Bottom row
    {1, 4, 7}, // Left column
    {2, 5, 8}, // Middle column
    {3, 6, 9}, // Right column
    {1, 5, 9}, // Diagonal top-left to bottom-right
    {3, 5, 7}  // Diagonal top-right to bottom-left
  };
  for (int[] Combination : WinningCombinations) {
    if (GridState[Combination[0]] == player &&
        GridState[Combination[1]] == player &&
        GridState[Combination[2]] == player) {
      return true;
    }
  }
  return false;
}
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
  fill(Black);
}
void TicTacToeSinglePlayerMousePressed () {
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
  fill(ResetDefaultInk);
  if (CheckWin(1) && GameWon) {
  rect(xPlayerXWin, yPlayerXWin, TicTacToeTextDIVWidth[12], TicTacToeTextDIVHeight[12]);
  fill(Black);
  textFont(TitleFont, FontSizes[0]);
  text(Text[12], xPlayerXWin, yPlayerXWin, TicTacToeTextDIVWidth[12], TicTacToeTextDIVHeight[12]);
  } else if (CheckWin(2) && GameWon) {
  fill(ResetDefaultInk);
  rect(xPlayerOWin, yPlayerOWin, TicTacToeTextDIVWidth[13], TicTacToeTextDIVHeight[13]);
  fill(Black);
  textFont(TitleFont, FontSizes[0]);
  text(Text[12], xPlayerOWin, yPlayerOWin, TicTacToeTextDIVWidth[13], TicTacToeTextDIVHeight[13]);
  }
}
void TicTacToeMultiPlayerMousePressed () {
  if (GameWon) {
    return;
  }
  for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare) && GridState[i] == 0) {
    if (PlayerO == false && PlayerX == true) {
      GridState[i] = 1;
      if (CheckWin(1)) {
        GameWon = true;
      }
      PlayerX = false;
      PlayerO = true;
    } else if (PlayerX == false && PlayerO == true) {
      GridState[i] = 2;
      if (CheckWin(2)) {
        GameWon = true;
      }
      PlayerX = true;
      PlayerO = false;
      }
    }
  }
}
