class Ingredient extends InteractiveObject { 
  boolean choppable = true; // good grammar, states if ingredient is possible to be chopped. true by default
  boolean chopped = false;
  boolean rotten = false;
  
  @Override
  String classType(){
    return "InteractiveObject";
  }
  
  Ingredient(){ // This constructor doesn't specify starting position, shouldn't be used, but will inform if used.
    println("---------------------- ERROR - Ingredient - argument-less constructor is used, position is not specified ----------------------");
  }
  
  // This constructor specifies starting position.
  Ingredient(int _x, int _y, boolean _choppable, float chanceToRot){ 
    X = _x;
    Y = _y;
    choppable = _choppable;
    rotten = random(1) <= chanceToRot ? true : false;
  }
}

// -------------------------------  These sub-classes specify unique chracteristics of each ingredient, eg. how it looks when it's not chopped, how it looks when it is not, etc..
class Cheese extends Ingredient{
  // calls default super constructor to assign starting position
  Cheese(int _x, int _y, float chanceToRot){ 
    super(_x, _y, true, chanceToRot);
  }
    
  @Override
  void drawObject(){
    if (rotten == false){
      noTint();
      if(!chopped)
        image(cheese,X,Y,50,50);
      else
        image(cheeseSliced,X,Y,50,50); 
    } 
    else {
      tint(#618358);
      image(cheese,X,Y,50,50);
      noTint();
    }
  }
  
  @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      if(!chopped)
        image(cheese,X,Y,xSize,ySize);
      else
        image(cheeseSliced,X,Y,xSize,ySize); 
    } 
    else {
      tint(#618358);
      image(cheese,X,Y,xSize,ySize);
      noTint();
    }
  }
  
}

class Mushroom extends Ingredient{
  Mushroom(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, true, chanceToRot);
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) 
    {
      noTint();
      if(!chopped)
        image(mushroom,X,Y,50,50);
      else
        image(mushroomSliced,X,Y,50,50);
    } 
    else 
    {
      tint(#618358);
      image(mushroom,X,Y,50,50);
      noTint();
    }
  }
  
  @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      if(!chopped)
        image(mushroom,X,Y,xSize,ySize);
      else
        image(mushroomSliced,X,Y,xSize,ySize); 
    } 
    else {
      tint(#618358);
      image(mushroom,X,Y,xSize,ySize);
      noTint();
    }
  }
  
}

class Potato extends Ingredient{
  Potato(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, true, chanceToRot);
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) {
      noTint();
      if(!chopped)
        image(potato,X,Y,50,50);
      else
        image(potatoSliced,X,Y,50,50);
    } 
    else {
      tint(#618358);
      image(potato,X,Y,50,50);
      noTint();
    }
  }
  
  @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      if(!chopped)
        image(potato,X,Y,xSize,ySize);
      else
        image(potatoSliced,X,Y,xSize,ySize); 
    } 
    else {
      tint(#618358);
      image(potato,X,Y,xSize,ySize);
      noTint();
    }
  }
  
}

class Tomato extends Ingredient{
  Tomato(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, true, chanceToRot);
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) {
      noTint();
      if(!chopped)
        image(tomato,X,Y,50,50);
      else
        image(tomatoSliced,X,Y,50,50);
    } 
    else {
      tint(#618358);
      image(tomato,X,Y,50,50);
      noTint();
    }
  }
  
  @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      if(!chopped)
        image(tomato,X,Y,xSize,ySize);
      else
        image(tomatoSliced,X,Y,xSize,ySize); 
    } 
    else {
      tint(#618358);
      image(tomato,X,Y,xSize,ySize);
      noTint();
    }
  }
  
}

class Salami extends Ingredient{
  Salami(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, false, chanceToRot);
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) {
      noTint();
      image(salami,X,Y,50,50);
    } else {
      tint(#618358);
      image(salami,X,Y,50,50);
      noTint();
    }
  }
  
  @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      image(salami,X,Y,xSize,ySize);
    } 
    else {
      tint(#618358);
      image(salami,X,Y,xSize,ySize);
      noTint();
    }
  }
  
}

class Pepperoni extends Ingredient{
  Pepperoni(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, false, chanceToRot);
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) {
      noTint();
      image(pepperoni,X,Y,50,50);
    } else {
      tint(#618358);
      image(pepperoni,X,Y,50,50);
      noTint();
    }
  }
  
    @Override
  void drawObject(int xSize, int ySize){
    if (rotten == false){
      noTint();
      image(pepperoni,X,Y,xSize,ySize);
    } 
    else {
      tint(#618358);
      image(pepperoni,X,Y,xSize,ySize);
      noTint();
    }
  }
}
