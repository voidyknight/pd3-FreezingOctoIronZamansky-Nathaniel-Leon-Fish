public abstract class Monster{
    protected String name;
    protected double health, damage, defense;
    protected int XP, level;
    protected skillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public String getName(){return name;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    
    public double attack(Player target){

    public abstract void skill(int n);

}
