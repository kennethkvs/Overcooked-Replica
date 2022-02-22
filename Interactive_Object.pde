/*
      This is the super class for interactive objects and ingredients
      This type of object would be able to:
        -  hold other objects inside/on top of it.
        -  be held by a player (could be specified not to allow it)
        -  do some actions and be interactive.
      But this class will not be used by itself, it is just a super class to specify common mechanics and variables
      Specific stuff will be inherited from this super-class
      Example of interactive objects/surfaces: Pan, Pot, Oven, Chopping board, table surfaces which it is possible to place other objects 
*/
class InteractiveObject {
  final int maxGrabDistance = 115;
  
  int X, Y; // Object's position
  
  boolean ObjectsCanBePlaced = false,
          ObjectsCanBePicked = false;
  
  String classType(){
    return "InteractiveObject";
  }
  
  // Argument-less constructor
  InteractiveObject(){}

  InteractiveObject(int _x, int _y, boolean placed, boolean picked){
    X = _x;
    Y = _y;
    ObjectsCanBePlaced = placed;
    ObjectsCanBePicked = picked;
  }
  
  void updatePosition(){   
    drawObject();
  }
  
  void updatePosition(int newX, int newY){   
    X = newX; // asssign X position
    Y = newY; // asssign Y position
    drawObject();
  }
  
  void updatePosition(int newX, int newY, int xSize, int ySize){   
    X = newX; // asssign X position
    Y = newY; // asssign Y position
    drawObject(xSize, ySize);
  }
  
  // Called to draw Object, should be overrided, if not will inform  
  // This is super class which contains only similar features. Eeach object drawn differently and this specifications are specified in each inherited sub-class, and there this function is overwritten (Override prefix before this function)
  void drawObject(){
    println("---------------------- ERROR - Interactive Object is not specified ----------------------");
  }
  
  void drawObject(int xSize, int ySize){
    println("---------------------- ERROR - Interactive Object is not specified ----------------------");
  }
  
  
  // Called when player wants to place obj in it
  boolean placeDownRequest(InteractiveObject objectToPlace){
    return false;
  }
  
  // Called when player wants to pick up obj from it
  InteractiveObject pickUpRequest(){
    return null;
  }
  
  // Called when player wants to interact with this obj
  void interactRequest(){
    
  }
}

//--------------------------------------------------------------------------   Storage   --------------------------------------------------------------------------
class Storage extends InteractiveObject{
  InteractiveObject heldObject = null;
  String ingredientType;
  float chanceToRot = 1;
  Storage(int _x, int _y, float _chanceToRot, String _ingredientType){
    super(_x, _y, true, true);
    chanceToRot = _chanceToRot;
    ingredientType = _ingredientType;
    spawnIngredient();
  }
  
  void spawnIngredient(){
    switch(ingredientType){
      case "Cheese":
        heldObject = new Cheese(X, Y, chanceToRot);
        break;
      case "Mushroom":
        heldObject = new Mushroom(X, Y, chanceToRot);
        break;
      case "Potato":
        heldObject = new Potato(X, Y, chanceToRot);
        break;
      case "Tomato":
        heldObject = new Tomato(X, Y, chanceToRot);
        break;
      case "Dough":
        heldObject = new Dough(X, Y, chanceToRot);
        break;
      case "Salami":
        heldObject = new Salami(X, Y, chanceToRot);
        break;
    }
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(ingredientType == "Dough")
      return heldObject.placeDownRequest(objectToPlace);
    return false;  
  }
  
  @Override
  void drawObject(){
    heldObject.updatePosition(X - 25, Y - 25);
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    InteractiveObject temp = heldObject;
    spawnIngredient();
    return temp;
  }
}

//--------------------------------------------------------------------------   Bin   --------------------------------------------------------------------------
class Bin extends InteractiveObject{
  Bin(int _x, int _y){
    super(_x, _y, true, false);
  }
  
