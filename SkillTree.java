import java.util.*;
import cs1.Keyboard;
public class SkillTree{
    private final String[] skills = {null, "CS", "Software", "Hardware", 
				     "Web Developer", "Game Developer",
				     "Computer", "Robotics", "Anonymous", 
				     "Hacker", "Digitalize", "Win the Game", 
				     "Biological Computer", "HAL", "Cyberman",
				     "Cyborg"};
    private int[] acquiredSkills = {1,-1,-1,-1};

    public SkillTree(){}

    public void getNewSkill(){
	int last = 3;
	while(acquiredSkills[last] < 0)
	    last --;
	if(last == 3) return;
	System.out.println("Choose a new Skill: press 1 for " + 
			   skills[2*acquiredSkills[last]]+" or 2 for " +
			   skills[2*acquiredSkills[last] + 1]);
	int response = -1; boolean end = false;
	while(!end){
	    response = Keyboard.readInt();
	    if(response == 1 || response == 2)
		end = true;
	    else
		System.out.println("Invalid input: 1 or 2?");
	}

	if(response == 1)
	    acquiredSkills[last + 1] = 2*acquiredSkills[last];
	else
	    acquiredSkills[last + 1] = 2*acquiredSkills[last] + 1;
    }

    public void listSkills(){
	String a = "";
	for(int s : acquiredSkills){
	    if(s > -1)
		a += skills[s] + ", ";
	}
	System.out.println(a);
    }

    public static void main(String[]args){
	SkillTree a = new SkillTree();
	a.getNewSkill();
	a.listSkills();
    }
    
    
    
}