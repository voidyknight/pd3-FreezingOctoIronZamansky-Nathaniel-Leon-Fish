public class Zamansky extends Player{

  public Zamansky(){
    setSwag(100.0);
    setHealth(100.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(4);
    setDamage(100/6);
    setDefense(1.1);
    setRange(5);
    setName("Mr. Baldy");
    setPhrase("I like pancakes");
  }
  
  public Zamansky(int x, int y){
    setSwag(100.0);
    setHealth(100.0);
    setSwagRegenSpeed(4);
    setHealthRegenSpeed(4);
    setDamage(100/6);
    setDefense(1.1);
    setRange(3);
    setName("Mr. Baldy");
    setPhrase("I like pancakes");
    
    setXpos(x);
    setYpos(y);
  }
}
