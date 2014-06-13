import java.util.*;
import java.lang.*;

public abstract class Monster{
    protected String name;
    protected double health, damage, defense;
    protected int XP, level, range, xpos, ypos;
    protected ArrayList<Cell> path;

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public String getName(){return name;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setRange(int n){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}

    public double attack(Player target){
        return ((damage * Math.random()) - target.getDefense());
    }

    public abstract void skill(int n);
    
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