  @Override
  void drawObject(){}
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(objectToPlace instanceof Plate){
      if(((Plate)objectToPlace).meal != null){
        ((Plate)objectToPlace).meal = null;
        ((Plate)objectToPlace).dirty = true;
      }
      return false;
    }
    return true;
  }
}

//--------------------------------------------------------------------------   Tray   --------------------------------------------------------------------------
class Tray extends InteractiveObject{
  InteractiveObject heldObject = null;
  Tray(int _x, int _y){
    super(_x, _y, true, true);
  }
  
  @Override
  void drawObject(){
    if(heldObject != null)
      heldObject.drawObject();
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    InteractiveObject temp = heldObject;
    heldObject = null;
    return temp;
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(heldObject == null){
      heldObject = objectToPlace;
      heldObject.updatePosition(X - 25, Y - 25);
      return true;  
    }
    
    return heldObject.placeDownRequest(objectToPlace);
  }
}

//--------------------------------------------------------------------------   Serving Tray   --------------------------------------------------------------------------
class ServingTray extends InteractiveObject{
  InteractiveObject heldObject = null;
  String[] allowedOrders = null;
  ArrayList<String> Orders = new ArrayList<String>();
  int orderUpdateTimeMs = 5000;
  int orderFinished = -10;
  boolean finished = false;
  int previusOrderT;
  ProgressBar choppingProgress;
  Level scoreToUpdate;
  
  ServingTray(int _x, int _y, String[] _allowedOrders, int _orderUpdateTimeMs, Level _scoreToUpdate){
    super(_x, _y, true, true);
    allowedOrders = _allowedOrders;
    orderUpdateTimeMs = _orderUpdateTimeMs;
    previusOrderT = millis() - _orderUpdateTimeMs / 2;
    choppingProgress = new ProgressBar(X + 20, Y - 100, 69, 20, 3000);
    scoreToUpdate = _scoreToUpdate;
  }
  
  @Override
  void drawObject(){
    if(heldObject != null){
      if(!finished && orderFinished + 3000 < millis()){
        Orders.remove(((Plate)heldObject).meal);
        ((Plate)heldObject).dirty = true;
        ((Plate)heldObject).meal = null;
        heldObject.updatePosition(X - 25, Y - 30);
        finished = true;
        scoreToUpdate.score += 200;
        if(Orders.size() == 4)
          previusOrderT = millis();
      }
      choppingProgress.updateState(millis() - orderFinished);
      heldObject.updatePosition();
    }
    
    if(previusOrderT + orderUpdateTimeMs <= millis())
      addOrder();
    
    noTint();
    for(int i = 0; i < Orders.size(); i++){
      switch(Orders.get(i)){
        case "canadianPizza":
          image(canadianPizza, X + 30, Y + i * 65 + 110);
          break;
        case "cheesePizza":
          image(cheesePizza, X + 30, Y + i * 65 + 110);
          break;
        case "mushroomPizza":
          image(mushroomPizza, X + 30, Y + i * 65 + 110);
          break;
        case "pepperoniPizza":
          image(pepperoniPizza, X + 30, Y + i * 65 + 110);
          break;
        case "mushroomSoup":
          image(mushroomSoup, X + 30, Y + i * 65 + 110, 60, 60);
          break;
        case "potatoSoup":
          image(potatoSoup, X + 25, Y + i * 65 + 105, 70, 70);
          break;
        case "tomatoSoup":
          image(tomatoSoup, X + 30, Y + i * 65 + 110, 60, 60);
          break;
      }
    }
  }
  
