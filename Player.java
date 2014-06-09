public abstract class Player{
    protected String name, phrase;
    protected Map map;

    protected double health, damage, defense, swag; //swag = mana
    protected int XP, level, range, xpos, ypos, swagRegenSpeed, healthRegenSpeed;

    protected SkillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getSwag(){return swag;}

    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public int getSwagRegenSpeed(){return swagRegenSpeed;}
    public int getHealthRegenSpeed(){return healthRegenSpeed;}
    public String getName(){return name;}
    public String talk(){return phrase;}

    public void setName(String n){name = n;}
    public void setHealth(double n){health = n;}
    public void setXP(int n){XP = n;}
    public void setPhrase(String n){phrase = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setLevel(int n){level = n;}
    public void setSwag(double n){swag = n;}
    public void setRange(int n ){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}
    public void setSwagRegenSpeed(int n){swagRegenSpeed = n;}
    public void setHealthRegenSpeed(int n){healthRegenSpeed = n;}

    public void attack(){
	Monster target = null;
	for(int x = -1; x < 2; x ++){
	    for(int y = -1; y < 2; y ++){
		if(!map.get(x,y).equals(" ") && !map.get(x,y).equals("#") && !map.get(x,y).equals("p")){
		    target = map.getMonster(x,y);
		    x += 10;
		    y += 10;
		}
	    }
	}
	attack(target);
    }


    public void attack(Monster target){
	if(target == null)
	    return;
	target.setHealth(target.getHealth() - 
			 ((damage * Math.random()) - target.getDefense()));
    }

    public abstract void skill(int n);

}
