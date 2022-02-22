class LevelSelect extends Level{
  LevelSelect(){ // Argumentless constructor
  
  } 
  
  @Override
  int updateTick(){
    //takes players to the levels 
    if (mousePressed == true && mouseX > 215 && mouseX < 285 && mouseY < 685 && mouseY > 615)
      return 1;
    if (mousePressed == true && mouseX > 475 && mouseX < 545 && mouseY < 255 && mouseY > 185)
      return 2;
    if (mousePressed == true && mouseX > 1065 && mouseX < 1135 && mouseY < 635 && mouseY > 565)
      return 3;
    if (mousePressed == true && mouseX > 1340 && mouseX < 1410 && mouseY < 185 && mouseY > 115)
      return 4;
    if (mousePressed == true && mouseX > 1415 && mouseX < 1485 && mouseY < 785 && mouseY > 715)
      return 5;
    if (mousePressed == true && mouseX > 550 && mouseX < 950 && mouseY < 885 && mouseY > 810)
      return 6;
      
    background (#1A8919);
    drawSelectScreen();
    
    return 0;
  }
  //--------------------------------------------------------------------------   KITCHEN AREA   --------------------------------------------------------------------------
  //drawing the busses
  void Bus1 (int mouseX, int mouseY){
    stroke(131,123,24);
    fill(214,198,17);
    ellipse(mouseX+31,mouseY-34,25,25);
    stroke(227,211,34);
    fill(227,211,34);
    beginShape();
    vertex(mouseX+17,mouseY-40);
    vertex(mouseX+42,mouseY-25);
    vertex(mouseX+12,mouseY+25);
    vertex(mouseX-12,mouseY+10);

    endShape(CLOSE);
  }
  
  void Bus2 (int mouseX, int mouseY){
    stroke(131,123,24);
    fill(214,198,17);
    ellipse(mouseX+37,mouseY+9,25,25);
    stroke(227,211,34);
    fill(227,211,34);
    beginShape();
    vertex(mouseX+47,mouseY-2);
    vertex(mouseX+32,mouseY+22);
    vertex(mouseX-15,mouseY-10);
    vertex(mouseX,mouseY-33);

    endShape(CLOSE);
  }
   
  void Bus3 (int mouseX, int mouseY){
    stroke(131,123,24);
    fill(214,198,17);
    ellipse(mouseX+1,mouseY+19,25,25);
    stroke(227,211,34);
    fill(227,211,34);
    beginShape();
    vertex(mouseX-18,mouseY-33);
    vertex(mouseX+7,mouseY-35);
    vertex(mouseX+14,mouseY+18);
    vertex(mouseX-12,mouseY+20);

    endShape(CLOSE);
  }

  //making trees
  void Tree (int x, int y){
    stroke(19,113,18,175);
    fill(19,113,18,175);
    ellipse(x,y,15,15);
    ellipse(x+5,y-15,25,25);
    ellipse(x,y-17,25,25);
    ellipse(x+7,y+15,25,25);
    ellipse(x-14,y+13,25,25);
    ellipse(x-10,y-15,25,25);
    ellipse(x-15,y,25,25);
    ellipse(x+15,y-3,25,25);
    stroke(49,242,46,125);
    fill(49,242,46,125);
    ellipse(x-10,y-10,25,25);
    ellipse(x+10,y-5,25,25);
    ellipse(x+12,y-18,25,25);
    ellipse(x-4,y+9,25,25);
  }
   
   void Rock (int x, int y){
    stroke(178,175,171);
    fill(178,175,171);
    ellipse(x,y,50,40);
    ellipse(x+18,y+12,20,20);
    stroke(201,199,195);
    fill(201,199,195);
    ellipse(x-20,y+5,30,30);
  }
   
  void drawSelectScreen(){    
    Tree(25,350);
    Tree(50,0);
    Tree(88,365);
    Tree(100,330);
    Tree(150,325);
    Tree(200,310);
    Tree(200,230);
    Tree(270,240);
    Tree(300,190);
    Tree(100,140);
    Tree(60,210);
    Tree(150,150);
    Tree(140,240);
    Tree(230,138);
    Tree(305,110);
    Tree(330,50);
    Tree(40,80);
    Tree(180,50);
    Tree(35,145);
    Tree(50,265);
    Tree(110,50);
    Tree(510,450);
    Tree(600,500);
    Tree(575,520);
    Tree(615,570);
    Tree(675,585);
    Tree(115,475);
    Tree(60,505);
    Tree(75,785);
    Tree(85,565);
    Tree(155,575);
    Tree(60,630);
    Tree(90,670);
    Tree(145,700);
    Tree(30,735);
    Tree(281,785);
    Tree(510,320);
    Tree(565,38);
    Tree(725,730);
    Tree(645,745);
    Tree(575,666);
    Tree(540,735);
    Tree(500,785);
    Tree(420,800);
    Tree(105,850);
    Tree(340,865);
    Tree(155,795);
    Tree(710,485);
    Tree(310,130);
    Tree(400,290);
    Tree(330,290);
    Tree(45,430);
    Tree(200,230);
    Tree(865,650);
    Tree(978,715);
    Tree(940,777);
    Tree(1229,671);
    Tree(1060,850);
    Tree(1291,465);
    Tree(1076,715);
    Tree(1220,800);
    Tree(1350,845);
    Tree(1525,605);
    Tree(1515,712);
    Tree(1460,185);
    Tree(1495,490);
    Tree(1500,340);
    Tree(1525,407);
    Tree(675,245);
    Tree(600,410);
    Rock(245,426);
    Rock(570,123);
    Rock(1308,669);
    Rock(450,595);
    Rock(351,695);
    Rock(790,578);
    Rock(1468,79);
    Rock(400,150);
    
    
    
    
    
    
    
    //drawing of paths
    beginShape();
    stroke(80,55,15,200);
    fill(80,55,15,200);
    vertex(285,625);
    vertex(365,540);
    vertex(440,420);
    vertex(505,255);
    vertex(475,235);
    vertex(390,350);
    vertex(320,490);
    vertex(250,615);
    endShape(CLOSE);
    beginShape();
    vertex(530,245);
    vertex(685,385);
    vertex(825,480);
    vertex(1060,600);
    vertex(1079,565);
    vertex(925,450);
    vertex(785,360);
    vertex(545,220);
    endShape(CLOSE);
    beginShape();
    vertex(1134,581);
    vertex(1250,450);
    vertex(1320,320);
    vertex(1375,185);
    vertex(1338,164);
    vertex(1275,290);
    vertex(1190,420);
    vertex(1105,563);
    endShape(CLOSE);
    beginShape();
    vertex(1408,170);
    vertex(1450,340);
    vertex(1465,507);
    vertex(1465,715);
    vertex(1425,720);
    vertex(1400,540);
    vertex(1380,404);
    vertex(1385,187);
    endShape(CLOSE);
    
    //drawing of level circles
    stroke(0,50,235);
    fill(0,50,235);
    ellipse(975,0,600,600);
    ellipse(1150,180,200,300);
    ellipse(1055,255,300,300);
    ellipse(975,275,150,150);
    ellipse(1200,50,200,300);
    ellipse(890,200,200,200);
    stroke(0,0,0);
    fill(175,188,175);
    ellipse(250,650,75,75);
    ellipse(510,220,75,75);
    ellipse(1100,600,75,75);
    ellipse(1375,150,75,75);
    ellipse(1450,750,75,75);
    ellipse(750,850,400,75);
    fill(0,0,0);
    textSize(24);
    text("1", 242, 658);
    text("2", 502, 228);
    text("3", 1092, 608);
    text("4", 1367, 158);
    text("5", 1442, 758);
    text("Return to Main Menu", 640, 860);
    textSize(14);
    //switching of busses
    if (mouseX < 525)
      Bus1(mouseX,mouseY);
    else if(mouseX < 1115)
      Bus2(mouseX,mouseY);
    else if (mouseX < 1375)
      Bus1(mouseX,mouseY);
    else  if (mouseX > 1375 && mouseY> 116)
      Bus3(mouseX,mouseY);
                
    //drawing of pop ups
    stroke(0,0,0);
    fill(175,188,175);
    if (mouseX > 215 && mouseX < 285 && mouseY < 685 && mouseY > 615){
      beginShape();
      vertex(315,610);
      vertex(185,610);
      vertex(185,550);
      vertex(315,550);
      endShape(CLOSE);
      fill(0,0,0);
      text("Click To Enter", 199, 580);
      text("Level 1", 225, 598);
    }
    if (mouseX > 475 && mouseX < 545 && mouseY < 255 && mouseY > 185){
      beginShape();
      vertex(575,180);
      vertex(445,180);
      vertex(445,120);
      vertex(575,120);
      endShape(CLOSE);
      fill(0,0,0);
      text("Click To Enter", 460, 150);
      text("Level 2", 490, 168);
    }
    if (mouseX > 1065 && mouseX < 1135 && mouseY < 635 && mouseY > 565){
      beginShape();
      vertex(1165,560);
      vertex(1035,560);
      vertex(1035,500);
      vertex(1165,500);
      endShape(CLOSE);
      fill(0,0,0);
      text("Click To Enter", 1050, 530);
      text("Level 3", 1075, 548);
    }
    if (mouseX > 1340 && mouseX < 1410 && mouseY < 185 && mouseY > 115){
      beginShape();
      vertex(1440,110);
      vertex(1310,110);
      vertex(1310,50);
      vertex(1440,50);
      endShape(CLOSE);
      fill(0,0,0);
      text("Click To Enter", 1325, 80);
      text("Level 4", 1350, 98);
    }
    if (mouseX > 1415 && mouseX < 1485 && mouseY < 785 && mouseY > 715){
      beginShape();
      vertex(1515,710);
      vertex(1385,710);
      vertex(1385,650);
      vertex(1515,650);
      endShape(CLOSE);
      fill(0,0,0);
      text("Click To Enter", 1400, 680);
      text("Level 5", 1425, 698);
    }
    fill(0,0,0);
    
  }

}
