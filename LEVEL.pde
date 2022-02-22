// This is super class for all levels //<>// //<>// //<>//
class Level {
  // Create two players on the map.
  Player Player1, Player2;
  int score = 0;
  int timeStarted = 0;
  int timeElapsed = 0;
  int gameMaxTimeSec = 5 * 60;
  int thisLevel;
  boolean optionMenu = false;

  // Array of interactiveObjects on the level, assigned uniquely in each sub-class - Level1 ... Level5
  // ArrayList is like an array but can dynamically change size
  ArrayList<InteractiveObject> interactiveObjects = new ArrayList<InteractiveObject>();  

  // This super class shouldn't be used by itself.
  // For the constructor look at each level - Level1...5 
  Level() {
    timeStarted = millis();
  }

  // If player wants to change/exit lvl he would do something (eg. click on exit button) and this method would return integer value (eg 0 to continue lvl, 1 to change lvl, 2 to exit, etc.)
  // This is like draw, it updates scene, and players' position
  int updateTick() {

    // Draw current level
    drawLevel();

    // Draw all objects
    for (int i = 0; i < interactiveObjects.size(); i++)
      interactiveObjects.get(i).drawObject();

    textSize(32);
    fill(#81EB16);
    score = max(score, 0);
    text("Score: " + score, width - 350, 45);

    fill(#FF6032);
    int sec = gameMaxTimeSec - (millis() - timeStarted) / 1000;
    int min = sec / 60;
    text(min + ":" + (sec % 60 < 10 ? "0" : "") + sec % 60, width - 100, 45);

    // Menu Button
    fill(#FA8072);
    rect(15, 15, 50, 50, 10);
    fill(255);
    rect(25, 20, 10, 40);
    rect(45, 20, 10, 40);

    if (optionMenu) {
      // draw background
      Player1.drawPlayer();
      Player2.drawPlayer();

      drawOptionMenu();

      if (mousePressed == true && mouseX > 660 && mouseX < 880 && mouseY > 432 && mouseY < 467)
        return 6;
      if (mousePressed == true && mouseX > 660 && mouseX < 880 && mouseY > 492 && mouseY < 527)
        return 7;
      if (mousePressed == true && mouseX > 660 && mouseX < 880 && mouseY > 552 && mouseY < 587)
        return 8;
      if (mousePressed == true && mouseX > 540 && mouseX < 590 && mouseY > 240 && mouseY < 290)
      {
        optionMenu = false;
      }

      if (mouseX > 660 && mouseX < 880 && mouseY > 432 && mouseY < 467)
        cursor(HAND);
      else if (mouseX > 660 && mouseX < 880 && mouseY > 492 && mouseY < 527)
        cursor(HAND);
      else if (mouseX > 660 && mouseX < 880 && mouseY > 552 && mouseY < 587)
        cursor(HAND);
      else if (mouseX > 540 && mouseX < 590 && mouseY > 240 && mouseY < 290)
        cursor(HAND);
      else
        cursor(ARROW);
    } else {    
      // Update Players' pos
      Player1.updatePlayer(this);
      Player2.updatePlayer(this);

      // Check for player_1's actions - Pick up/Put down
      if (keys[5] == true && millis() - Player1.actionT > 300) 
      {
        if (Player1.grabbedObject == null) 
        {
          int closestObjectIndex = getClosestObjectId(Player1.X, Player1.Y, true);
          if (closestObjectIndex != -1) 
          {
            InteractiveObject reachedObject = interactiveObjects.get(closestObjectIndex).pickUpRequest();
            if (reachedObject != null) 
            {
              Player1.grabbedObject = reachedObject;
            }
            Player1.actionT = millis();
          }
        } else if (Player1.grabbedObject != null) 
        {
          int closestObjectIndex = getClosestObjectId(Player1.X, Player1.Y, false);
          if (closestObjectIndex != -1) 
          {
            if (interactiveObjects.get(closestObjectIndex).placeDownRequest(Player1.grabbedObject))
              Player1.grabbedObject = null;
            Player1.actionT = millis() + 100;
          }
        }
      }

      // Check for player_1's actions - Pick up/Put down
      if (keys[4] == true && millis() - Player1.actionT > 100) 
      {
        int closestObjectIndex = getClosestObjectId(Player1.X, Player1.Y, true);
        if (closestObjectIndex != -1) {
          interactiveObjects.get(closestObjectIndex).interactRequest();
          Player1.actionT = millis();
        }
      }

      // Check for player_2's actions - Pick up/Put down
      if (keys[6] == true && millis() - Player2.actionT > 300) 
      {
        if (Player2.grabbedObject == null) 
        {
          int closestObjectIndex = getClosestObjectId(Player2.X, Player2.Y, true);
          if (closestObjectIndex != -1) 
          {
            InteractiveObject reachedObject = interactiveObjects.get(closestObjectIndex).pickUpRequest();
            if (reachedObject != null) 
            {
              Player2.grabbedObject = reachedObject;
            }
            Player2.actionT = millis();
          }
        } else if (Player2.grabbedObject != null) 
        {
          int closestObjectIndex = getClosestObjectId(Player2.X, Player2.Y, false);
          if (closestObjectIndex != -1) 
          {
            if (interactiveObjects.get(closestObjectIndex).placeDownRequest(Player2.grabbedObject))
              Player2.grabbedObject = null;
            Player2.actionT = millis() + 100;
          }
        }
      }

      // Check for player_2's actions - Pick up/Put down
      if (keys[7] == true && millis() - Player2.actionT > 100) 
      {
        int closestObjectIndex = getClosestObjectId(Player2.X, Player2.Y, true);
        if (closestObjectIndex != -1) {
          interactiveObjects.get(closestObjectIndex).interactRequest();
          Player2.actionT = millis();
        }
      }

      if (millis() - timeStarted > gameMaxTimeSec * 1000)
        return 10;

      if (mousePressed == true && mouseX > 15 && mouseX < 65 && mouseY > 15 && mouseY < 65)
      {
        optionMenu = true;
      }

      if (mouseX > 15 && mouseX < 65 && mouseY > 15 && mouseY < 65)
        cursor(HAND);
      else
        cursor(ARROW);
    }

    return 0;
  }

  void drawOptionMenu()
  {
    fill(0, 0, 0, 150);
    rect(0, 0, 1600, 900);

    fill (#E3CEBE);  
    stroke (#E3CEBE);
    rect(560, 255, 430, 375, 10);

    stroke(0);
    fill(#BFB3A9);
    rect(540, 240, 50, 50, 10);

    fill(0);
    textSize(45);
    text("X", 550, 282);

    textSize(50);
    textAlign(CENTER);
    text("Overcooked", 770, 330);

    fill(#FA8072);
    stroke(0);
    rect(660, 432, 220, 35, 10);
    rect(660, 492, 220, 35, 10);
    rect(660, 552, 220, 35, 10);

    fill(0);
    textSize(30);
    text("Main Menu", 770, 460);
    text("Controls", 770, 520);
    text("How To Play", 770, 580);

    textSize(20);
    fill(#FF0000);
    text("WARNING!", 770, 375);
    text("Your progress will be lost if you leave!", 770, 395);

    textAlign(LEFT);
  }

  final int maxGrabDistance = 115; // maximum grab distance in px
  // Get Index of desired type of Object which is the closest and in maxGrabDistance.
  // Eg. get object -> from which other objects can be picked up - pickUpAction = true;
  //                -> which can hold another object - pickUpAction = false;                        
  int getClosestObjectId(int playerX, int playerY, boolean pickUpAction) {
    int closestIdx = -1, closestDist = 13225; // closestDist = maxGrabDistance * maxGrabDistance

    for (int idx = 0; idx < interactiveObjects.size(); idx++) {
      if (pickUpAction && !interactiveObjects.get(idx).ObjectsCanBePicked) // If player wants to pick up object, but this object can not hold other obj -> skip this object
        continue;
      else if (!pickUpAction && !interactiveObjects.get(idx).ObjectsCanBePlaced) // If player wants to place object, but this object can not hold other obj -> skip this object
        continue;

      int newDist = (int)(pow(playerX - interactiveObjects.get(idx).X, 2) + pow(playerY - interactiveObjects.get(idx).Y, 2)); // calculate distance fomr player to idx's object
      if (newDist < closestDist) {
        closestDist = newDist;
        closestIdx = idx;
      }
    }

    return closestIdx;
  }

  // ------------------------------- Tools -------------------------------
  // This method is called to drawLevel, the inherited classes - Level1..Level5 change (Override) this method to specify how to draw level and not output this massage
  // But if something went wrong and no sub-class is assigned then this massage will let you know.
  //so there is no need to call 5 different methods for each level.
  void drawLevel() {
    println("---------------------- ERROR - Level - No inherited level assigned ----------------------");
  }

  // Same principle as drawLevel, because each level is unique, each of them change (Override) this method to adjust Player's motion
  // But, if something went wrong and no sub-class is assigned then this massage will let you know.
  void constrainMotion(Player p) {
    println("---------------------- ERROR - Level - constraints are not initialized for player with " + p.alternateControls + " alternate Controls ----------------------");
  }
}