  void addOrder(){
    previusOrderT = millis();
    if(Orders.size() < 5)
      Orders.add(
        allowedOrders[(int)random(allowedOrders.length)]
      );
    else
      scoreToUpdate.score -= 10;
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    if(finished){
      InteractiveObject temp = heldObject;
      heldObject = null;
      return temp;
    }
    return null;
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(heldObject == null && objectToPlace instanceof Plate && !((Plate)objectToPlace).dirty && Orders.contains(((Plate)objectToPlace).meal)){
      orderFinished = millis();
      heldObject = objectToPlace;
      heldObject.updatePosition(X + 120, Y - 30);
      finished = false;
      return true;
    }
    
    return false;
  }
}

//--------------------------------------------------------------------------   Chopping Board   --------------------------------------------------------------------------
class ChoppingBoard extends InteractiveObject{
  ProgressBar choppingProgress;
  InteractiveObject heldObject = null;
  boolean choppable = false;
  boolean chopped = false;
  int choppingStartedAt = -10; // reserved value
  
  ChoppingBoard(int _x, int _y){
    super(_x, _y, true, true);
    choppingProgress = new ProgressBar(X - 35, Y - 60, 69, 20, 3000);
  }
  
  @Override
  void drawObject(){
    if(heldObject != null){
      if(choppingStartedAt != -10){
        choppingProgress.updateState(millis() - choppingStartedAt);
        if(choppingStartedAt + 3000 < millis()){
          ((Ingredient)heldObject).chopped = true;
          chopped = true;
        }
      }
      heldObject.updatePosition(X - 25, Y - 25);
    }
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    // Release ingredient only if chopping didn't start or it has been chopped
    if(choppingStartedAt == -10 || chopped){
      InteractiveObject temp = heldObject;
      choppingStartedAt = -10;
      heldObject = null;
      return temp;
    }
    
    return null;
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(heldObject == null){
      if (objectToPlace instanceof Ingredient){
        choppable = ((Ingredient)objectToPlace).choppable;
        chopped = ((Ingredient)objectToPlace).chopped;
      }
      else{
        choppable = false;
        chopped = false;
      }
      
      heldObject = objectToPlace;
      return true;
    }
    
    return heldObject.placeDownRequest(objectToPlace);
  }
  
  @Override
  void interactRequest(){
    if(heldObject != null && choppable && !chopped && choppingStartedAt == -10 && !((Ingredient)heldObject).rotten )
      choppingStartedAt = millis();
  }
}

//--------------------------------------------------------------------------   Oven   --------------------------------------------------------------------------
/*
      Receipts
      Cheese pizza     -> dough + cheese + tomato
      Pepperoni pizza  -> dough + cheese + tomato + pepperoni
      Mushrrom pizza -> dough + cheese + tomato + mushroom
      Canadian pizza   -> dough + cheese + tomato + mushroom + pepperoni
*/
class Oven extends InteractiveObject{
  String meal = null;
  int cookingStartedAt = -10; // reserved value
  InteractiveObject heldObject = null;
  ProgressBar cookingProgress;
  
  Oven(int _x, int _y){
    super(_x, _y, true, true);
    cookingProgress = new ProgressBar(X - 33, Y - 35, 67, 15, 5000);
  }
  
