// A little bit of explanations...
/*
      Structure of Levels uses Inheritance
      Inheritance can be defined as the process where one class acquires the properties (methods and fields) of another.
      -> LEVEL is super class, it contains method to update frame, draw frame (but doesn't specify what to draw), Players.
      -> LEVEL1,2,3,4,5 are inherited sub-classes, which specify what and where to draw and what are constraints for player movement, as these are unique for each level.
      
      Same for Food:
      -> Ingredient is super class
      -> Mashrooms, cheese, etc. are inherited from super class, as they all ingredients 
                    and share similarities like have - position, can be picked, etc.
      Same for intercative objects.
      
      Inheritance in Java   ->   https://www.geeksforgeeks.org/inheritance-in-java/
*/
Level game; // Instance which contains assigned level, eg. it should be one of inherited classes Level1/Level2...Level5/Menu, etc.
            // Therfore there is no need to create all levels separately, and then during level change - turning one on and turning another off.
            // For example at the start of the game this will be something like - "game = new MainMenu();"
            // draw function then does -> "int change = game.updateTick();", 
            // So the screen is updated, main menu is drawn, and the action is written (in the from of integer) to variable change
            // So if action is (for example) '0' then nothing would happen and the screen would update once again and return action (again), and it will continue in loop
            // Unitl returned action is (for example) '1' then it would mean that user want change lvl, like
            // if 1 then game = new Level1();  When updateTick() is called level 1 will be drawn
            // or if 2 then game = new Level2();  When updateTick() is called level 2 will be drawn, etc..
            // This way, when "game.updateTick();" will be called, assigned level will be drawen and not the main menu.

/*  ----------------------------------------------------- Flow structre (v 0.2) -----------------------------------------------------
            Eg. - what function and when is called.  
            When game is launched setup is called 1 time, and then draw() in loop, indefinitely  
            
       |  Tab - Main  |              Tab - LEVEL (drawLevel() is specified in each         |              Tab - Player
       |              |                          extended class, Level1 ... Level5)        |
       |    Setup()   |                                                                    | 
       |      ↓       |                              |  -> drawLevel()  ->  draws level    |     | -> updatePos()           - updates Player's Position if proper key is pressed
       |  → draw() -> |  -> game.updateTick() ->  -> |  -> updatePlayer()  ->  ->  ->  ->  |  -> | -> lvl.constrainMotion() - check if player can move this way, eg. there is no wall or table, etc.. if cannot, reset player's coordinates to previous position
       |  ↑      ↓    |                              |  checks for action, etc.            |     | -> drawPlayer()          - draw player at x, y coordinate
       |   ←  ←  ←    |                              |  -> draw all objects                |
                                                                   
                                                                   
                                                                   
                                                                   
    ----------------------------------------------------- Class Hierarchy -----------------------------------------------------
    
               Level - super class for Gameplay in general and UI                      InteractiveObject
                |      updates frame, positions, manages interactions                    |
                |                                                                        | ->     ->     ->     ->   Ingredient
                | -> Level 1                                                             | -> Pan                       |
                | -> Level 2                                                             | -> Chopping Board            | -> Tomato
                | -> Level 3                                                             | -> Plate                     | -> Potato
                | -> Level 4                                                             | -> Oven                      | -> Mushroom
                | -> Level 5                                                             | -> Bin                       | -> Salami
                | -> Menu Screen                                                         | -> Tray                      | -> Cheese
                | -> Controls                                                            | -> Serving Tray              | -> Pepperoni
                | -> Level Selection Menu                                                | -> Dishwasher                
                | -> How to Play Screen                                                  | -> Storage                   
                                                                                         | -> Pot
                                                                                         | -> Dough
             
               Player - class for player, draws player, updates position, etc.
                                                                       
                                                                                                                                                                                                                                                                                                                                                                             
*/
            
boolean[] keys; //----Player 1---- 
                // 0 - W                Move UP
                // 1 - A                Move LEFT
                // 2 - S                Move DOWN
                // 3 - D                Move RIGHT
                // 4 - E                Chop
                // 5 - R                Pick up/Put down
                //----Player 2---- 
                // 6 - M, 1             Pick up/Put down
                // 7 - N, 2             Chop
                // 8 - UP               Move UP
                // 9 - LEFT             Move LEFT
                // 10 - DOWN            Move DOWN
                // 11 - RIGHT           Move RIGHT

/* Level/Screen Indexes
   0 - Reserved 
   1 - Level 1
   2 - Level 2
   3 - Level 3
   4 - Level 4
   5 - Level 5
   6 - Main Menu
   7 - Controls screen
   8 - How to Play screen
   9 - Level Select Menu
*/

// Assignes screen size, framerate
void setup()
{
  size(1600,900);
  frameRate(60);
  preloadImages();
  
  keys = new boolean[12];
  for (int i = 0; i < keys.length; i++)
    keys[i] = false;
  
  // The game should start with Main Menu/Level, then change to chosen lvl by user. 
  game = new MenuScreen();
}

// This function is called 60 times per second by Processing.
// This function calls 'updateTick' function from the 'game' instance to update game's State       -->  'updateTick' function is in tab 'LEVEL'
// If 'updateTick' function returns not 0 it means user lost/wants to change levl
// -> Therefore it would reassign 'game' instance to requsted lvl.
void draw()
{ 
  int change = game.updateTick();
  
  if(change != 0) // If 0 no action, if not 0 -> change level
    changeLevel(change);
  
  fill(#000000);
  //text("(" + mouseX + ", " + mouseY + ")", mouseX, mouseY);
}

void changeLevel(int data){
  // Change game class depending on returned index
  switch(data){
    case 1:
      game = new Level1();
      break;
    case 2:
      game = new Level2();
      break;
    case 3:
      game = new Level3();
      break;
    case 4:
      game = new Level4();
      break;
    case 5:
      game = new Level5();
      break;
    case 6:
      game = new MenuScreen();
      break;
    case 7:
      game = new ControlScreen();
      break;
    case 8:
      game = new InstructionScreen();
      break;
    case 9:
      game = new LevelSelect();
      break;
    case 10:
      int savedScore = game.score;
      int lvlReplay = game.thisLevel;
      game = new ScoreScreen();
      game.score = savedScore;
      game.thisLevel = lvlReplay;
      break;
  }
}
