public class PQueue{
  private ArrayList<Cell> queue = new ArrayList<Cell>();
  private Cell target;
  
  public PQueue(Cell target){
    queue = new ArrayList<Cell>();
    this.target = target;
  }
  
  public int compare(Cell x, Cell y){
    return (Math.abs(x.getX() - t.getX() + x.getY() - t.getY()) - Math.abs(y.getX() - t.getX() + y.getY() - t.getY()));
  }
  
  public void insert(Cell a){
    for(int x = 0; x < queue.size(); x ++){
       if(compare(a, queue.get(x), target) <= 0)
         queue.add(x, a);
      if(x == queue.size() - 1)
         queue.add(x);
    }
  }
  
  public Cell get(){
   if(queue.size() == 0)
     return null;
   Cell a = queue.get(0);
   queue.remove(0);
   return a;
  }

}
