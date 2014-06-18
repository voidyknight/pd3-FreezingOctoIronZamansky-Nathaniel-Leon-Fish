public class Brown extends Player{

  public Brown(){
    setSwag(150.0);
    setHealth(100.0);
    setSwagRegenSpeed(6);
    setHealthRegenSpeed(4);
    setDamage(100/6);
    setDefense(1.1);
    setRange(3);
    setName("Mistear Schwager");
    setPhrase("Wassssssssssup");
  }
  
  public Brown(int x, int y){
    setSwag(150.0);
    setHealth(100.0);
    setSwagRegenSpeed(6);
    setHealthRegenSpeed(4);
    setDamage(100/6);
    setDefense(1.1);
    setRange(1);
    setName("Mistear Schwager");
    setPhrase("Wassssssssssup");
    
    setXpos(x);
    setYpos(y);
  }
}
