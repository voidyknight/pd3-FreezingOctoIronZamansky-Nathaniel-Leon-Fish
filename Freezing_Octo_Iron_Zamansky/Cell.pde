public class Cell{
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  color c; //color
  boolean travelled;

  // Cell Constructor
  public Cell(float X, float Y, float W, float H, color C) {
    x = X;
    y = Y;
    w = W;
    h = H;
    c = C;
    travelled = false;
  } 
  
  public void display() {
    stroke(c);
    fill(c);
    rect(x,y,w,h);
  }
  
  public void setColor(color C){
    c = C;   
  }
  
  public color getColor(){
    return c; 
  }
  
  public float getX(){
    return x;
  }

  public float getY(){
    return y;
  }
  

  public boolean getTravelled(){
    return travelled;
  }
  

  public void setTravelled(boolean x){
    travelled = x;
  }

}

