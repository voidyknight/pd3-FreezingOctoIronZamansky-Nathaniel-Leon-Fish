class Button{
    
  int xpos;
  int ypos;
  int w = 200;
  int h = 30;
  String name;
  
  
  Button(String n){
    name = n;
    if (n.equals("Brown")){
      xpos = 400;
      ypos = 75;
    }
    if (n.equals("Zamansky")){
      xpos = 400;
      ypos = 125;
    }
    if (n.equals("Brooks")){
      xpos = 400;
      ypos = 175;
    }
    if (n.equals("K")){
      xpos = 400;
      ypos = 225;
    }
  }
  
  boolean drawButton(){
   rect(xpos,ypos,w,h);
   fill(255);
   if(mousePressed){
    if(mouseX>xpos && mouseX <xpos+w && mouseY>ypos && mouseY <ypos+h){
     return true;
    }
   }
   return false;
  }
  
  String getName(){
    return name;
  }

}
 
