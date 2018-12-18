void field(int x, int y)
{
  rect(x,y,5,150);
  rect(x,y,150,5);
  rect(x+145,y,5,150);
  rect(x,y+145,150,5);
}

void drawX(int x, int y)
{
  rectMode(CENTER);
  translate(x*145, y*145);
  rotate(PI/4.0);
  rect(105,0, 130, 3);
  rotate(-(PI/4.0));  
  translate(150,0);
  rotate(0.75*PI);
  rect(105,0, 130, 3);
  rotate(-(0.75*PI));
  translate(-(x*145)-150, -(y*145));
  rectMode(CORNER);
}

void drawO(int x, int y)
{
  translate(x*145, y*145);
  ellipse(74,74,110,110);
  fill(255);
  ellipse(74,74,104,104);
  fill(50);
  translate(-(x*145), -(y*145));
}

void draw_board()
{
  fill(255);
  rect(110, 460, 220, 50);
  rect(110, 530, 220, 50);
  fill(50);
  text("Reset", 178, 565);
  
  for(int i = 0; i < _size; i++)
  {
    for(int j = 0; j < _size; j++)
    {
      field(i*145, j*145);
      if(board[i][j] == 1) drawX(i, j);
      else if(board[i][j] == 2) drawO(i, j);
    }
  }
}
