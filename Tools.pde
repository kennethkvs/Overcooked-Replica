PImage  mushroom, mushroomSliced, 
        cheese, cheeseSliced, 
        potato, potatoSliced, 
        tomato, tomatoSliced, 
        dough, salami, pepperoni, chef, pot, knife, pan,
        plate, 
        canadianPizza, cheesePizza, mushroomPizza, pepperoniPizza,
        mushroomSoup, potatoSoup, tomatoSoup;
        
void preloadImages(){
  mushroom = loadImage("mushroom.png");
  cheese = loadImage("cheese.png");
  potato = loadImage("potato.png");
  tomato = loadImage("tomato.png");
  dough = loadImage("dough.png");
  salami = loadImage("salami.png");
  chef = loadImage("chef.png");
  pot = loadImage("pot.png");
  knife = loadImage("knife.png");
  pan = loadImage("pan.png");
  pepperoni = loadImage("pepperoni.png");
  
  mushroomSliced = loadImage("sliced mushrooms.png");
  cheeseSliced = loadImage("sliced cheese.png");
  potatoSliced = loadImage("sliced potato.png");
  tomatoSliced = loadImage("sliced tomato.png");
  
  canadianPizza = loadImage("canadian pizza.png");
  cheesePizza = loadImage("cheese pizza.png");
  mushroomPizza = loadImage("mushroom pizza.png");
  pepperoniPizza = loadImage("pepperoni pizza.png");
  mushroomSoup = loadImage("mushroom soup.png");
  potatoSoup = loadImage("potato soup.png");
  tomatoSoup = loadImage("tomato soup.png");
  
  plate = loadImage("plate.png");
}

class ProgressBar{
  int X, Y, objWidth, objHeight, maxValue;
  ProgressBar(int _x, int _y, int _w, int _h, int max){
    X = _x;
    Y = _y;
    objWidth = _w;
    objHeight = _h;
    maxValue = max;
  }
  
  void updateState(int state){
    fill(#3A3B40); 
    stroke(#000000);
    rect(X, Y, objWidth, objHeight);
    
    state = state < 1 ? 1 : (state > maxValue ? maxValue : state);
    int N = round((objWidth - 6.0) * state / maxValue / 11);
    
    fill(#1EC91E);
    noStroke();
    
    for(int i = 0; i < N; i++)
      rect(X + 3 + i * 11, Y + 3, (objWidth - 6) / 10, objHeight - 6);
      
  }
}