  @Override
  void drawObject(){
    if(meal != null){
      noTint();
      switch(meal){
        case "canadianPizza":
          image(canadianPizza, X - 25, Y - 25);
          break;
        case "cheesePizza":
          image(cheesePizza, X - 25, Y - 25);
          break;
        case "mushroomPizza":
          image(mushroomPizza, X - 25, Y - 25);
          break;
        case "pepperoniPizza":
          image(pepperoniPizza, X - 25, Y - 25);
          break;
        case "burnedPizza":
          tint(#522413);
          image(dough, X - 25, Y - 25);
          noTint();
          break;
      }
      if(cookingStartedAt != -10)
        cookingProgress.updateState(millis() - cookingStartedAt);
    }
    
    if(heldObject != null){
      if(cookingStartedAt != -10){
        cookingProgress.updateState(millis() - cookingStartedAt);
        if(cookingStartedAt + 5000 < millis()){
          int mushroomCnt = 0, cheeseCnt = 0, tomatoCnt = 0, pepperoniCnt = 0;
          for(InteractiveObject obj : ((Dough)heldObject).heldObjects){
            if(obj instanceof Tomato)
              tomatoCnt++;
            else if(obj instanceof Pepperoni)
              pepperoniCnt++;
            else if(obj instanceof Cheese)
              cheeseCnt++;
            else if(obj instanceof Mushroom)
              mushroomCnt++;
          }
          
          if(mushroomCnt == 1 && cheeseCnt == 1 && tomatoCnt == 1 && pepperoniCnt == 1)
            meal = "canadianPizza";
          else if(mushroomCnt == 1 && cheeseCnt == 1 && tomatoCnt == 1)
            meal = "mushroomPizza";
          else if(cheeseCnt == 1 && tomatoCnt == 1 && pepperoniCnt == 1)
            meal = "pepperoniPizza";
          else if(cheeseCnt == 1 && tomatoCnt == 1)
            meal = "cheesePizza";
          else
            meal = "burnedPizza";
          
          heldObject = null;
        }
      }
      else
        heldObject.updatePosition(X - 25, Y - 25);
    }
  }

  @Override
  InteractiveObject pickUpRequest(){ 
    if(cookingStartedAt == -10 && meal == null && heldObject != null){
      InteractiveObject temp = heldObject;
      heldObject = null;
      return temp;
    }
    return null; 
  }


  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    // Fill plate with meal
    if(meal != null && objectToPlace instanceof Plate && !((Plate)objectToPlace).dirty && ((Plate)objectToPlace).meal == null){
      ((Plate)objectToPlace).meal = meal;
      meal = null;
      cookingStartedAt = -10;
      return false;
    }
    
    if(heldObject == null && objectToPlace instanceof Dough && !((Dough)objectToPlace).rotten){
      heldObject = objectToPlace;
      return true;
    }
    
    if(heldObject != null){
      return ((Dough)heldObject).placeDownRequest(objectToPlace);
    }
    
    
    return false;
  }
  
  @Override
  void interactRequest(){
    if(heldObject != null && meal == null && cookingStartedAt == -10)
      cookingStartedAt = millis();
  }
  
}

//--------------------------------------------------------------------------   Dough   --------------------------------------------------------------------------
class Dough extends InteractiveObject{
  boolean rotten = false;
  ArrayList<InteractiveObject> heldObjects = new ArrayList<InteractiveObject>();
  
  Dough(int _x, int _y, float chanceToRot){ // calls default super constructor to assign starting position
    super(_x, _y, true, false);
    rotten = random(1) < chanceToRot ? true : false;  
  }
  
  @Override
  void drawObject(){ 
    if (rotten == false) {
      noTint();
      image(dough, X - 10, Y - 10,70,70);
    } else {
      tint(#618358);
      image(dough, X - 10, Y - 10,70,70);
      noTint();
    }
    
    for(int i = 0; i < heldObjects.size(); i++){
      switch(i % 5){
        case 0:
          heldObjects.get(i).updatePosition(X + 1, Y + 2, 20, 20);
          break;
        case 1:
          heldObjects.get(i).updatePosition(X + 25, Y + 2, 20, 20);
          break;
        case 2:
          heldObjects.get(i).updatePosition(X + 23, Y + 28, 20, 20);
          break;
        case 3:
          heldObjects.get(i).updatePosition(X + 2, Y + 27, 20, 20);
          break;
        case 4:
          heldObjects.get(i).updatePosition(X + 13, Y + 17, 20, 20);
          break;
        default:
          heldObjects.get(i).updatePosition(X + 20, Y + 20, 20, 20);
          break;
      }
    }
  }
  
  @Override
  InteractiveObject pickUpRequest(){ 
    return this; 
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(objectToPlace != null && objectToPlace instanceof Ingredient && !((Ingredient)objectToPlace).rotten && (((Ingredient)objectToPlace).chopped || objectToPlace instanceof Pepperoni)){
       heldObjects.add(objectToPlace);
       return true;
    }
    return false;
  }
  
  @Override
  void interactRequest(){}
  
}

//--------------------------------------------------------------------------   Pot   --------------------------------------------------------------------------
class Pot extends InteractiveObject{
  ArrayList<InteractiveObject> heldObjects = new ArrayList<InteractiveObject>(); // List of objects which are held by this object, eg. There is 2 potatoes and 1 tomato in the pot, the pot holds - 3 objects, which will be specified in this list.
  String meal = null;
  int cookingStartedAt = -10; // reserved value
  ProgressBar cookingProgress;
  
