import java.util.*;
//import cs1.Keyboard;
public class SkillTree{
    protected final String[] skills = {null, "CS", "Software", "Hardware", 
				     "Web Developer", "Game Developer",
				     "Computer", "Robotics", "Anonymous", 
				     "Hacker", "Digitalize", "Win the Game", 
				     "Biological Computer", "HAL", "Cyberman",
				     "Cyborg"};
    protected int[] acquiredSkills = {1,-1,-1,-1};

    public SkillTree(){}

    public void getNewSkill(Player p){
	int last = 3;
	while(acquiredSkills[last] < 0)
	    last --;
	if(last == 3) return;
	System.out.println("Choose a new Skill: press 1 for " + 
			   skills[2*acquiredSkills[last]]+" or 2 for " +
			   skills[2*acquiredSkills[last] + 1]);
	int response = -1; boolean end = false;
	while(!end){
	    //response = Keyboard.readInt();
	    if(response == 1 || response == 2)
		end = true;
	    else
		System.out.println("Invalid input: 1 or 2?");
	}

	if(response == 1)
	    acquiredSkills[last + 1] = 2*acquiredSkills[last];
	else
	    acquiredSkills[last + 1] = 2*acquiredSkills[last] + 1;
	    
	    //immediately activating passive skills 2, 3, 7, 11, 12, 13, 14, 15
	    if(acquiredSkills[last + 1] == 2){
	    	p.setSwag(p.getSwag() + 30.0);
	    }	
	    if(acquiredSkills[last + 1] == 3){
	    	p.setDamage(p.getDamage() + 15.0);
	    }
	    if(acquiredSkills[last + 1] == 7){
	    	p.setRange(p.getRange()*2);
	    }
	    if(acquiredSkills[last + 1] == 11){
	    	return; //rickrolls; change this later
	    }	    
	    if(acquiredSkills[last + 1] == 12){
	    	p.setSwagRegenSpeed(p.getSwagRegenSpeed() * 4);
	    	p.setHealthRegenSpeed(p.getHealthRegenSpeed() * 4);
	    	p.setDamage(p.getDamage() * 4);
	    }	
	    if(acquiredSkills[last + 1] == 13){
	    	p.setHAL(true);
	    }
	    if(acquiredSkills[last + 1] == 14){
	    	p.setMaxHealth(p.getMaxHealth() * 2);
	    	p.setMaxSwag(p.getMaxSwag() * 2);
	    	p.setDamage(p.getDamage() * 3);
	    	p.setDefense(p.getDefense() * 3);
	    }
	    if(acquiredSkills[last + 1] == 15){
	    	p.setDefense(p.getDefense() * 4);
	    	p.setDamage(p.getDamage() * 4);
	    	p.setCyborg(true);
	    }	    
    }

    public void listSkills(){
	String a = "";
	for(int s : acquiredSkills){
	    if(s > -1)
		a += skills[s] + ", ";
	}
	System.out.println(a);
    }

    /*public static void main(String[]args){
	SkillTree a = new SkillTree();
	//a.getNewSkill();
	a.listSkills();
    }*/
    
    
}
