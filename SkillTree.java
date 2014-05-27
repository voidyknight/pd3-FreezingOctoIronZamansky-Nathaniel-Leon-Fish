import java.util.Scanner;
public class SkillTree(){
    private Scanner sc = new Scanner(System.in);
    private final String[] skills = {null, "CS", "Software", "Hardware", 
				     "Web Developer", "Game Developer",
				     "Computer", "Robotics", "Anonymous", 
				     "Hacker", "Digitalize", "Win the Game", 
				     "Biological Computer", "HAL", "Cyberman",
				     "Cyborg"};
    private int[] acquiredSkills;

    public SkillTree(){
	acquiredSkills = {1, -1, -1, -1};
    }

    public void getNewSkill(){
	int last = 3;
	while(acquiredSkills[last] < 0)
	    last --;
	if(last == 3) return;
	System.out.println("Choose a new Skill: press 1 for " + 
			   skills[2*acquiredSkills[last]]+" or 2 for" +
			   skills[2*acquiredSkills[last] + 1]);
	int response = sc.nextInt();
	while(response != 1 || response != 2){
	    System.out.println("Invalid input");
	    System.out.println("Choose a new Skill: press 1 for " + 
			       skills[2*acquiredSkills[last]]+" or 2 for" +
			       skills[2*acquiredSkills[last] + 1]);
	    int response = sc.nextInt();
	}
	if(response == 1)
	    acquiredSkills[last + 1] = skills[2*acquiredSkills[last]];
	else
	    acquiredSkills[last + 1] = skills[2*acquiredSkills[last] + 1]);
    
}
	
}


}