  Pot(int _x, int _y){
    super(_x, _y, true, true);
    cookingProgress = new ProgressBar(X - 34, Y - 35, 67, 15, 5000);
  }
  
  @Override
  void drawObject(){
    if(meal != null){
      switch(meal){
        case "tomatoSoup":
          image(tomatoSoup, X - 25, Y - 25, 50, 50);
          break;
        case "potatoSoup":
          image(potatoSoup, X - 30, Y - 30, 60, 60);
          break;
        case "mushroomSoup":
          image(mushroomSoup, X - 25, Y - 25, 50, 50);
          break;
      }
      if(cookingStartedAt != -10)
        cookingProgress.updateState(millis() - cookingStartedAt);
    }
    
    if(heldObjects.size() > 0){
      heldObjects.get(0).updatePosition(X - 25, Y - 25);
      if(cookingStartedAt != -10){
        cookingProgress.updateState(millis() - cookingStartedAt);
        if(cookingStartedAt + 5000 < millis() && meal == null){
            if(heldObjects.get(0) instanceof Tomato)
              meal = "tomatoSoup";
            else if(heldObjects.get(0) instanceof Potato)
              meal = "potatoSoup";
            else if(heldObjects.get(0) instanceof Mushroom)
              meal = "mushroomSoup";
          
          heldObjects.clear();
        }
      }
      else
        cookingProgress.updateState(5000 / 3 * heldObjects.size());
    }
  }

  @Override
  InteractiveObject pickUpRequest(){ 
    if(cookingStartedAt == -10 && meal == null && heldObjects.size() > 0){
      InteractiveObject temp = heldObjects.get(heldObjects.size() - 1);
      heldObjects.remove(heldObjects.size() - 1);
      return temp;
    }
    return null; 
  }


  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    // Fill plate with meal
    if(meal != null && objectToPlace instanceof Plate && !((Plate)objectToPlace).dirty && ((Plate)objectToPlace).meal == null){
      ((Plate)objectToPlace).meal = meal;
      meal = null;
      cookingStartedAt = -10;
      return false;
    }
    
    if(heldObjects.size() <= 3 && objectToPlace instanceof Ingredient && !((Ingredient)objectToPlace).rotten && ((Ingredient)objectToPlace).chopped && (heldObjects.size() == 0 || objectToPlace.getClass().equals(heldObjects.get(0).getClass()))){
      heldObjects.add(objectToPlace);
      return true;
    }
    return false;
  }
  
  @Override
  void interactRequest(){
    if(heldObjects.size() == 3 && meal == null && cookingStartedAt == -10)
      cookingStartedAt = millis();
  }
  
}

//--------------------------------------------------------------------------   Pan   --------------------------------------------------------------------------

class Pan extends InteractiveObject{
  ProgressBar cookingProgress;
  InteractiveObject heldObject = null;
  boolean cooked = false;
  int cookingStartedAt = -10; // reserved value
  
  Pan(int _x, int _y){
    super(_x, _y, true, true);
    cookingProgress = new ProgressBar(X-35, Y+23, 67, 15, 5000);
  }
  
