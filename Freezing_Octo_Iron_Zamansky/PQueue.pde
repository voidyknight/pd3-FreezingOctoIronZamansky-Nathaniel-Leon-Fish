import java.util.*;
public class PQueue{
  private ArrayList<Cell> queue = new ArrayList<Cell>();
  private Cell target;
  
  public PQueue(Cell target){
    queue = new ArrayList<Cell>();
    this.target = target;
  }
  
  public float compare(Cell x, Cell y){
    return (Math.abs(x.getX() - target.getX() + x.getY() - target.getY()) - Math.abs(y.getX() - target.getX() + y.getY() - target.getY()));
  }
  
  public void insert(Cell a){
    if(queue.size() == 0){
      queue.add(a);
      return;
    }
    for(int x = 0; x < queue.size(); x ++){
       if(compare(a, queue.get(x)) <= 0.0){
         queue.add(x, a);
         return;
       }
      if(x == queue.size() - 1)
         queue.add(a);
    }
  }
  
  public void setTarget(Cell t){target=t;}
  
  public Cell get(){
   if(queue.size() == 0)
     return null;
   Cell a = queue.get(0);
   queue.remove(0);
   return a;
  }
  
  public boolean hasCell(Cell a){
     return queue.contains(a);
  }
  

  public Cell peek(){
    if(queue.size() > 0) return queue.get(0);
    return null;
  }

  

}

