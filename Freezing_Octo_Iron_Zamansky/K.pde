public class K extends Player{

  public K(){
    setSwag(100.0);
    setHealth(100.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(4);
    setDamage(25);
    setDefense(1.1);
    setRange(3);
    setName("Son of Konstantin");
    setPhrase("Learn To D&D N00B");
  }
  
  public K(int x, int y){
    setSwag(100.0);
    setHealth(100.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(4);
    setDamage(25);
    setDefense(1.1);
    setRange(1);
    setName("Son of Konstantin");
    setPhrase("Learn To D&D N00B");
    
    setXpos(x);
    setYpos(y);
  }
  
}
