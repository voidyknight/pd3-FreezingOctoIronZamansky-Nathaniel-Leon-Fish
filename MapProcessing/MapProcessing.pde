Cell[][] map;
int cols = 150;
int rows = 30;

void setup(){
  size(1500,300);
  map = new Cell[rows][cols];
  
  String[] lines = loadStrings("Map1.txt");//replace this with any of the 5 map files
  for (int c = 0; c < 150; c++){//columns
    for (int r = 0; r < 30; r++){//rows
      if (lines[r].substring(c,c+1).equals("#")){
        map[r][c] = new Cell(c*10,r*10,10,10,#009999);
      }
      else if (lines[r].substring(c,c+1).equals(" ")){
        map[r][c] = new Cell(c*10,r*10,10,10,#FFFFFF);
      }
      else if (lines[r].substring(c,c+1).equals("p")){
        map[r][c] = new Cell(c*10,r*10,10,10,#33FF99);
      }
      else if (lines[r].substring(c,c+1).equals("v")){
        map[r][c] = new Cell(c*10,r*10,10,10,#990099);
      }
      else if (lines[r].substring(c,c+1).equals("r")){
        map[r][c] = new Cell(c*10,r*10,10,10,#4C0099);
      }
      else if (lines[r].substring(c,c+1).equals("z")){
        map[r][c] = new Cell(c*10,r*10,10,10,#99004C);
      }
      else{
        map[r][c] = new Cell(c*10,r*10,10,10,#FFFFFF);
      }
    }
  }
}

void draw(){
  background(255);
  for (int i=0;i<rows;i++){
    for (int j=0;j<cols;j++){
      map[i][j].display();
    }
  }
  
}

  

