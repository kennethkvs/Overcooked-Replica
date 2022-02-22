class InstructionScreen extends Level
{ 
  InstructionScreen(){
  }
  
   @Override
  int updateTick(){
    //takes players to the levels 
    //10,840,160,50
    if (mouseX > 10 && mouseX < 170 && mouseY < 890 && mouseY > 840)
      cursor(HAND);
    else
      cursor(ARROW);
    if (mousePressed == true && mouseX > 10 && mouseX < 170 && mouseY < 890 && mouseY > 840)
      return 6;
      
    background (#1A8919);
    drawInstructionsScreen();
    
    return 0;
  }
  
  PImage slicedMushroom = mushroomSliced;
  
  PImage slicedTomato = tomatoSliced;
  
  PImage slicedPotato = potatoSliced;
  
  PImage slicedCheese = cheeseSliced;
  
  void drawInstructionsScreen()
  {
   size (1600,900);
  
    background (#E5D3B0);
    
    //COUNTER
    fill (#AD9B7A);
    stroke (#AD9B7A);
    rect (0,400,1600,500);
    fill (#A29274);
    stroke (#A29274);
    rect (0,750,1600,150);
    
    //STOVE
    fill (#B9B6B0);
    stroke (#B9B6B0);
    beginShape();
    vertex (1100,400);
    vertex (950,750);
    vertex (1600,750);
    vertex (1600,400);
    endShape(CLOSE);
    fill (#A29E97);
    stroke (#A29E97);
    beginShape();
    vertex (950,750);
    vertex (1600,750);
    vertex (1600,900);
    vertex (950,900);
    endShape(CLOSE);
    noFill();
    stroke (#000000);
    ellipse (1325,550,400,200);
    ellipse (1325,550,350,170);
    ellipse (1325,550,300,140);
    ellipse (1325,550,250,110);
    ellipse (1325,550,200,90);
    
    
    //RECIPE BOOK
    fill (#F08761);
    stroke (#F08761);
    beginShape();
    vertex (50,300);
    vertex (50,800);
    vertex (850,800);
    vertex (850,300);
    endShape(CLOSE);
    fill (#FFFFFF);
    stroke (#FFFFFF);
    beginShape();
    vertex (70,310);
    vertex (70,790);
    vertex (830,790);
    vertex (830,310);
    endShape(CLOSE);
    fill (#B46B50);
    stroke (#B46B50);
    beginShape();
    vertex (440,300);
    vertex (470,300);
    vertex (470,800);
    vertex (440,800);
    endShape(CLOSE);
    
    stroke(0);
    fill(#FA8072);
    rect(10,840,160,50,10);
    
    textSize(20); 
    fill(0);
    text("RETURN", 50, 873);
    
    textSize(40);
    text("Menu",200,350);
    text("Ingredients",550,350);
  
    textSize(15); 
    fill(0);
    text("In this game, players will prepare ingredients and meals for customers within a certain period of time. The amount of time and rate of orders can very in each level.", 20, 30);
    text("Players will obtain ingredients via the storage crates along the counters. Certain ingredients will need to be chopped, cooked via a pan/pot or both, depending on the recipe.", 20,50);
    text ("Once the ingredients are fully prepared they must be presented on a plates that are avaliable on the counter. Plates that are used will come back as dirty plates and must be washed in the dishwasher.",20,70);
    text ("When retrieving ingredients from the storage, there is a chance that the ingredient is rotten; this can be identified through the color. Rotten ingredients must be thrown out in the garbage can.",20,90);
    text ("Soups (Tomato, Mushroom, Potato)",20,130);
    text ("1. Take out ingredients from storage",20,150);
    text ("2. Chop the ingredients and cook them in a pot",20,170);
    text ("3. Serve the soup in a bowl", 20,190);
    text ("Pizza", 500,130);
    text ("1. Take out ingredients from storage",500,150);
    text ("2. Chop the ingredients needed to be chopped, cook the meats on a pan and put all ingredients on dough",500,170);
    text ("3. Bake the dough and ingredients",500,190);
    text ("4. Serve pizza on a plate",500,210);
    text ("Points will be alloted when players finish and serve the correct order in time.",20,240);
    text ("Each level will add additional factors, so players should always keep a look out.",20,260);
    
    text("Pizza",80,380);
    text("1. Canadian Pizza",80,400);
    image(canadianPizza,220,375,50,50);
    text("2. Pepperoni Pizza",80, 450);
    image(pepperoniPizza,223,425,50,50);
    text("3. Cheese Pizza",80,500);
    image(cheesePizza,215,475,45,45);
    text("4. Mushroom Pizza",80,550);
    image(mushroomPizza,226,525,45,45);
    
    text("Soup", 80, 600);
    text("1. Mushroom Soup",80, 620);
    image(mushroomSoup, 226, 590, 45,45);
    text("2. Tomato Soup",80, 670);
    image(tomatoSoup, 210, 645, 45,45);
    text("3. Potato Soup",80, 720);
    image(potatoSoup, 205, 690, 55,55);
    
    text("Mushrooms",480,400);
    image(mushroom,580,375,40,40);
    text("Sliced -->",645,400);
    image(slicedMushroom,750,375,40,40);
    text("Potatoes",480,450);
    image(potato,580,425,40,40);
    text("Sliced -->",645,450);
    image(slicedPotato,750,425,40,40);
    text("Tomatoes",480,500);
    image(tomato,580,475,40,40);
    text("Sliced -->",645,500);
    image(slicedTomato,750,475,40,40);
    text("Cheese",480,550);
    image(cheese,580,525,40,40);
    text("Sliced -->",645,550);
    image(slicedCheese,750,525,40,40);
    text("Pepperoni",480,600);
    image(salami,580,575,40,40);
    text("Cooked -->",645,600);
    image(pepperoni,750,575,40,40);
    
    text("----------------------------------",490,640);
    
    textSize(60);
    text("HOW TO PLAY?",1000,335);
    
    textSize(30);
    fill(#FF0000);
    text("WATCH OUT!",555,670);
    
    textSize(14);
    text("These ingredients are rotten and must be thrown",480,765);
    text("away before used",590,780);
    
    text("* Remember the ingredients used in the menu. It",85,765);
    text("will be useful when you start playing! *",120,780);
    
    textSize(10);
    fill(0);
    text("Dough + cheese + tomato",95,415);
    text("+ mushroom + pepperoni",95,427);
    text("This is our special dish! A home-",275,385);
    text("made pizza dough topped with",275,397);
    text("fresh mushrooms, pepperoni,",275,409);
    text("cheese, and tomato",275,421);
    
    text("Dough + cheese + tomato",95,465);
    text("+ pepperoni",95,477);
    text("Our top quality pepperoni and",275,440);
    text("cheese served on our freshly",275,452);
    text("baked home-made pizza dough",275,464);
    
    text("Dough + cheese + tomato",95,515);
    text("Cheese... Yum, yum! Here's",275,490);
    text("our freshly baked pizza dough",275,502);
    text("with cheese and ONLY cheese!",275,514);
    
    text("Dough + cheese + tomato",95,565);
    text("+ mushroom",95,577);
    text("You love mushrooms? Order this",275,535);
    text("and you'll crave for more and", 275,547);
    text("more mushroom pizzas!",275,559);
    
    text("3x mushrooms",95,635);
    text("Craving a creamy and delicious",275,606);
    text("mushroom soup? Enjoy our",275,618);
    text("freshly made mushroom soup!",275,630);
    
    text("3x tomatoes",95,685);
    text("Nothing beats a classic tomato",275,655);
    text("soup made from freshly chopped",275,667);
    text("tomatoes. Go ahead and try it!",273,679);
    
    text("3x potatoes",95,735);
    text("Looking for something unique?",275,705);
    text("Try our potato soup! Its creamy",275,717);
    text("taste won't leave your tongue!",275,729);
    
    
    tint(#618358);
    image(mushroom,500,690,40,40);
    image(potato,550,690,40,40);
    image(tomato,600,690,40,40);
    image(cheese,650,690,40,40);
    image(pepperoni,700,690,40,40);
    image(dough,750,680,60,60);
    
    noTint();
  } 

}
