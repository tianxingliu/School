import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.Vector;

public class Game {
	private Vector<ServerThread> players;
	private String roomName;
	private BufferedReader br;
	private PrintWriter pw;
	private GameRoom gr;
	public Game(String roomName) {
		this.roomName = roomName;
	}
	public String getName() {
		return roomName;
	}
	
}