  @Override
  void drawObject(){
    if(heldObject != null){
      heldObject.updatePosition(X - 25, Y - 25);
      if(cookingStartedAt != -10){
        cookingProgress.updateState(millis() - cookingStartedAt);
        if(cookingStartedAt + 5000 < millis()){
          heldObject = new Pepperoni(heldObject.X, heldObject.Y, 0);
          cooked = true;
        }
      }
    }
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    if(cookingStartedAt == -10 || cooked){
      InteractiveObject temp = heldObject;
      cookingStartedAt = -10;
      heldObject = null;
      return temp;
    }
    
    return null;
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(heldObject == null && objectToPlace instanceof Salami){
      cooked = false;
      heldObject = objectToPlace;
      return true;
    }
    return false;
  }
  
  @Override
  void interactRequest(){
    if(heldObject != null && !cooked && cookingStartedAt == -10 && !((Ingredient)heldObject).rotten)
      cookingStartedAt = millis();
  }
  
}

 //--------------------------------------------------------------------------   Dishwasher   --------------------------------------------------------------------------

class Dishwasher extends InteractiveObject{
  boolean washed = true;
  int washingStarted = -10;
  ProgressBar washingProgress;
  
  Dishwasher(int _x, int _y){
    super(_x, _y, true, true);
    washingProgress = new ProgressBar(X, Y, 67, 20, 2000);
  }
  
  @Override
  void drawObject(){ 
    if(washingStarted != -10){
      washingProgress.updateState(millis() - washingStarted);
      if(washingStarted + 2000 < millis())
        washed = true;
    }
  }
  
  @Override
  InteractiveObject pickUpRequest(){
    if(washed){
      washingStarted = -10;
      return new Plate(X, Y, false);
    }
    
    return null;
  }
  
  @Override
  boolean placeDownRequest(InteractiveObject objectToPlace){
    if(washed && objectToPlace instanceof Plate && ((Plate)objectToPlace).meal == null){
      if(((Plate)objectToPlace).dirty){
        washed = false;
        washingStarted = millis();
      }
      return true;
    }
    return false;
  }
  
  @Override
  void interactRequest(){ }
}

// --------------------------------------------------------------------------   Plate / Bowl   --------------------------------------------------------------------------
class Plate extends InteractiveObject{
  boolean dirty = false;
  String meal = null;
  
  @Override
  String classType(){
    return "Plate";
  }
  
  Plate(int _x, int _y, boolean _dirty){
    super(_x, _y, true, true);
    dirty = _dirty;
  }
  
  @Override
  void drawObject(){ 
    if(dirty){
      tint(#73402C);
      image(plate, X, Y, 60, 60);
      noTint();
      return;
    }
    
    noTint();
    
    if(meal == null){
      image(plate, X, Y, 60, 60);
      return;
    }
    
    switch(meal){
      default:
        println("-------------------- ERROR - Unidentified meal -------------------- ");
        break;
      case "canadianPizza":
        image(plate, X, Y, 60, 60);
        image(canadianPizza, X + 6 , Y + 4);
        break;
      case "cheesePizza":
        image(plate, X, Y, 60, 60);
        image(cheesePizza, X + 8 , Y + 6);
        break;
      case "mushroomPizza":
        image(plate, X, Y, 60, 60);
        image(mushroomPizza, X + 6 , Y + 4);
        break;
      case "pepperoniPizza":
        image(plate, X, Y, 60, 60);
        image(pepperoniPizza, X + 6 , Y + 4);
        break;
      case "burnedPizza":
          image(plate, X, Y, 60, 60);
          tint(#522413);
          image(dough, X + 6, Y + 4);
          noTint();
          break;
      case "mushroomSoup":
        image(mushroomSoup, X, Y, 60, 60);
        break;
      case "potatoSoup":
        image(potatoSoup, X - 5, Y - 5, 70, 70);
        break;
      case "tomatoSoup":
        image(tomatoSoup, X, Y, 60, 60);
        break;
    }
  }    
}
