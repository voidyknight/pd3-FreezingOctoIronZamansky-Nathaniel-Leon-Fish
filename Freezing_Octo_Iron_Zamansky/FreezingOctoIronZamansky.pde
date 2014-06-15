public class FreezingOctoIronZamansky extends Monster{

    public FreezingOctoIronZamansky(){
	super.setName("1337");
	super.setLevel(2);
	super.setHealth(200);
	super.setDamage(25);
	super.setDefense(25);
	super.setRange(7);
    }

    public FreezingOctoIronZamansky(int x, int y){
	super.setName("1337");
	super.setLevel(2);
	super.setHealth(200);
	super.setDamage(25);
	super.setDefense(25);
	super.setRange(7);

	super.setXpos(x);
	super.setYpos(y);
    }
    
  public void summonMinions(){
  }

  public void skill(int n){}

}
