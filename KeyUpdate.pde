void keyPressed()
{
  if(key == 'w' || key == 'W')
    keys[0]= true;
  if(key == 'a' || key == 'A')
    keys[1]= true;
  if(key == 's' || key == 'S')
    keys[2]= true;
  if(key == 'd' || key == 'D')
    keys[3]= true;
  if(key == 'e' || key == 'E')
    keys[4]= true;
  if(key == 'r' || key == 'R')
    keys[5]= true;
  if(key == 'm' || key == 'M' || key == 1)
    keys[6]= true;
  if(key == 'n' || key == 'N' || key == 2)
    keys[7]= true;
  if(key == CODED)
  {
    if (keyCode == UP)
      keys[8]= true;
    if(keyCode== LEFT)
      keys[9]= true;
    if (keyCode == DOWN)
      keys[10] = true;
    if (keyCode == RIGHT)
      keys[11] = true;
  }
}

void keyReleased()
{
  if(key == 'w' || key == 'W')
    keys[0]= false;
  if(key == 'a' || key == 'A')
    keys[1]= false;
  if(key == 's' || key == 'S')
    keys[2]= false;
  if(key == 'd' || key == 'D')
    keys[3]= false;
  if(key == 'e' || key == 'E')
    keys[4]= false;
  if(key == 'r' || key == 'R')
    keys[5]= false;
  if(key == 'm' || key == 'M' || key == 1)
    keys[6]= false;
  if(key == 'n' || key == 'N' || key == 2)
    keys[7]= false;
  if(key == CODED)
  {
    if (keyCode == UP)
      keys[8]= false;
    if(keyCode == LEFT)
      keys[9]= false;
    if (keyCode == DOWN)
      keys[10] = false;
    if (keyCode == RIGHT)
      keys[11] = false;
  }
} 
