class Button{
    
  int xpos = 500;
  int ypos = 100;
  int w = 300;
  int h = 100;
  int level;
  
  
  Button(int i){
    level = i;
    System.out.println(level);
  }
  
  void drawButton(){
   background(#009999);
   rect(xpos,ypos,w,h);
   fill(255);
   if(mousePressed){
    if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
     println(level);
     fill(0);
     level++;
    }
   }
  }

}
 
