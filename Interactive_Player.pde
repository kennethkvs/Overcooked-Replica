class Player{
  int speed = 10; // Player's speed
  int X, prevPosX;
  int Y, prevPosY;
  boolean alternateControls = false;  // false - Player1 - WASD control
                                      // true - Player2 - Arrows control
  InteractiveObject grabbedObject = null;
  int actionT = 0; // Sometimes action is processed too quickly, eg. object is grabbed and then quickly released, time delay needed.
  
  // Initialize instance
  Player(int startX, int startY, boolean controls){
    X = startX;
    Y = startY;
    alternateControls = controls;
  }
  
  void updatePlayer(Level lvl){
    prevPosX = X;
    prevPosY = Y;
    updatePos();
    lvl.constrainMotion(this); // Constrain motion of this player according to level rules
    drawPlayer();
  }
  
  // Draw Player
  void drawPlayer(){
    if(alternateControls){
      fill(#0197f6);
      ellipse(X, Y, 100, 100);
      noTint();
      image(chef,X-30,Y-33,60,60);
    }
    else{
      fill(#e3242b);
      ellipse(X, Y, 100, 100);
      noTint();
      image(chef,X-30,Y-33,60,60);
    }
    
    if(grabbedObject != null){
      grabbedObject.updatePosition(X, Y);
    } 
  }
  
  // Update Player Position
  void updatePos(){
    if(alternateControls) // Arrows
    {
      if (keys[8]) 
        Y -= speed;
      if (keys[9]) 
        X -= speed;
      if (keys[10])
        Y += speed;
      if (keys[11])
        X += speed;
    }
    else // WASD
    {
      if (keys[0]) 
        Y -= speed;
      if (keys[1]) 
        X -= speed;
      if (keys[2])
        Y += speed;
      if (keys[3])
        X += speed;
    }
  }
}
