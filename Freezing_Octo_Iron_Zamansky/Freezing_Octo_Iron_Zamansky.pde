import ddf.minim.*;

AudioPlayer audioPlayer;
Minim minim;//song in background

Cell[][] map;

int cols = 150;
int rows = 30;
int level = 0;
boolean setupyet=false;
Button topher,mike,peter,sam;
boolean paused = false;
ArrayList<Button> startbuttons = new ArrayList<Button>();
String playertype;//stores type of player Player is
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Player> player = new ArrayList<Player>();
Player p1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
long time = 0;
long timeElapsed = 0;

final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
final static int PAUSE = 999;
final static int RESUME = -999;
final static int ATTACK = 500;
final static int SHOOT = 400;

int result;
int x,y;

 

void setup(){
  size(1500,300); 
  fill(#009999);
  frameRate(30);
  result = 0;
  
 
  //map = new Cell[rows][cols];
  
  
  background(0);
  textSize(40);
  textAlign(CENTER);
  text("Pick a character to play as", 300, 50);
  //fill(0);
  textSize(30);
  text("Topher", 300, 100);
  text("Mike", 300, 150);
  text("Peter", 300, 200);
  text("Sam", 300, 250);
  
  topher = new Button("Brown");
  startbuttons.add(topher);
  mike = new Button("Zamansky");
  startbuttons.add(mike);
  peter = new Button("Brooks");
  startbuttons.add(peter);
  sam = new Button("K");
  startbuttons.add(sam);
}

void setupMap(String s){//s is player type
  
  map = new Cell[rows][cols]; 
  
  if (level<6){
  
    String[] lines = loadStrings("Map"+level+".txt");//replace this with any of the 5 map files
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
          if (s.equals("K")){
            playertype = "K";
            player.add(new K(c, r));}
          else if (s.equals("Brooks")){
            playertype = "Brooks";
            player.add(new Brooks(c, r));}
          else if (s.equals("Brown")){
            playertype = "Brown";
            player.add(new Brown(c, r));}
          else if (s.equals("Zamansky")){
            playertype = "Zamansky";
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
          

  }
  
  
}


void draw(){ 

  
  if (monsters.isEmpty() && setupyet){
    level++;
    setupMap(playertype);//creating a new player though...
  }
  
  if (level>0&&level<6){ 
  
    background(255);
    
    if (setupyet==(false)){
      minim = new Minim(this);
      audioPlayer = minim.loadFile("Song.mp3", 2048);
      audioPlayer.play();
      
      setupMap(playertype);
      setupyet=true;
    }
    
    for (int i=0;i<rows;i++){
      for (int j=0;j<cols;j++){
        map[i][j].display();
      }
    }
    
    for(int x = 0; x < monsters.size(); x ++){
      if(monsters.get(x).getHealth() <= 0){
         map[monsters.get(x).getYpos()][monsters.get(x).getXpos()].setColor(#FFFFFF);
         monsters.remove(x);
      }
    }
  
          p1 = player.get(0);
  time = System.currentTimeMillis();
  timeElapsed += System.currentTimeMillis();
  if(timeElapsed - time >= 3000){
    p1.setHealth(p1.getHealth() + p1.getHealthRegenSpeed());
    p1.setSwag(p1.getSwag() + p1.getSwagRegenSpeed());
    time = System.currentTimeMillis();
    timeElapsed = System.currentTimeMillis();
  }
    
     switch(result) {
      
      case ATTACK:
       for(int a = 0; a < monsters.size(); a ++){
         if(Math.abs(monsters.get(a).getXpos()+monsters.get(a).getYpos() - (y+x)/10) <= player.get(0).getRange())
           player.get(0).attack(monsters.get(a));
           System.out.println(a + " " +monsters.get(a).getHealth() + " " + monsters.get(a).getXpos()+"  "+monsters.get(a).getYpos() + " " + x/10 + " " + y/10);//+player.get(0).getXpos()+"  "+player.get(0).getYpos() );
       }
       break;
       
       
      case NORTH:
       if(map[(y-1)/10][x/10].getColor() == #FFFFFF && paused!=true){
        y--;
        player.get(0).setYpos(player.get(0).getYpos()+1);
       }
       break;
       
      case EAST:
        if(map[y/10][(x+1)/10].getColor() == #FFFFFF && paused!=true){
          x++;
          player.get(0).setXpos(player.get(0).getXpos()+1);
        }
        break;
        
      case SOUTH: 
        if(map[(y+1)/10][x/10].getColor() == #FFFFFF && paused!=true){
          y++; 
          player.get(0).setYpos(player.get(0).getYpos()-1);
        }
        break;
        
      case WEST: 
        if(map[y/10][(x-1)/10].getColor() == #FFFFFF && paused!=true){
          x--;
          player.get(0).setXpos(player.get(0).getXpos()-1);
        }
        break;
      case NORTH|EAST: 
        if(map[(y-1)/10][(x+1)/10].getColor() == #FFFFFF && paused!=true){
          y--; x++; 
          player.get(0).setYpos(player.get(0).getYpos()+1);player.get(0).setXpos(player.get(0).getXpos()+1);
        }
        break;
      case NORTH|WEST:
        if(map[(y-1)/10][(x-1)/10].getColor() == #FFFFFF && paused!=true){
          y--; x--; 
          player.get(0).setYpos(player.get(0).getYpos()+1);player.get(0).setXpos(player.get(0).getXpos()-1);
        }
        break;
      case SOUTH|EAST:
        if(map[(y+1)/10][(x+1)/10].getColor() == #FFFFFF && paused!=true){
          y++; x++;
          player.get(0).setYpos(player.get(0).getYpos()-1);player.get(0).setXpos(player.get(0).getXpos()+1);
        }
        break;
      case SOUTH|WEST: 
        if(map[(y+1)/10][(x-1)/10].getColor() == #FFFFFF && paused!=true){
          y++; x--;       
          player.get(0).setYpos(player.get(0).getYpos()-1);player.get(0).setXpos(player.get(0).getXpos()-1);
        }
        break;
      case PAUSE:
        paused = true;
        audioPlayer.pause();
        for (int j=0;j<cols;j++){
          map[0][j].setColor(#00FFFF);
          map[29][j].setColor(#00FFFF);
        }
        break;
      case RESUME:
        paused = false;
        audioPlayer.play();
        for (int j=0;j<cols;j++){
          map[0][j].setColor(#009999);
          map[29][j].setColor(#009999);
        }
        break;
      case SHOOT:
        if(player.get(0).getSwag() - 5 >= 0){
           map[y/10][(x/10)+1].setColor(#CC0000);
           bullets.add(new Bullet((x/10)+1,y/10));
           player.get(0).setSwag(player.get(0).getSwag() - 5);
        }
        break;
     }
    
     map[y/10][x/10].setColor(#FFFFFF);
     fill(#33FF99);
     rect(x, y ,10,10);
     
     //monster movement
int count;
    for(Monster m : monsters){
      if (paused!=true){
      //System.out.println("here1 " +m.getXpos() + " " +m.getYpos() );
        Cell nextMove = m.getNextMove();
        count = 0;
        while(nextMove == null && count < 20){
          m.findPath(map[y/10][x/10], map);
          nextMove = m.getNextMove();
          count ++;
        }
        /*try{
        Thread.sleep(10);
        }catch (InterruptedException e){};*/
        if(count != 19){
        map[m.getYpos()][m.getXpos()].setColor(#FFFFFF);
        
        m.setXpos((int)nextMove.getX()/10);
        m.setYpos((int)nextMove.getY()/10);
  
        if(m.getType() == 'r'){
          map[m.getYpos()][m.getXpos()].setColor(#4C0099);
        }
        else if(m.getType() == 'v'){
          map[m.getYpos()][m.getXpos()].setColor(#990099);
        }
        else if(m.getType() == 'z'){
          map[m.getYpos()][m.getXpos()].setColor(#99004C);
        }

        }
        count = 0;
    
   //  System.out.println("here2 " +m.getXpos() + " " +m.getYpos() );

  }

    }
  

    //note to self: make so that you can shoot bullets Nort/South/East/West
     Bullet bl;
    for (int x = 0; x < bullets.size(); x ++){
        bl = bullets.get(x);
        bl.setXpos((int)(bl.getXpos())+1);
        bl.setYpos((int)(bl.getYpos()));
       
           
        try{
        map[bl.getYpos()][bl.getXpos()-1].setColor(#FFFFFF);
        if(map[bl.getYpos()][bl.getXpos()].getColor() == #FFFFFF) 
           map[bl.getYpos()][bl.getXpos()].setColor(#CC0000);
        else
          bullets.remove(x);
        }catch(Exception e){}
         for(Monster m : monsters){
          if(m.getXpos()/10 == bl.getXpos()/10 && m.getYpos()/10 == bl.getYpos()/10){
            m.setHealth(m.getHealth() - 15);
            bullets.remove(x);
            map[bl.getYpos()][bl.getXpos()].setColor(#FFFFFF);
          }
         }
    }
    
    //test
    //System.out.println(player.get(0).getXpos() +", "+ player.get(0).getYpos());
  }
  
  else if (level==0){
    for (Button b : startbuttons){
      if (b.drawButton()==(true)){
        playertype = b.getName();
        level++;
      }
    }
  }
  
  
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
    case('p'):case('P'):
      result |=PAUSE;
      break;
    case('r'):case('R'):
      result |=RESUME;
      break;
  //attack
    case(' '):
      result |=ATTACK;
      break;
  //shoot
  case('k'):case('K'):
      result |=SHOOT;
      break;
  }
}


void keyReleased(){  
  switch(key) {
    case('w'):case('W'):result ^=NORTH;break;
    case('d'):case('D'):result ^=EAST;break;
    case('s'):case('S'):result ^=SOUTH;break;
    case('a'):case('A'):result ^=WEST;break;
    case('p'):case('P'):result ^=PAUSE;break;
    case('r'):case('R'):result ^=RESUME;break;
    case(' '):result ^=ATTACK;break;
    case('k'):case('K'):result ^=SHOOT;break;

  }
}




  

