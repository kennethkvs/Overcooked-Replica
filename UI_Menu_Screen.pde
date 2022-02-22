class MenuScreen extends Level{
  
  MenuScreen(){ // Argumentless constructor
  
  } 
  
  @Override
  int updateTick(){
    if (mouseX > 145 && mouseX < 235 && mouseY < 160 && mouseY > 110)
      cursor(HAND);
    else if (mouseX > 100 && mouseX < 275 && mouseY < 240 && mouseY > 195)
      cursor(HAND);
    else if (mouseX > 65 && mouseX < 310 && mouseY < 320 && mouseY > 275)
      cursor(HAND);
    else
      cursor(ARROW);
    
    //takes players to the levels 
    //detects if mouse presses the Play button
    if (mousePressed == true && mouseX > 145 && mouseX < 235 && mouseY < 160 && mouseY > 110)
      return 9;
    //detects if mouse presses the controls button
    if (mousePressed == true && mouseX > 100 && mouseX < 275 && mouseY < 240 && mouseY > 195)
      return 7; 
    //detects if mouse presses the how to play button
    if (mousePressed == true && mouseX > 65 && mouseX < 310 && mouseY < 320 && mouseY > 275)
      return 8;
    
    background (#1A8919);
    drawMenuScreen();
    
    return 0;
  }
  
  void cloud (int x, int y){
      stroke(#FFFFFF);
      fill(#FFFFFF);
      ellipse(x,y,15,15);
      ellipse(x+5,y-15,25,25);
      ellipse(x+7,y+15,25,25);
      ellipse(x-14,y+13,25,25);
      ellipse(x-10,y-15,25,25);
      ellipse(x-15,y,25,25);
      ellipse(x+15,y-3,25,25);
      ellipse(x-10,y-10,25,25);
      ellipse(x+10,y-5,25,25);
      ellipse(x-4,y+9,25,25);  
  }
  
  void drawMenuScreen()
  {
    background(#91C4F0);
    fill (#38CE48);
    stroke (#38CE48);
    rect (0,400,1600,500);
    fill (#85B76B);
    stroke (#85B76B);
    beginShape();
    vertex (1208,842);
    vertex (1443,577);
    vertex (1490,588);
    endShape(CLOSE);
    
    //Random Cloud
    cloud(925,50);
    cloud(1160,169);
    cloud(1445,50);
    cloud(1408,294);
    cloud(430,120);
    
    //Overcooked Cloud
    cloud(42,42);
    cloud(63,70);
    cloud(93,40);
    cloud(118,73);
    cloud(145,40);
    cloud(173,72);
    cloud(200,39);
    cloud(227,71);
    cloud(254,40);
    cloud(282,69);
    cloud(309,43);
    cloud(336,70);
    cloud(357,44);
    
    //Play Cloud
    cloud(166,137);
    cloud(209,139);
    
    //Controls Cloud
    cloud(125,216);
    cloud(170,218);
    cloud(215,219);
    cloud(259,220);
    
    //How To Play Cloud
    cloud(89,297);
    cloud(134,299);
    cloud(167,300);
    cloud(209,296);
    cloud(255,298);
    cloud(296,301);
    
    //BUILDING
    fill (#7E6C5D);
    stroke (#7E6C5D);
    beginShape();
    vertex (350,313);
    vertex (800,200);
    vertex (800,700);
    vertex (350,531);
    endShape(CLOSE);
    fill (#6F5D4E);
    stroke (#6F5D4E);
    beginShape();
    vertex (1250,313);
    vertex (800,200);
    vertex (800,700);
    vertex (1250,531);
    endShape(CLOSE);
    
    
    //ROOF
    fill (#362D26);
    stroke (#362D26);
    beginShape();
    vertex (550,100);
    vertex (870,276);
    vertex (1287,348);
    vertex (1234,297);
    endShape(CLOSE);
    beginShape();
    vertex (315,323);
    vertex (350,325);
    vertex (350,313);
    vertex (550,100);
    vertex (545,100);
    endShape(CLOSE);
    fill (#584C43);
    stroke (#584C43);
    beginShape();
    vertex (550,100);
    vertex (350,313);
    vertex (753,212);  
    endShape(CLOSE);
    
     //WINDOW
    fill (#A4D4FA);
    stroke (#362D26);
    beginShape();
    vertex (970,330);
    vertex (1120,346);
    vertex (1120,465);
    vertex (970,485);
    endShape(CLOSE);
    line (1050,338,1050,478);
    line (1120,404,970,405);
    beginShape();
    vertex(560,330);
    vertex(560,485);
    vertex(385,458);
    vertex(385,352);
    endShape(CLOSE);
    line(460,343,460,470);
    line(385,407,560,408);
        
    //bushes
    stroke(19,113,18);
    fill(19,113,18);
    ellipse(100,795,100,100);
    ellipse(50,775,100,100);
    ellipse(90,745,100,100);
    ellipse(44,725,100,100);
    ellipse(90,685,100,100);
    ellipse(140,735,100,100);
    ellipse(150,785,100,100);
    ellipse(185,750,100,100);
    ellipse(160,680,100,100);
  
    ellipse(1510,610,15,15);
    ellipse(1510+10,610-20,35,35);
    ellipse(1510+12,610+20,35,35);
    ellipse(1510-19,610+18,35,35);
    ellipse(1510-15,610-20,35,35);
    ellipse(1510-20,610+5,35,35);
    ellipse(1510+20,610-8,35,35);
    ellipse(1510-15,610-15,35,35);
    ellipse(1510+15,610-10,35,35);
    ellipse(1510-9,610+14,35,35);
    ellipse(1535,615,35,35);
    
    stroke(#FF0000);
    fill(#FF0000);
    ellipse(50,720,12,12);
    ellipse(80,770,12,12);
    ellipse(135,685,12,12);
    ellipse(175,738,12,12);
    ellipse(160,788,12,12);
    ellipse(1500,613,8,8);
    ellipse(1494,592,8,8);
    ellipse(1525,602,8,8);
    ellipse(1518,625,8,8);
  
    //SIDEWALK
    fill (#E3CD93);
    stroke (#E3CD93);
    beginShape();
    vertex (800,810);
    vertex (800,700);
    vertex (1600,400);
    endShape(CLOSE);
    beginShape();
    vertex (800,810);
    vertex (928,748);
    vertex (0,400);
    endShape(CLOSE);
    fill (#D1BD87);
    stroke (#D1BD87);
    beginShape();
    vertex (800,700);
    vertex (925,745);
    vertex (1316,546);
    vertex (1250,531);
    endShape(CLOSE);
    //ROAD
    fill (#989692);
    stroke (#989692);
    beginShape();
    vertex (800,810);
    vertex (800,1300);
    vertex (0,400);
    endShape(CLOSE);
    beginShape();
    vertex (800,810);
    vertex (800,1300);
    vertex (1600,400);
    endShape(CLOSE);
    fill (#767571);
    stroke (#767571);
    beginShape();
    vertex (925,745);
    vertex (1316,546);
    vertex (1443,577);
    vertex (1208,842);
    endShape(CLOSE);
    
    stroke(0,0,0);
    fill(0,0,0);
  
  //door
    fill (#462501);
    stroke (#462501);
    beginShape();
    vertex (615,380);
    vertex (750,375);
    vertex (750,680);
    vertex (615,630);
    endShape(CLOSE);
    fill(#FFF303);
    stroke(#FFF303);
    ellipse (630,535,10,10);
    
    //changes door, if player hovers over play button
    if (mouseX > 145 && mouseX < 235 && mouseY < 160 && mouseY > 110){
      fill (#462501);
      stroke (#462501);
      beginShape();
      vertex (615,375);
      vertex (750,375);
      vertex (750,680);
      vertex (615,650);
      endShape(CLOSE);
      fill(#FFF303);
      stroke(#FFF303);
      ellipse (640,535,12,12);
    }
    //rotated text
    stroke(0);
    fill(0);
    textSize(60);
    text("Overcooked", 20, 70);
    
    textSize(40);
    text("Play", 150, 150);
    text("Controls", 110, 230);
    text("How To Play", 75, 310);

  }
}
