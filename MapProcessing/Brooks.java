public class Brooks extends Player{

  public Brooks(){
    setSwag(100.0);
    setHealth(150.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(6);
    setDamage(100/6);
    setDefense(5);
    setRange(1);
    setName("Santa Clause");
    setPhrase("HoHoHo");
  }
  
  public Brooks(int x, int y){
    setSwag(100.0);
    setHealth(150.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(6);
    setDamage(100/6);
    setDefense(5);
    setRange(1);
    setName("Santa Clause");
    setPhrase("HoHoHo");
    
    setXpos(x);
    setYpos(y);
  }
  
}
