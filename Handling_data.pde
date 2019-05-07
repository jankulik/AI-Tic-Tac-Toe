int[][][] movements = new int[4][_size][_size];

void save_data()
{
  if(win == 2)
  { 
    for(int i = 0; i < counterO; i++)
    {
      for(int j = 0; j < 3; j++)
      {
        for(int k = 0; k < 3; k++)
        {
          output.print(movements[i][j][k]);
          if(j == 2 && k == 2) output.println("");
          else output.print(" ");
        }
      }
    }
  }
  
  if(win != 0)
  {
    generation++;
    reset();
  }
  
  if(generation == 100)
  {
    output.flush();
    output.close();
    exit();
  }
}

void read_data()
{
  lines = loadStrings("data.txt");
  buffor = new int[lines.length][9];

  for(int i = 0; i < lines.length; i++)
  {
    buffor[i] = int(split(lines[i], ' '));
  }
}
