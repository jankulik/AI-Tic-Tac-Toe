void field(int x, int y)
{
  rect(x,y,10,300);
  rect(x,y,300,10);
  rect(x+290,y,10,300);
  rect(x,y+290,300,10);
}

void drawX(int x, int y)
{
  rectMode(CENTER);
  translate(x*290, y*290);
  rotate(PI/4.0);
  rect(210,0, 260, 6);
  rotate(-(PI/4.0));  
  translate(300,0);
  rotate(0.75*PI);
  rect(210, 0, 260, 6);
  rotate(-(0.75*PI));
  translate(-(x*290)-300, -(y*290));
  rectMode(CORNER);
}

void drawO(int x, int y)
{
  translate(x*290, y*290);
  ellipse(148,148,220,220);
  fill(255);
  ellipse(148,148,208,208);
  fill(50);
  translate(-(x*290), -(y*290));
}

void draw_board()
{
  
  fill(255);
  rect(190, 950, 500, 120);
  rect(190, 1100, 500, 120);
  fill(50);
  text("Reset", 345, 1185);
  
  for(int i = 0; i < _size; i++)
  {
    for(int j = 0; j < _size; j++)
    {
      field(i*290, j*290);
      if(board[i][j] == 1) drawX(i, j);
      else if(board[i][j] == 2) drawO(i, j);
    }
  }
}
