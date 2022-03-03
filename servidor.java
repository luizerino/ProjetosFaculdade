import java.io.*;
import java.net.*;

class server{
	public static void main (String[] args)
	try{
		SeverSocket ss = new SeverScoket(1201);
		socket s = ss.accept();
		
		DataInputStream din = new DataInputStream (s.gitInputStream());
		DataOutputStream dout = new DataOutputStream(s.getOutputStream());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String msgin="",msgout="";
		while(!msgin.equals("end")){
			msgin = din.readUTF();
			System.out.println(msgin);
			msgout = br.readLine();
			dout.writeUTF(msgout);
			dout.flush();
		}
		s.close();
	}
	catch(Exception e){
		
	}
	
}