public class Virus extends Monster{

    public Virus(){
	setName("Elk Cloner");
	setLevel(1);
	setHealth(100);
	setDamage(5);
	setDefense(5);
	setRange(1);
	setType('v');
    }

    public Virus(int x, int y){//used in Map class
	setName("Elk Cloner");
	setLevel(1);
	setHealth(100);
	setDamage(5);
	setDefense(5);
	setRange(1);
	setXpos(x);
	setYpos(y);
	setType('v');
    }

    public void skill(int n){}
   
}
