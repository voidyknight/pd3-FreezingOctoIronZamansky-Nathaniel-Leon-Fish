import java.io.*;
import java.util.*;

public class Map{
    private String[][] map;
    private int h,w;
    final private String me = "p";
    final private String path = " ";
    final private String wall = "#";
    final private String virus = "v";
    final private String rumba = "r";
    final private String zamansky = "z";
    public ArrayList<monster>;
    
    public Map(String filename){
      map = new String[50][80];
	    h=0;
	    w=0;
  	  try{
       FileInputStream fstream=new FileInputStream(filename);
	  	 DataInputStream in = new DataInputStream(fstream);
       while (in.available()!=0){
			  String line = in.readLine();
			  if (w==0){
			    w = line.length();
			  }
			  for (int i=0;i<line.length();i++){
				  map[i][h]=line.charAt(i);
			  }
			  h++;
		   }
		  in.close();
	    }
	    catch (Exception e)
	    {
		  System.err.println("File Input Error");
	    }
    }
    
    
    public public String toString(){
     String s = "[0;0H";
     int i,j;
	   for (i=0;i<h;i++){
		   for (j=0;j<w;j++){
			   s = s + map[j][i];
		    }
       s = s + "\n";
	    }
	   return s;
    }
    
    public String get(int x, int y){
      return map[y][x];
    }
    
    //getMonster(int x, int y)
    //returns monster at this location or null if no monster[w arraylist]
    
    public Monster getMonster(int x, int y){
     //will do this later;
    
    }
    
