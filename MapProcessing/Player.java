public abstract class Player{
    protected String name, phrase;
    protected Map map;

    protected double health, damage, defense, swag; //swag = mana
    protected int XP, level, range, xpos, ypos, swagRegenSpeed, healthRegenSpeed;
    protected boolean HAL = false; //turns true when HAL skill is activated (10% chance of killing a random enemy)
    protected SkillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getSwag(){return swag;}
    public boolean getHAL(){return HAL};

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
    public void setHAL(boolean n){HAL = n};

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


    public void skill(int n){
	if(n == 2 || n == 3 || n == 7 || n > 10)
	    return; //all are passive skills and cannot be "activated"
	boolean go = false;
	for(int x : skills.acquiredSkills) //checks to see if has skill
	    if(n == x)
		go = true;
	if(!go)
	    return;
	if(n == 1)
	    return;//shoot()
	if(n == 4)
	    return; //confuse()
	if(n==5)
	    return; //explosion()
	if(n==6)
	    return; //freeze()
	if(n==8)
	    return; //invisible()
	if(n==9)
	    return; //hack()
	if(n==10)
	    return; //invincible()
	}


}
