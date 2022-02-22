class ScoreScreen extends Level{
  ScoreScreen(){
  }
  
  @Override
  int updateTick(){
    if (mousePressed == true && mouseX > 490 && mouseX < 850 && mouseY > 500 && mouseY < 560)
      return 6;
    if (mousePressed == true && mouseX > 490 && mouseX < 850 && mouseY > 600 && mouseY < 660)
      return 9;
    if (mousePressed == true && mouseX > 490 && mouseX < 850 && mouseY > 700 && mouseY < 760)
      return thisLevel;
      
    if (mouseX > 490 && mouseX < 850 && mouseY > 500 && mouseY < 560)
      cursor(HAND);
    else if (mouseX > 490 && mouseX < 850 && mouseY > 600 && mouseY < 660)
      cursor(HAND);
    else if (mouseX > 490 && mouseX < 850 && mouseY > 700 && mouseY < 760)
      cursor(HAND);
    else
      cursor(ARROW);
    
    drawScoreScreen();
    
    return 0;
  }
  
  void drawScoreScreen(){
    background (#BFB3A9);
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
    
    //Remaining vegetables
    fill (#E34229);
    stroke (#E34229);
    ellipse(1214,202,5,7);
    ellipse(1244,308,13,9);
    ellipse(1247,255,4,10);
    ellipse(1270,514,7,5);
    ellipse(1263,395,12,11);
    ellipse(129,168,11,12);
    ellipse(158,371,3,13);
    ellipse(171,391,6,7);
    ellipse(175,535,8,6);
    ellipse(150,686,5,3);
    greenStuff(1257,345);
    greenStuff(1267,444);
    greenStuff(1364,134);
    greenStuff(1269,476);
    greenStuff(1219,436);
    greenStuff(1235,498);
    greenStuff(1293,260);
    greenStuff(1408,373);
    greenStuff(1334,508);
    greenStuff(1392,620);
    greenStuff(120,266);
    greenStuff(124,487);
    greenStuff(178,668);
    greenStuff(172,153);
    
    stroke(0);
    fill(#FA8072);
    rect(490,500,360,60,10);
    rect(490,600,360,60,10);
    rect(490,700,360,60,10);
    
    textAlign(CENTER);
    fill(0);
    
    textSize(200);
    text(score,670,415);
    
    textSize(40);
    text("Awesome! You've completed this level!",670,125);
    
    textSize(30);
    text("Your Score is",670,200);
    
    text("Return to Main Menu",670,540);
    text("Return to Level Select",670,640);
    text("Retry this Level",670,740);
    
    textAlign(LEFT);
  }
  
  void greenStuff(int x, int y){
    fill (#54AF39);
    stroke (#54AF39);
    beginShape();
    vertex(x,y);
    vertex(x+2,y+11);
    vertex(x+7,y+13);
    vertex(x+1,y+1);
    endShape(CLOSE);
  }
}
