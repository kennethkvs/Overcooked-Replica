class ControlScreen extends Level
{
  ControlScreen(){
  
  }
  
  @Override
  int updateTick(){
    //takes players to the levels 
    if (mouseX > 110 && mouseX < 270 && mouseY < 840 && mouseY > 790)
      cursor(HAND);
    else
      cursor(ARROW);
    if (mousePressed == true && mouseX > 110 && mouseX < 270 && mouseY < 840 && mouseY > 790)
      return 6;
      
    background (#1A8919);
    drawControlScreen();
    
    return 0;
  }
  
  void drawControlScreen()
  {
    background (#BFB3A9);
  
    //CHOPPING BOARD
    fill (#E3CEBE);  
    stroke (#E3CEBE);
    rect (100, 50, 1400, 800);
  
    fill (#9B9189);
    stroke (#9B9189);
    beginShape();
    vertex (100, 850);
    vertex (1500, 850);
    vertex (1530, 870);
    vertex (130, 870); 
    endShape(CLOSE);
  
    beginShape();
    vertex (1500, 850);
    vertex (1500, 50);
    vertex (1530, 70);
    vertex (1530, 870);
    endShape(CLOSE);
  
    //KNIFE
    fill (#F7F3F0);
    stroke (#F7F3F0);
    arc(1200, 550, 150, 850, PI+HALF_PI, TWO_PI);
  
    fill (#989898);
    stroke (#989898);
    beginShape();
    vertex (1200, 750);
    vertex (1240, 750);
    vertex (1240, 550);
    vertex (1200, 520);
    endShape(CLOSE);
  
    //TOMATO
    fill (#E34229);
    stroke (#E34229);
    ellipse (920, 300, 200, 200);
  
    fill (#79AA5D);
    stroke (#79AA5D);
    arc(920, 300, 50, 300, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
    arc(920, 300, 50, 300, HALF_PI-(QUARTER_PI/2), PI-QUARTER_PI);
    arc(920, 300, 300, 50, HALF_PI+QUARTER_PI, PI+(QUARTER_PI/2));
    arc(920, 300, 300, 50, QUARTER_PI, QUARTER_PI+(QUARTER_PI/2));
  
    //CHIVES
    fill (#54AF39);
    stroke (#54AF39);
    beginShape();
    vertex (940, 790);
    vertex (945, 800);
    vertex (1043, 445);
    endShape(CLOSE);
    beginShape();
    vertex (950, 790);
    vertex (955, 800);
    vertex (1053, 445);
    endShape(CLOSE);
    beginShape();
    vertex (957, 790);
    vertex (960, 800);
    vertex (1068, 445);
    endShape(CLOSE);
    beginShape();
    vertex (967, 790);
    vertex (970, 800);
    vertex (1070, 445);
    endShape(CLOSE);
    beginShape();
    vertex (977, 790);
    vertex (980, 800);
    vertex (1075, 445);
    endShape(CLOSE);
    beginShape();
    vertex (987, 790);
    vertex (990, 800);
    vertex (1078, 445);
    endShape(CLOSE);
    beginShape();
    vertex (997, 790);
    vertex (1000, 800);
    vertex (1081, 445);
    endShape(CLOSE);
    beginShape();
    vertex (1007, 790);
    vertex (1010, 800);
    vertex (1087, 445);
    endShape(CLOSE);
    beginShape();
    vertex (1017, 790);
    vertex (1020, 800);
    vertex (1095, 445);
    endShape(CLOSE);
    beginShape();
    vertex (1027, 790);
    vertex (1030, 800);
    vertex (1102, 445);
    endShape(CLOSE);
  
    //GARLIC
    fill (#E2E8E1);
    stroke (#E2E8E1);
    ellipse (800, 620, 160, 110);
  
    beginShape();
    vertex (780, 570);
    vertex (820, 570);
    vertex (815, 520);
    vertex (795, 520);
    endShape(CLOSE);
  
    noFill();
    stroke (#C5CBC3);
    ellipse (800, 620, 30, 115);
    ellipse (800, 620, 100, 115);
  
    textSize(20); 
    fill(0);
    text("PLAYER ONE", 300, 200);
    text("W", 340, 290);
    text("S", 340, 380);
    text("A", 340, 470);
    text("D", 340, 560);
    text("E", 340, 650);
    text("R", 340, 740);
    text("PLAYER TWO", 500, 200);
    text("UP-ARROW", 500, 290);
    text("DOWN_ARROW", 500, 380);
    text("LEFT_ARROW", 500, 470);
    text("RIGHT_ARROW", 500, 560);
    text("N OR 1", 500, 650);
    text("M OR 2", 500, 740);
    text("MOVE UP", 150, 290);
    text("MOVE DOWN", 150, 380);
    text("MOVE LEFT", 150, 470);
    text("MOVE RIGHT", 150, 560);
    text("CHOP", 150, 650);
    text("PICK UP/DOWN", 150, 740);
    
    textSize(50);
    text("CONTROLS",640,120);
    
    stroke(0);
    fill(#FA8072);
    rect(110,790,160,50,10);
    
    textSize(20); 
    fill(0);
    text("RETURN", 150, 823);
    
    noTint();
  } 
  
}
