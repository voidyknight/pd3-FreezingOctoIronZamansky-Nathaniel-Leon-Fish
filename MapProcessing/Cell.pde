class Cell{
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  color c; //color

  // Cell Constructor
  Cell(float X, float Y, float W, float H, color C) {
    x = X;
    y = Y;
    w = W;
    h = H;
    c = C;
  } 
  
  void display() {
    stroke(c);
    fill(c);
    rect(x,y,w,h);
  }
  
  color getColor(){
    return c; 
  }
}
