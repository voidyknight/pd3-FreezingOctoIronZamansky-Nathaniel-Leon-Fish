public abstract class Player{
    protected String name, phrase;

    protected double health, damage, defense, schwag; //schwag = mana
    protected int XP, level, range, xpos, ypos;

    protected skillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getSchwag(){return schwag;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public String getName(){return name;}
    public String talk(){return phrase;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setPhrase(String n){phrase = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setSchwag(double n){schwag = n;}
    public void setRange(int n ){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}

    public double attack(Monster target){return ((damage * Math.random()) - target.getDefense());}

    public abstract void skill(int n);

}
