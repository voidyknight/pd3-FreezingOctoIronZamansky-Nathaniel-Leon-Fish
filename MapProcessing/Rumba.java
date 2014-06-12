public class Rumba extends Monster{

    public Rumba(){
	super.setName("Machine guns");
	super.setLevel(1);
	super.setHealth(100);
	super.setDamage(5);
	super.setDefense(5);
	super.setRange(5);
    }

    public Rumba(int x, int y){//used in Map class
	super.setName("Machine guns");
	super.setLevel(1);
	super.setHealth(100);
	super.setDamage(5);
	super.setDefense(5);
	super.setRange(5);

	super.setXpos(x);
	super.setYpos(y);
    }

    public void skill(int n){}
}
