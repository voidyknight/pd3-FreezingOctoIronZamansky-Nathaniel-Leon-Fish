public abstract class Monster{
    protected String name;
    protected double health, damage, defense;
    protected int XP, level, range, xpos, ypos, turn;
    protected boolean isHacked = false;// true when hacked
    protected boolean isFrozen = false;//true when frozen
    protected ArrayList<Cell> path;
    protected char type;

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public String getName(){return name;}
    public int getTurn(){return turn;}
    public char getType(){return type;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setRange(int n){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}
    public void setTurn(int n){turn = n;}
    public void setType(char s){type = s;}
    
    public void increaseTurn(){turn ++;}
    public void increaseTurn(int x){turn += x;}
    public void decreaseTurn(){turn --;}
    public void decreaseTurn(int x){turn -= x;}
    
    public Cell getNextMove(){
      Cell move = path.get(0);
      path.remove(0);
      return move;
    }

    public double attack(Player target){
        return ((damage * Math.random()) - target.getDefense());
    }

    public abstract void skill(int n);

      public ArrayList<Cell> getViableNeigh(Cell[][] map, Cell c){
  	  ArrayList<Cell> neighbors = new ArrayList<Cell>(8);
  	  for(int x = -1; x < 2; x ++){
             for(int y = -1; y < 2; y ++){
  	        if(map[x + (int)c.getX()][y + (int)c.getY()].getColor() == #FFFFFF)
                   neighbors.add(map[x + (int)c.getX()][y + (int)c.getY()]);
  	      }
  	  }
    	  return neighbors; 
        }
        
      public ArrayList<Cell> getViableNeigh(Cell[][] map){
        ArrayList<Cell> neighbors = new ArrayList<Cell>(8);
        for(int x = -1; x < 2; x ++){
          for(int y = -1; y < 2; y ++){
            if(x + xpos < map[0].length && y + ypos < map.length && x + xpos > -1 && y + ypos > -1 && (y != 0 || x != 0)){
              if(map[y + (ypos)][x + (xpos)].getColor() == #FFFFFF){
                neighbors.add(map[y + (ypos)][x + (xpos)]);
              }
            }
          }
        }
        return neighbors;
      }
    


	
    
      public void findPath(Cell target, Cell[][] map){
	if(target.getX() == xpos && target.getY() == ypos)
	    return;
	PQueue frontier = new PQueue(target);
	ArrayList<Cell> neigh = getViableNeigh(map);
	ArrayList<Cell> path = new ArrayList<Cell>();
	for(Cell c : neigh){
	  if(!c.getTravelled()){
	     frontier.insert(c);
}
	}
	path.add(frontier.peek());
	frontier.peek().setTravelled(true);
	if(frontier.peek() == target){
          this.path = path;
          return;
        }
	path = findPathF(target, map, frontier.get(), frontier, path);
	for(Cell[] a: map){
	  for (Cell c : a)
	    c.setTravelled(false);
	}
	this.path = path;
	turn = 4;
   }
	
   public boolean neighbors(Cell a, Cell b){
     if(Math.abs(Math.abs(a.getX()) - Math.abs(b.getX())) > 1)
       return false;
     if(Math.abs(Math.abs(a.getX()) - Math.abs(b.getX())) > 1)
       return false;
     return true;
   }
   
   
   public ArrayList<Cell> findPathF(Cell target, Cell[][] map, Cell current, PQueue frontier, ArrayList<Cell> path){
       for(Cell c : getViableNeigh(map)){
         if(!c.getTravelled())
           frontier.insert(c);
       }
       while(path.size() > 0 && !neighbors(frontier.peek(), path.get(path.size() - 1))){
         frontier.get();
         path.remove(path.size() - 1);
       }
       path.add(frontier.peek());
       frontier.peek().setTravelled(true);
       if(frontier.peek() == target) return path;
       path = findPathF(target, map, frontier.get(), frontier, path);
       return path;
       }
       
       
	
	
	
	    
	
	      //old code
	
    /*public void findPath(Player target, int xPos, int yPos){
        if (xPos == target.getXpos()){
            if (yPos == target.getYpos()){
            path.add(map[xPos][yPos];
            }
            else if( target.getYpos() > yPos{
                if(map[xPos][yPos].getColor().eqauls(009999)){
                    return;
                }
                path.add(map[xPos][yPos]);
                findPath(target, xPos, yPos++, path);
            }
            else{
                if(map[xPos][yPos].getColor().eqauls(009999)){
                    return;
                }
                path.add(map[xPos][yPos]);
                findPath(target, xPos, yPos--, path);
            }
        }
        else if(xPos < target.getXpos()){
            if(map[xPos][yPos].getColor().eqauls(009999)){
                    return;
            }
            path.add(map[xpos][yPos]);
            findPath(target, xPos++, yPos, path);
        }
        else{
            if(map[xPos][yPos].getColor().eqauls(009999)){
                    return;
            }
            path.add(map[xPos][yPos]);
            findPath(target, xPos--, yPos, path);
        }
    }*/
}
