public abstract class Player{
    protected String name, phrase;
<<<<<<< HEAD
    protected double health, damage, defense, swag; //swag = mana
    protected int XP, level;
=======
    protected double health, damage, defense, caffeine;
    protected int XP, level, range, xpos, ypos;
>>>>>>> 3ed482b5b86b03c516654edb74af15ed4f79b3aa
    protected skillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getCaffeine(){return caffeine;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public String getName(){return name;}
    public String talk(){return phrase;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setPhrase(String n){phrase = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setCaffeine(double n){caffeine = n;}
    public void setRange(int n ){range = n;}

    public double attack(Monster target){return ((damage * Math.random()) - target.getDefense());}

    public abstract void skill(int n);

}
