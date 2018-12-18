/*

simple AI that learns how to play Tic Tac Toe
AI increases the probability of victory with a random-shooting opponent from 33% to 66% (as a circle)

created in 2018
by Jan Kulik

in order to start learning process, change the "learn" variable to true and wait until the AI plays 10,000 games

*/

boolean learn = false;
int _size = 3;
int[][] board = new int[_size][_size];
int x, y;
boolean move;
int win = 0;
int generation = 0;

int[][] buffor;
String[] lines;

int counter = 0;
int counterX = 0;
int counterO = 0;

PrintWriter output;

void setup() 
{
  size(440, 600);
  stroke(50);
  fill(50);
  textSize(32);
  
  reset();
  if(learn) output = createWriter("data.txt");
  else read_data();
}

void draw()
{
  draw_board();
  
  if(learn)
  {
    playerX();
    playerO();
    save_data();
  }
  
  check_win(board);
  
  if(!learn) ai();
}

void mousePressed()
{
  if(mouseX >= 0 && mouseX <= _size * 145 && mouseY >= 0 && mouseY <= _size * 145)
  {
    x = mouseX / 145;
    y = mouseY / 145;
    if(board[x][y] == 0 && win == 0)
    {
      board[x][y] = 1;
      move = true;
      if(!learn)
      {
        counterX++;
        difference_min = 0;
        difference_prev = 10;
        possible_num = 0;
      }
    }
  } 
  else if(mouseX >= 110 && mouseX <= 330 && mouseY >= 530 && mouseY <= 580) reset();
}
