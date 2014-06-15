public class Rumba extends Monster{

    public Rumba(){
	setName("Machine guns");
	setLevel(1);
	setHealth(100);
	setDamage(5);
	setDefense(5);
	setRange(5);
	setType('r');
    }

    public Rumba(int x, int y){//used in Map class
	setName("Machine guns");
	setLevel(1);
	setHealth(100);
	setDamage(5);
	setDefense(5);
	setRange(5);
        setType('r');
	super.setXpos(x);
	setYpos(y);
    }

    public void skill(int n){}
}
