boolean win_row;
boolean win_col;
boolean win_dia1;
boolean win_dia2;

void check_win(int[][] tab)
{
  for(int i = 0; i < _size; i++)
  {
    win_row = true;
    win_col = true;
    for(int j = 0; j < _size - 1; j++)
    {
      if(tab[j][i] != tab[j+1][i] || tab[j][i] == 0) win_row = false;
      if(tab[i][j] != tab[i][j+1] || tab[i][j] == 0) win_col = false;
    }
    if(win_row) win = tab[0][i];
    if(win_col) win = tab[i][0];
  }
  
  win_dia1 = true;
  win_dia2 = true;
  for(int i = 0; i < _size - 1; i++)
  {
    if(tab[i][i] != tab[i+1][i+1] || tab[i][i] == 0) win_dia1 = false;
    if(tab[_size-i-1][i] != tab[_size-i-2][i+1] || tab[_size-i-1][i] == 0) win_dia2 = false;
  }
  if(win_dia1) win = tab[0][0];
  if(win_dia2) win = tab[_size-1][0];
   
  if(win == 1) text("Lines win!", 280, 1035);
  else if(win == 2) text("Circles win!", 255, 1035);
  else if(counter == _size * _size) win = 3;
  if(win != 0) counter = 0;
}

void reset()
{
  for(int i = 0; i < _size; i++)
  {
    for(int j = 0; j < _size; j++)
    {
      board[i][j] = 0;
    }
  }
  
  possible_num = 0;
  counterX = 0;
  counterO = 0;
  
  background(255);
  win = 0;
  move = false;
}
