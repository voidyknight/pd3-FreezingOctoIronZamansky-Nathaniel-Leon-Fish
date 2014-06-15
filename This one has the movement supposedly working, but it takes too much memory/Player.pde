public abstract class Player{
    protected String name, phrase;

    protected double health, damage, defense, swag, maxHealth, maxSwag; //swag = mana
    protected int XP, level, range, xpos, ypos, swagRegenSpeed, healthRegenSpeed;
    protected boolean HAL = false;//turns true when HAL skill is activated (10% chance of killing a random enemy)
    protected boolean cyborg = false; //starts shooting bullets when cyborg skill is activated
    protected boolean invisible = false;//true when invisible
    protected int invisiblityCounter = 0;//Will decrease by 1 every second, when it reaches 0 invisibility will stop
    protected int invisiblityCoolDown = 0;//Will decrease by 1 every second, when it reaches 0 invisibility will be available
    protected boolean invincible = false;//true when invincible
    protected int invinciblityCounter = 0;//Will decrease by 1 every second, when it reaches 0 invincibility will stop
    protected int invinciblityCoolDown = 0;//Will decrease by 1 every second, when it reaches 0 invinciblity will be available
    protected SkillTree skills;
    

    public double getHealth(){return health;}
    public double getDamage(){return damage;}
    public double getDefense(){return defense;}
    public double getSwag(){return swag;}
    public double getMaxHealth(){return maxHealth;}
    public double getMaxSwag(){return maxSwag;}
    public boolean getHAL(){return HAL;}
    public boolean getcCyborg(){return cyborg;}
    public boolean getInvisible(){return invisible;}
    public boolean getInvincible(){return invincible;}
    public int getXP(){return XP;}
    public int getLevel(){return level;}
    public int getRange(){return range;}
    public int getXpos(){return xpos;}
    public int getYpos(){return ypos;}
    public int getSwagRegenSpeed(){return swagRegenSpeed;}
    public int getHealthRegenSpeed(){return healthRegenSpeed;}
    public int getInvisiblityCounter(){return invisiblityCounter;}
    public int getInvisiblityCoolDown(){return invisiblityCoolDown;}
    public int getInvinciblityCounter(){return invinciblityCounter;}
    public int getInvinciblityCoolDown(){return invinciblityCoolDown;}
    public String getName(){return name;}
    public String talk(){return phrase;}

    public void setName(String n){name = n;}
    public void setPhrase(String n){phrase = n;}
    public void setHealth(double n){health = n;}
	public void setMaxHealth(double n){maxHealth = n;}
	public void setMaxSwag(double n){maxSwag = n;}
    public void setDamage(double n){damage = n;}
    public void setDefense(double n){defense = n;}
    public void setSwag(double n){swag = n;}
    public void setXP(int n){XP = n;}
    public void setRange(int n ){range = n;}
    public void setXpos(int n){xpos = n;}
    public void setYpos(int n){ypos = n;}
    public void setLevel(int n){level = n;}
    public void setSwagRegenSpeed(int n){swagRegenSpeed = n;}
    public void setHealthRegenSpeed(int n){healthRegenSpeed = n;}
    public void setInvisiblityCounter(int n){invisiblityCounter = n;}
    public void setInvisiblityCoolDown(int n){invisiblityCoolDown = n;}
    public void setInvinciblityCounter(int n){invinciblityCounter = n;}
    public void setInvinciblityCoolDown(int n){invinciblityCoolDown = n;}
    public void setHAL(boolean n){HAL = n;}
    public void setCyborg(boolean n){cyborg = n;}
    public void setInvisible(boolean n){invisible = n;}
    public void setInvincible(boolean n){invincible = n;}
    
    /*public void attack(){
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
    }*/


    public void attack(Monster target){
	if(target == null)
	    return;
	target.setHealth(target.getHealth() - 
			 ((damage * Math.random()) - target.getDefense()));
    }
    
    public void invisible(){
    	if(this.getInvisiblityCoolDown() > 0){
    		return;
    	}
    	else{
    		this.setInvisible(true);
    		this.setInvisiblityCounter(5);
    		this.setInvisiblityCoolDown(10);
    	}
    	
    }
    
    /*public void invincible(){
    	if(this.getInvincibleCoolDown() > 0){
    		return;
    	}
    	else{
    		this.setInvincible(true);
    		this.setInvinciblityCounter(5);
    		this.setInvinciblityCoolDown(10);
    	}
    	
    }
*/
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
	    invisible(); //invisible()
	if(n==9)
	    return; //hack()
	if(n==10)
	    return; //invincible()
	}


}
