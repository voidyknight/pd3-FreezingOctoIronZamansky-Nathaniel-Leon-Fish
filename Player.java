public abstract class Player{
    protected String name, phrase;
    protected double health, damage, defense, caffeine;
    protected int XP, level;
    protected skillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getCaffeine(){return caffeine;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
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

    public double attack(Monster target){return 0.0;}

    public abstract void skill(int n);

}