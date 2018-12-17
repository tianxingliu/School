import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ServerThread extends Thread{
	private BufferedReader br;
	private PrintWriter pw;
	private GameRoom cr;
	public ServerThread(Socket s, GameRoom cr){
		this.cr = cr;
		try {
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			pw = new PrintWriter(s.getOutputStream());
			this.start();
		}catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage());
		}
	}
	public void sendMessage(String message) {
		pw.println(message);
		pw.flush();
	}
	public void run() {
		try {
			while(true) {
				String line = br.readLine();
				cr.sendRoomName(pw, line);
			}
		} catch (IOException ioe) {
			System.out.println("Client disconnected");
		}
		
	}
}