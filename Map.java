import java.io.*;
import java.util.*;

public class Map{
    private String[][] map;
    private int h,w,m;//m=number of monsters in given map;
    final private String me = "p";
    final private String path = " ";
    final private String wall = "#";
    final private String virus = "v";
    final private String rumba = "r";
    final private String zamansky = "z";
    public ArrayList<Monster> monsters;

    /*public static void main (String[] args) throws IOException{//test
	Map m = new Map("Map1.dat");
	System.out.println(m.toString());

	}*/
    
    public Map(String filename) throws IOException{
	map = new String[200][200];
	monsters = new ArrayList<Monster>();
	h=0;
	w=0;
	m=0;
	//try{
	    FileInputStream fstream = new FileInputStream(filename);
	    BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
	    String line;;
	    while((line = br.readLine()) != null) {
		//System.out.println(line);
		if (w==0){
		    w = line.length();
		}
		for (int i=0;i<line.length();i++){
		    map[i][h]=Character.toString(line.charAt(i));
		    if ((map[i][h].equals("v"))){
			m++;
			monsters.add(new Virus(m, h, i));
		    }
		    if ((map[i][h].equals("r"))){
			m++;
			monsters.add(new Rumba(m, h, i));
		    }
		    if ((map[i][h].equals("z"))){
			m++;
			monsters.add(new FreezingOctoIronZamansky(m, h, i));
		    }
		}
		h++;
	    }
	    br.close();
	    //}
    /*catch (Exception e)
	    {
		System.err.println("File Input Error");
		}*/
    }
    
    
    public String toString(){
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
    
    
    public Monster getMonster(int x, int y){
	for (Monster m : monsters){
	    if (m.getXpos()==x && m.getYpos()==y){
	        return m;
	    }
	}
        return null;
    }

}
    
