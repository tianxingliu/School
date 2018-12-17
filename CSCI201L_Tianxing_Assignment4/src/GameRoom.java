import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;
import java.util.Vector;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

public class GameRoom {
	private int port;
	private Vector<ServerThread> serverThreads;
	private Brawlers pokeArray;
	private Vector<Game> room;
	public GameRoom(int port, Brawlers poke) {
		this.port = port;
		this.serverThreads = new Vector<ServerThread>();
		this.pokeArray = poke;
	}
	public void sendMessage(PrintWriter pw, String message){
		pw.println(message);
		pw.flush();//***flush the buffer so that the OS will send the message immediately instead of waiting for the buffer got filled***
	}
	
	public void sendRoomName(PrintWriter pw, String roomName) {
		System.out.println("Success!");
		pw.println(roomName);
		pw.flush();
		for(int i=0;i<room.size();i++) {
			if(room.get(i).getName() == roomName) {
				//send the error message
				break;
			}
		}
		Game newGame = new Game(roomName);
		room.add(newGame);		
	}
	public void startGameRoom(){
		ServerSocket ss = null;
		try {
			ss = new ServerSocket(port);
			System.out.println("Successfully bound to port " + port);
			
			while(true) {
				Socket s = ss.accept(); //blocking call: the program will wait until the line
				System.out.println("Connection from " + s.getInetAddress());
				ServerThread st = new ServerThread(s, this);
				serverThreads.add(st);
			}
		}catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage()); 
		} finally {
			try {
				if(ss != null) {
					ss.close();
				}
			} catch (IOException ioe) {
				System.out.println("ioe closing stuff: " + ioe.getMessage());
			}
		}
	}
	
	public static void main(String [] args) {
		System.out.println("Please enter a valid file: ");
		Scanner scan = new Scanner(System.in);
		Gson gson = new Gson();
		String name = scan.next();
		Brawlers pokemonArray = null;
		try {
			FileReader reader = new FileReader(name);
			pokemonArray = gson.fromJson(reader, Brawlers.class);
		} catch (FileNotFoundException fnfe) {
			System.out.println(fnfe.getMessage()); //remember to change the text
		} catch (JsonSyntaxException jse) {
			System.out.println(jse.getMessage());
		}
		System.out.println("Please enter a valid port: ");
		int port = scan.nextInt();
		GameRoom cr = new GameRoom(port, pokemonArray);
		cr.startGameRoom();
	}
}