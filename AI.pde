int possible_move[][] = new int[100][9];
int possible_num = 0;
int difference;
int difference_min = 0;
int difference_prev = 10;

void ai()
{  
  if(win == 0 && move)
  {
    for(int i = 0; i < lines.length; i++)
    {
      difference = 1;
      int l = 0;
      int board_number = 0;
      
      for(int j = 0; j < _size; j++)
      {
        for(int k = 0; k < _size; k++)
        {
          if(board[j][k] != buffor[i][l]) difference++;
          if(buffor[i][l] == 1) board_number++;
          l++;
        }
      }
      
      if(difference > difference_min && difference <= difference_prev && counterX == board_number)
      {
        if(difference < difference_prev) possible_num = 0;
        
        if(possible_num < 100)
        {
          for(int j = 0; j < 9; j++)
          {
            possible_move[possible_num][j] = buffor[i][j];
          }
          
          difference_prev = difference;
          possible_num++;
        }
      }
    }
    
    int decision = int(random(possible_num-1));
    make_move(board, decision);
    
    if(move)
    {
      difference_min = difference;
      possible_num = 0;
      if(possible_num == 0) playerO();
    }
  }
}

void make_move(int[][] tab, int decision)
{
  int k = 0;     
  for(int i = 0; i < 3; i++)
  {
    for(int j = 0; j < 3; j++)
    {
      if(possible_move[decision][k] == 2 && tab[i][j] != possible_move[decision][k] && tab[i][j] != 1 && move)
      {
        tab[i][j] = possible_move[decision][k];
        move = false;
      }
      k++;
    }
  }
}

void playerX()
{
  if(win == 0 && !move)
  {
    int rx = int(random(3));
    int ry = int(random(3));
    if(board[rx][ry] == 0)
    {
      board[rx][ry] = 1;
      move = true;
      counter++;
      counterX++;
      
      difference_min = 0;
      difference_prev = 10;
      possible_num = 0;    
    }
  }
}

void playerO()
{
  if(win == 0 && move)
  {
    int rx = int(random(3));
    int ry = int(random(3));
    if(board[rx][ry] == 0)
    {
      board[rx][ry] = 2;
      move = false;
      counter++;
      
      if(learn)
      {
        for(int i = 0; i < _size; i++)
        {
          for(int j = 0; j < _size; j++)
          {
            movements[counterO][i][j] = board[i][j];
          }
        }
        counterO++;
      }
    }
  }
}
