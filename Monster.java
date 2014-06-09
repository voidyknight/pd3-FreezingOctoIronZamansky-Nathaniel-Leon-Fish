public abstract class Monster{
    protected String name;
    protected double health, damage, defense;
    protected int XP, level, range, xpos, ypos;
    protected SkillTree skills;
    protected int ID;
    
    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public String getName(){return name;}
    public int getID(){return ID;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setRange(int n){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}
    public void setID(int n){ID = n;}

    public double attack(Player target){
        return ((damage * Math.random()) - target.getDefense());
    }

    public abstract void skill(int n);

}
