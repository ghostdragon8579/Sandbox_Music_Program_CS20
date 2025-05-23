boolean CheckWin(int player) {
  int[][] WinningCombinations = {
    {1,2,3}, //Top row
    {4,5,6}, //Middle row
    {7,8,9}, //Bottom row
    {1,4,7}, //Left column
    {2,5,8}, //Middle column
    {3,6,9}, //Right column
    {1,5,9}, //Diagonal top-left to bottom-right
    {3,5,7}  //Diagonal top-right to bottom-left
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
boolean CheckNearWin(int player, int[] resultSquare) {
  int[][] WinningCombinations = {
    {1,2,3}, //Top row
    {4,5,6}, //Middle row
    {7,8,9}, //Bottom row
    {1,4,7}, //Left column
    {2,5,8}, //Middle column
    {3,6,9}, //Right column
    {1,5,9}, //Diagonal top-left to bottom-right
    {3,5,7}  //Diagonal top-right to bottom-left
  };
  for (int[] Combination : WinningCombinations) {
    int CountPlayer = 0;
    int EmptySquare = -1;
    for (int square : Combination) {
      if (GridState[square] == player) {
        CountPlayer++;
      } else if (GridState[square] == 0) {
        EmptySquare = square;
      }
    }
    if (CountPlayer == 2 && EmptySquare != -1) {
      resultSquare[0] = EmptySquare;
      return true;
    }
  }
  return false;
} 
void TicTacToeSinglePlayer () {
  if (!DifficultySelected) {
  strokeWeight(2);
  rect(xDifficultySelection, yDifficultySelection, TicTacToeTextDIVWidth[14], TicTacToeTextDIVHeight[14]);
  rect(xDifficultyEasy, yDifficultyEasy, TicTacToeTextDIVWidth[15], TicTacToeTextDIVHeight[15]);
  rect(xDifficultyMedium, yDifficultyMedium, TicTacToeTextDIVWidth[16], TicTacToeTextDIVHeight[16]);
  rect(xDifficultyHard, yDifficultyHard, TicTacToeTextDIVWidth[17], TicTacToeTextDIVHeight[17]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[14]);
  text(Text[14], xDifficultySelection, yDifficultySelection, TicTacToeTextDIVWidth[14], TicTacToeTextDIVHeight[14]);
  fill(Green);
  textFont(TitleFont, FontSizes[15]);
  text(Text[15], xDifficultyEasy, yDifficultyEasy, TicTacToeTextDIVWidth[15], TicTacToeTextDIVHeight[15]);
  fill(Orange);
  textFont(TitleFont, FontSizes[16]);
  text(Text[16], xDifficultyMedium, yDifficultyMedium, TicTacToeTextDIVWidth[16], TicTacToeTextDIVHeight[16]);
  fill(Red);
  textFont(TitleFont, FontSizes[17]);
  text(Text[17], xDifficultyHard, yDifficultyHard, TicTacToeTextDIVWidth[17], TicTacToeTextDIVHeight[17]);
  fill(Black);
  }
  //Win Streak Counter and Win display
  if (DifficultySelected) {
  strokeWeight(2);
  rect(xWinStreak, yWinStreak, TicTacToeTextDIVWidth[10], TicTacToeTextDIVHeight[10]);
  rect(xWinStreakCounter, yWinStreakCounter, TicTacToeTextDIVWidth[11], TicTacToeTextDIVHeight[11]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[10]);
  text(Text[10], xWinStreak, yWinStreak, TicTacToeTextDIVWidth[10], TicTacToeTextDIVHeight[10]);
  textFont(TitleFont, FontSizes[11]);
  text(Text[11], xWinStreakCounter, yWinStreakCounter, TicTacToeTextDIVWidth[11], TicTacToeTextDIVHeight[11]);
  fill(ResetDefaultInk);
  strokeWeight(2);
  rect(xDifficultyDisplay, yDifficultyDisplay, TicTacToeTextDIVWidth[18], TicTacToeTextDIVHeight[18]);
  strokeWeight(1);
  fill(Black);
  textFont(TitleFont, FontSizes[18]);
  text(Text[18], xDifficultyDisplay, yDifficultyDisplay, TicTacToeTextDIVWidth[18], TicTacToeTextDIVHeight[18]);
  if (CheckWin(1) && GameWon) {
  fill(ResetDefaultInk);
  rect(xPlayerWin, yPlayerWin, TicTacToeTextDIVWidth[19], TicTacToeTextDIVHeight[19]);
  fill(Black);
  textFont(TitleFont, FontSizes[0]);
  text(Text[19], xPlayerWin, yPlayerWin, TicTacToeTextDIVWidth[19], TicTacToeTextDIVHeight[19]);
  } else if (CheckWin(2) && GameWon) {
  fill(ResetDefaultInk);
  rect(xComputerWin, yComputerWin, TicTacToeTextDIVWidth[20], TicTacToeTextDIVHeight[20]);
  fill(Black);
  textFont(TitleFont, FontSizes[0]);
  text(Text[20], xComputerWin, yComputerWin, TicTacToeTextDIVWidth[20], TicTacToeTextDIVHeight[20]);
  }
  }
}
void TicTacToeSinglePlayerMousePressed () {
  if (MouseIsOver(xDifficultyEasy, yDifficultyEasy, TicTacToeTextDIVWidth[15], TicTacToeTextDIVHeight[15]) && !DifficultyMedium && !DifficultyHard) {
    DifficultySelected = true;
    DifficultyEasy = true;
  } else if (MouseIsOver(xDifficultyMedium, yDifficultyMedium, TicTacToeTextDIVWidth[16], TicTacToeTextDIVHeight[16]) && !DifficultyEasy && !DifficultyHard) {
    DifficultySelected = true;
    DifficultyMedium = true;
  } else if (MouseIsOver(xDifficultyHard, yDifficultyHard, TicTacToeTextDIVWidth[17], TicTacToeTextDIVHeight[17]) && !DifficultyEasy && !DifficultyMedium) {
    DifficultySelected = true;
    DifficultyHard = true;
  }
  if (GameWon) {
    return;
  }
  ArrayList<Integer> availableSquares = new ArrayList<Integer>();
  for (int i = 1; i <= 9; i++) {
    if (MouseIsOver(xGameGrid[i], yGameGrid[i], widthGameGridSquare, heightGameGridSquare) && GridState[i] == 0) {
    if (!ComputerTurn && PlayerTurn && DifficultySelected) {
      GridState[i] = 1;
      if (CheckWin(1)) {
      GameWon = true;
      SinglePlayerWinStreak++;
    }
      PlayerTurn = false;
      ComputerTurn = true;
    } else if (!PlayerTurn && ComputerTurn && DifficultySelected) {
      if (GridState[i] == 0) {
        availableSquares.add(i);
        }
      PlayerTurn = false;
      ComputerTurn = true;
      }
    }
  }
  //
  //Single Player Easy Difficulty Computer
  if (!PlayerTurn && ComputerTurn && DifficultyEasy && !GameWon) {
    availableSquares.clear();
    for (int i = 1; i <= 9; i++) {
      if (GridState[i] == 0) {
        availableSquares.add(i);
      }
    }
  if (!availableSquares.isEmpty()) {
    int randomIndex = int(random(availableSquares.size()));
    int selectedSquare = availableSquares.get(randomIndex);
    GridState[selectedSquare] = 2;
    println("Computer selects square: " + selectedSquare);
    if (CheckWin(2)) {
      GameWon = true;
      SinglePlayerWinStreak = 0;
    }
      PlayerTurn = true;
      ComputerTurn = false;
    } else {
      println("Error no available squares.");
    }
  }
  //
  //Single Player Medium Difficulty Computer
  if (!PlayerTurn && ComputerTurn && DifficultyMedium && !GameWon) {
    availableSquares.clear();
    for (int i = 1; i <= 9; i++) {
      if (GridState[i] == 0) {
        availableSquares.add(i);
      }
    }
  if (!availableSquares.isEmpty()) {
    int randomIndex = int(random(availableSquares.size()));
    int selectedSquare = availableSquares.get(randomIndex);
    GridState[selectedSquare] = 2;
    println("Computer selects square: " + selectedSquare);
    if (CheckWin(2)) {
      GameWon = true;
      SinglePlayerWinStreak = 0;
    }
      PlayerTurn = true;
      ComputerTurn = false;
    } else {
      println("Error no available squares.");
    }
  }
  //
  //Single Player Hard Difficulty Computer
  if (!PlayerTurn && ComputerTurn && DifficultyHard && !GameWon) {
    availableSquares.clear();
    for (int i = 1; i <= 9; i++) {
      if (GridState[i] == 0) {
        availableSquares.add(i);
      }
    }
    if (GridState[5] == 0) {
    GridState[5] = 2;
    if (CheckWin(2)) {
      GameWon = true;
      SinglePlayerWinStreak = 0;
    }
      PlayerTurn = true;
      ComputerTurn = false;
    } else {
    int[] blockSquare = new int[1];
  if (CheckNearWin(1, blockSquare)) {
    GridState[blockSquare[0]] = 2;
    println("Player's win blocked at square: " + blockSquare[0]);
    if (CheckWin(2)) {
      GameWon = true;
      SinglePlayerWinStreak = 0;
    }
      PlayerTurn = true;
      ComputerTurn = false;
    } else {
  if (!availableSquares.isEmpty()) {
    int randomIndex = int(random(availableSquares.size()));
    int selectedSquare = availableSquares.get(randomIndex);
    GridState[selectedSquare] = 2;
    if (CheckWin(2)) {
      GameWon = true;
      SinglePlayerWinStreak = 0;
    }
      PlayerTurn = true;
      ComputerTurn = false;
    } else {
      println("Error no available squares.");
    }
    }
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
  text(Text[13], xPlayerOWin, yPlayerOWin, TicTacToeTextDIVWidth[13], TicTacToeTextDIVHeight[13]);
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
        MultiPlayerXScore++;
      }
      PlayerX = false;
      PlayerO = true;
    } else if (PlayerX == false && PlayerO == true) {
      GridState[i] = 2;
      if (CheckWin(2)) {
        GameWon = true;
        MultiPlayerOScore++;
      }
      PlayerX = true;
      PlayerO = false;
      }
    }
  }
}
