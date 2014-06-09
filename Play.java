import cs1.Keyboard;
public class Play(){
    private Player p1;

    public Play(){
	choosePlayer();
    }

    public void choosePlayer(){
	System.out.println("Mr.Zamansky has greater attack range. Mr.Brooks has greater health." + 
	"Mr. Brown has extra swag, ang his swag regenerates more quickly. Mr. K deals extra damage. Who will you choose?");
	boolean done = false;
	String response;
	while(!done){
	    response = Keyboard.readWord();
	    if(response == null)
		System.out.println("Invalid input. Valid inputs are:" + 
				   " \"Mr.Zamansky\", \"Mr.Brooks\","+
				   " \"Mr.Brown\", or \"Mr.K\".");
	    else if(response.toUpperCase().equals("MR.ZAMANSKY")){
		done = true;
		p1 = new Zamansky();
	    }
	    else if(response.toUpperCase().equals("MR.BROWN")){
		done = true;
		p1 = new Brown();
	    }
	    else if(response.toUpperCase().equals("MR.BROOKS")){
		done = true;
		p1 = new Brooks();
	   
	    else if(response.toUpperCase().equals("MR.K")){
		done = true;
		p1 = new K();
	    }
	    else
		System.out.println("Invalid input. Valid inputs are:" + 
				   " \"Mr.Zamansky\", \"Mr.Brooks\","+
				   " \"Mr.Brown\", or \"Mr.K\".");
	}
    }
        public void Playersmove(){
        s = Keyboard.readWord();
        s = s.toUpperCase;
        System.out.println("Where would you like to move?")
        if (s == null){
        	System.out.println("Invalid input. Valid inputs are up, down, left or right");
        }
        else if (s.equals("UP")){
            P1.setYpos(P1.getYpos() + 1);
        }
        else if (s.equals("RIGHT")){
            P1.setXpos(P1.getXpos() + 1);
        }
        else if (s.eqauls("DOWN")){
            P1.setYpos(P1.getYpos() - 1);
        }
        else if( s.equals("LEFT")){
            P1.setXpos(P1.getXpos() - 1);
        }
        else
        System.out.println("Invalid input. Valid inputs are up, down, left or right");
    }





}
