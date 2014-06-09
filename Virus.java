public class Virus extends Monster{

    public Virus(){
	super.setName("Elk Cloner");
	super.setLevel(1);
	super.setHealth(100);
	super.setDamage(5);
	super.setDefense(5);
	super.setRange(1);
    }

    public Virus(int i, int x, int y){//used in Map class
	super.setName("Elk Cloner");
	super.setLevel(1);
	super.setHealth(100);
	super.setDamage(5);
	super.setDefense(5);
	super.setRange(1);

	super.setID(i);
	super.setXpos(x);
	super.setYpos(y);
    }

    public void skill(int n){}
   
}
