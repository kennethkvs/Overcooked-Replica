class Level4 extends Level{
    // On each level, Players spawn at different locations
  Level4(){ // Argumentless constructor
    thisLevel = 4;
    gameMaxTimeSec = 4 * 60 + 30;
  
    Player1 = new Player(250, 430, false);
    Player2 = new Player(750, 430, true);
    
    // Assign ingredients
    interactiveObjects.add(new Storage(35, 150, 0.1, "Dough"));
    interactiveObjects.add(new Storage(35, 250, 0.1, "Tomato"));
    interactiveObjects.add(new Storage(35, 350, 0.1, "Salami"));
    interactiveObjects.add(new Storage(35, 450, 0.1, "Cheese"));
    
    interactiveObjects.add(new ChoppingBoard(985, 145));
    interactiveObjects.add(new ChoppingBoard(985, 255));
    
    interactiveObjects.add(new Oven(340, 35));
    interactiveObjects.add(new Oven(430, 35));
    
    interactiveObjects.add(new Pan(142, 863));
    interactiveObjects.add(new Pan(233, 863));
    
    interactiveObjects.add(new Dishwasher(850, 830));
    interactiveObjects.add(new ServingTray(950, 450, new String[]{"cheesePizza","pepperoniPizza"}, 10000, this));
    
    interactiveObjects.add(new Bin(835, 35));
    interactiveObjects.add(new Tray(510, 450));
  } 
  
  // Specifies how to draw level
  @Override
  void drawLevel(){
    background (#A26F6F);
    drawMainKitchen();
    drawCustomerArea();
  }
  
  // Specifies players movement constraints
  @Override
  void constrainMotion(Player player){
    if(player.alternateControls == false){ // Player #1
      player.X = constrain(player.X, 120, 430);
      player.Y = constrain(player.Y, 120, 780);
    }
    else{
      player.X = constrain(player.X, 590, 900);
      player.Y = constrain(player.Y, 120, 780);
    }
  }
  
  //--------------------------------------------------------------------------   KITCHEN AREA   --------------------------------------------------------------------------
  void drawMainKitchen(){
    //KITCHEN
    stroke (#F0E3E3);
    fill (#F0E3E3);
    rect (70,70,880,760);
    rect (1050,70,600,760);
    
    //Tiles
    stroke (#CBCBC9);
    line (70,130,950,130);
    line (70,190,950,190);
    line (70,250,950,250);
    line (70,310,950,310);
    line (70,370,950,370);
    line (70,430,950,430);
    line (70,490,950,490);
    line (70,550,950,550);
    line (70,610,950,610);
    line (70,670,950,670);
    line (70,730,950,730);
    line (70,790,950,790);
    
    line (160,70,160,830);
    line (250,70,250,830);
    line (340,70,340,830);
    line (430,70,430,830);
    line (520,70,520,830);
    line (610,70,610,830);
    line (700,70,700,830);
    line (790,70,790,830);
    line (880,70,880,830);
   
    fill (#A26F6F);
    stroke (#A26F6F);
    rect (480,70,60,765);
    
    //Connector
    fill (#C1C1C1);
    stroke (#A7A7A7);
    rect (475,420,70,60);
    fill (#90908F);
    rect(480,425,60,50);
    
    //Storage
    stroke (#757669);
    fill (#C2C4B0);
    rect (0,100,70,90);
    rect (0,200,70,90);
    rect (0,300,70,90);
    rect (0,400,70,90);
    fill (#C4C6A6);
    rect (5,105,60,80);
    rect (5,205,60,80);
    rect (5,305,60,80);
    rect (5,405,60,80);
    
    //Chopping boards
    fill (#E3E5D0);
    stroke (#BBBCAF);
    rect (950,100,70,90);
    rect (950,210,70,90);
    
    noTint();
    image(knife,955,110,60,20);
    image(knife,955,220,60,20);
    
    //Ovens/Stoves
    fill (#909090);
    stroke (#585858);
    rect (100,830,80,70);
    rect (190,830,80,70);
    noFill();
    stroke (#4D4D4D);
    ellipse (140,865,60,60);
    ellipse (140,865,50,50);
    ellipse (140,865,40,40);
    ellipse (140,865,30,30);
    ellipse (140,865,20,20);
    ellipse (140,865,10,10);
    
    ellipse (230,865,60,60);
    ellipse (230,865,50,50);
    ellipse (230,865,40,40);
    ellipse (230,865,30,30);
    ellipse (230,865,20,20);
    ellipse (230,865,10,10);
    
    // Pans
    noTint();
    image(pan,113,785,55,118);
    image(pan,203,785,55,118);
    
    fill (#909090);
    stroke (#585858);
    rect (300,0,80,70);
    rect (390,0,80,70);
    fill (#000000);
    stroke (#000000);
    rect (305,60,70,10);
    rect (395,60,70,10);
    
    //Garbage Can
    fill (#909090);
    stroke (#585858);
    rect (800,0,70,70);
    fill (#FFFFFF);
    rect (805,5,60,60);
    fill (#000000);
    rect (810,10,50,50); 
    
    //Serving Area
    fill (#C1C1C1);
    stroke (#A7A7A7);
    rect (970,350,80,200);
    rect (920,420,210,60);
    
    fill (#90908F);
    rect (925,425,200,50);
    fill (#C1C1C1);
    rect (950,370,120,160);
    
    textSize(18);
    fill(#000000);
    text("Orders", 980, 547);
    
    //Dishwasher
    fill (#959798);
    stroke (#959798);
    rect (850,830,80,70);
    fill (#A6C5DE);
    stroke (#A6C5DE);
    rect (860,840,60,50);
    //Dishes
    fill (#FFFFFF);
    stroke (#000000);
    arc(870, 860, 30, 30, PI/2, PI+HALF_PI);
    arc(882, 860, 30, 30, PI/2, PI+HALF_PI);
    arc(894, 860, 30, 30, PI/2, PI+HALF_PI);
    arc(906, 860, 30, 30, PI/2, PI+HALF_PI);
    //Tap
    fill (#868789);
    stroke (#868789);
    rect (885,870,10,30);
    ellipse (878,891,8,8);
    ellipse (902,891,8,8);
  }
  
  //--------------------------------------------------------------------------   CUSTOMER AREA   --------------------------------------------------------------------------
  void drawCustomerArea(){
    //CUSTOMER AREA
    //Chairs
    fill (#B9A598);
    stroke (#B9A598);
    rect (1230,230,60,60);
    rect (1430,230,60,60);
    rect (1230,390,60,60);
    rect (1430,390,60,60);  
    rect (1230,500,60,60);
    rect (1230,660,60,60);
    rect (1430,500,60,60);
    rect (1430,660,60,60);
     
    //Tables
    fill (#AA9486);
    stroke (#AA9486);
    rect (1200,280,120,120);
    rect (1200,550,120,120);
    rect (1400,280,120,120);
    rect (1400,550,120,120);
    
    //Dishes 
    fill (#FFFFFF);
    stroke (#000000);
    ellipse (1260,305,40,40);
    ellipse (1260,375,40,40);
    ellipse (1460,305,40,40);
    ellipse (1460,375,40,40);
    ellipse (1260,575,40,40);
    ellipse (1260,645,40,40);
    ellipse (1460,575,40,40);
    ellipse (1460,645,40,40);
    
    //Napkins & Spoons
    rect (1290,285,15,30);
    rect (1290,365,15,30);
    rect (1490,285,15,30);
    rect (1490,365,15,30);
    rect (1290,555,15,30);
    rect (1290,635,15,30);
    rect (1490,555,15,30);
    rect (1490,635,15,30);
    
    fill (#C1C1C1);
    stroke (#A7A7A7);
    rect (1296,288,3,18);
    ellipse (1298,307,5,8);
    rect (1296,373,3,18);
    ellipse (1298,372,5,8);  
    rect (1496,288,3,18);
    ellipse (1498,307,5,8);
    rect (1496,373,3,18);
    ellipse (1498,372,5,8);
    
    rect (1296,560,3,18);
    ellipse (1298,578,5,8);
    rect (1296,642,3,18);
    ellipse (1298,643,5,8);  
    rect (1496,560,3,18);
    ellipse (1498,578,5,8);
    rect (1496,642,3,18);
    ellipse (1498,643,5,8);
  }
}
