Cell[][] map;
int cols = 150;
int rows = 30;
String playertype;//stores type of player Player is
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Player> player = new ArrayList<Player>();

final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;
int x,y;

//keyboard input works but is super buggy[can walk anywhere]
 

void setup(){
  size(1500,300);
  frameRate(50);
  result = 0;
  
  map = new Cell[rows][cols];
  playertype = "K";//default value
  
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
        if (playertype.equals("K")){
          player.add(new K(c, r));}
        else if (playertype.equals("Brooks")){
          player.add(new Brooks(c, r));}
        else if (playertype.equals("Brown")){
          player.add(new Brown(c, r));}
        else if (playertype.equals("Zamansky")){
          player.add(new Zamansky(c, r));}
      }
      else if (lines[r].substring(c,c+1).equals("v")){
        map[r][c] = new Cell(c*10,r*10,10,10,#990099);
        monsters.add(new Virus(c, r));
      }
      else if (lines[r].substring(c,c+1).equals("r")){
        map[r][c] = new Cell(c*10,r*10,10,10,#4C0099);
        monsters.add(new Rumba(c, r));
      }
      else if (lines[r].substring(c,c+1).equals("z")){
        map[r][c] = new Cell(c*10,r*10,10,10,#99004C);
        monsters.add(new FreezingOctoIronZamansky(c, r));
      }
      else{
        map[r][c] = new Cell(c*10,r*10,10,10,#FFFFFF);
      }
    }
  }
  
  x = player.get(0).getXpos()*10;
  y = player.get(0).getYpos()*10;
        
  //arraylist check
  /*
  for(Monster m : monsters){
    System.out.println(m.getXpos() +", "+ m.getYpos());
  }
  for(Player p : player){
    System.out.println(p.getXpos() +", "+ p.getYpos());
  }*/
}


void draw(){

  background(255);
   
  for (int i=0;i<rows;i++){
    for (int j=0;j<cols;j++){
      map[i][j].display();
    }
  }
  
   switch(result) {
    case NORTH:
      if(!(map[(y+1)/10][x/10].getColor() == #009999)){
         y--;
         player.get(0).setYpos(player.get(0).getYpos()+1);
         }
         break;
    case EAST:
      x++;
      player.get(0).setXpos(player.get(0).getXpos()+1);
      break;
    case SOUTH: 
      y++; 
      player.get(0).setYpos(player.get(0).getYpos()-1);
      break;
    case WEST: 
      x--;
      player.get(0).setXpos(player.get(0).getYpos()-1);
      break;
    case NORTH|EAST: 
      y--; x++; 
      player.get(0).setYpos(player.get(0).getYpos()+1);player.get(0).setXpos(player.get(0).getXpos()+1);
      break;
    case NORTH|WEST: 
      y--; x--; 
      player.get(0).setYpos(player.get(0).getYpos()+1);player.get(0).setXpos(player.get(0).getXpos()-1);
      break;
    case SOUTH|EAST:
      y++; x++;
      player.get(0).setYpos(player.get(0).getYpos()-1);player.get(0).setXpos(player.get(0).getXpos()+1);
      break;
    case SOUTH|WEST: 
      y++; x--;       
      player.get(0).setYpos(player.get(0).getYpos()-1);player.get(0).setXpos(player.get(0).getXpos()-1);
      break;
  }
  if(!(map[(y+1)/10][x/10].getColor() == #009999)){
  map[y/10][x/10].setColor(#FFFFFF);
  fill(#33FF99);
  rect(x, y ,10,10);
  }
  
  //test
  //System.out.println(player.get(0).getXpos() +", "+ player.get(0).getYpos());
  
}

void keyPressed(){
    switch(key) {
    case('w'):case('W'):
      result |=NORTH;
      break;
    case('d'):case('D'):
      result |=EAST;
      break;
    case('s'):case('S'):
      result |=SOUTH;
      break;
    case('a'):case('A'):
      result |=WEST;
      break;
  }
}


void keyReleased(){  
  switch(key) {
    case('w'):case('W'):result ^=NORTH;break;
    case('d'):case('D'):result ^=EAST;break;
    case('s'):case('S'):result ^=SOUTH;break;
    case('a'):case('A'):result ^=WEST;break;
  }
}




  

