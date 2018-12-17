import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Random;
import java.util.Scanner;

import com.google.gson.Gson;

public class GameClient extends Thread {
	private String hostname;
	private int port;
	private PrintWriter pw;
	private Brawlers brawlers;
	private Socket s;
	public GameClient(String hostname, int port) {
		this.hostname = hostname;
		this.port = port;
		Gson gson = new Gson();
		FileReader reader = null;
		try {
			s = new Socket(hostname, port);
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} //make the connection to the specified hostname and port
		try {
			reader = new FileReader("Pokemon.json");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Brawlers pokemonArray = gson.fromJson(reader, Brawlers.class);
		this.brawlers = pokemonArray;
		System.out.println(pokemonArray.size());
	}
	public void sendMessage(PrintWriter pw, String message) {
		pw.println(message);
		pw.flush();
	}
	public void startGame() {
		BufferedReader br = null;
		Scanner scan = new Scanner(System.in);
		System.out.println("Please make a choice: ");
		System.out.println("1) Start Game");
		System.out.println("2) Join Game");
		String choice = scan.next();
		try {
			pw = new PrintWriter(s.getOutputStream());
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(choice.equals("1")) {
			System.out.println("What will you name your game? ");
			String name = scan.next();
			sendMessage(pw, name);
			System.out.println("How many players? ");
			System.out.println("1 or 2. ");
			int num = scan.nextInt();
			if(num == 1) {
				
			}
			else if (num == 2) {
				
			}
		}
		else if (choice.equals("2")) {
			System.out.println("What is the name of the game? ");
			String name = scan.next();
			
		}
		try {
			
			this.start(); //starts multi-threading; //non-blocking call
			while(true) {
				String line = br.readLine(); //blocking call
				System.out.println(line);
			}
		}catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage()); //if the connection is not made
		}finally {
			try {
				if (pw != null) pw.close();
				if (br != null) br.close();
				if (s != null) s.close();
			} catch (IOException ioe) {
				System.out.println("ioe closing stuff: " + ioe.getMessage());
			}
		}
	}
	public void run() { //testing single functionality
		Scanner scan = new Scanner(System.in);
		try {
			System.out.println("Choose 3 Brawlers: ");
			for(int i=0;i< brawlers.size();i++) {
				System.out.println(i+1 + ". " + brawlers.getPokemon().get(i).getName());
			}
			int index1 = 0, index2 = 0, index3 = 0;
			boolean valid = false;
			while(!valid) {
				index1 = scan.nextInt();
				index2 = scan.nextInt();
				index3 = scan.nextInt();
				if((index1 <= 0 || index1 > brawlers.size()) || (index2 <= 0 || index2 > brawlers.size()) || (index3 <= 0 || index3 > brawlers.size()) 
						|| (index1 == index2) || (index2 == index3) || (index1 == index3)) {
					System.out.println("Invalid! ");
					for(int i=0;i<brawlers.size();i++) {
						System.out.println(brawlers.getPokemon().get(i).getName());
					}
				}
				else valid = true;
			}
			index1 -= 1;
			index2 -= 1;
			index3 -= 1;
			System.out.println("Excellent! ");
			Random rand = new Random();
			int computerIndex1 = rand.nextInt(brawlers.size());
			int computerIndex2 = rand.nextInt(brawlers.size());
			while(computerIndex2 == computerIndex1) {
				computerIndex2 = rand.nextInt(brawlers.size());
			}
			int computerIndex3 = rand.nextInt(brawlers.size());
			while(computerIndex3 == computerIndex2 || computerIndex3 == computerIndex1) {
				computerIndex3 = rand.nextInt(brawlers.size());
			}
			boolean myVictory = false, computerVictory = false;
			boolean myDead = true, computerDead = true;
			int myCount = 0, computerCount = 0;
			Pokemon myPokemon = null, opponentPokemon = null;
			Pokemon[] myBrawlers = new Pokemon[3];
			Pokemon[] computerBrawlers = new Pokemon[3];
			myBrawlers[0] = new Pokemon(brawlers.getPokemon().get(index1).getName(), brawlers.getPokemon().get(index1).getType(), 
					brawlers.getPokemon().get(index1).getStatus().getHealth(), brawlers.getPokemon().get(index1).getStatus().getAttack(), 
					brawlers.getPokemon().get(index1).getStatus().getDefense(), brawlers.getPokemon().get(index1).getStatus().getSpeed(), 
					brawlers.getPokemon().get(index1).getAbilities());
			myBrawlers[1] = new Pokemon(brawlers.getPokemon().get(index2).getName(), brawlers.getPokemon().get(index2).getType(), 
					brawlers.getPokemon().get(index2).getStatus().getHealth(), brawlers.getPokemon().get(index2).getStatus().getAttack(), 
					brawlers.getPokemon().get(index2).getStatus().getDefense(), brawlers.getPokemon().get(index2).getStatus().getSpeed(), 
					brawlers.getPokemon().get(index2).getAbilities());
			myBrawlers[2] = new Pokemon(brawlers.getPokemon().get(index3).getName(), brawlers.getPokemon().get(index3).getType(), 
					brawlers.getPokemon().get(index3).getStatus().getHealth(), brawlers.getPokemon().get(index3).getStatus().getAttack(), 
					brawlers.getPokemon().get(index3).getStatus().getDefense(), brawlers.getPokemon().get(index3).getStatus().getSpeed(), 
					brawlers.getPokemon().get(index3).getAbilities());
			computerBrawlers[0] = new Pokemon(brawlers.getPokemon().get(computerIndex1).getName(), brawlers.getPokemon().get(computerIndex1).getType(), 
					brawlers.getPokemon().get(computerIndex1).getStatus().getHealth(), brawlers.getPokemon().get(computerIndex1).getStatus().getAttack(), 
					brawlers.getPokemon().get(computerIndex1).getStatus().getDefense(), brawlers.getPokemon().get(computerIndex1).getStatus().getSpeed(), 
					brawlers.getPokemon().get(computerIndex1).getAbilities());
			computerBrawlers[1] = new Pokemon(brawlers.getPokemon().get(computerIndex2).getName(), brawlers.getPokemon().get(computerIndex2).getType(), 
					brawlers.getPokemon().get(computerIndex2).getStatus().getHealth(), brawlers.getPokemon().get(computerIndex2).getStatus().getAttack(), 
					brawlers.getPokemon().get(computerIndex2).getStatus().getDefense(), brawlers.getPokemon().get(computerIndex2).getStatus().getSpeed(), 
					brawlers.getPokemon().get(computerIndex2).getAbilities());
			computerBrawlers[2] = new Pokemon(brawlers.getPokemon().get(computerIndex3).getName(), brawlers.getPokemon().get(computerIndex3).getType(), 
					brawlers.getPokemon().get(computerIndex3).getStatus().getHealth(), brawlers.getPokemon().get(computerIndex3).getStatus().getAttack(), 
					brawlers.getPokemon().get(computerIndex3).getStatus().getDefense(), brawlers.getPokemon().get(computerIndex3).getStatus().getSpeed(), 
					brawlers.getPokemon().get(computerIndex3).getAbilities());
			while (!myVictory && !computerVictory) {
				if(myDead) {
					if(myCount > 2) {
						computerVictory = true;
						break;
					}
					System.out.println("You send " + myBrawlers[myCount].getName());
					Pokemon myCurrent = myBrawlers[myCount];
					myPokemon = myCurrent;
					myDead = false;
				}
				if(computerDead) {
					if (computerCount > 2){
						myVictory = true;
						break;
					}
					System.out.println("Your opponent plays " + computerBrawlers[computerCount].getName());
					Pokemon opponentCurrent = computerBrawlers[computerCount];
					opponentPokemon = opponentCurrent;
					computerDead = false;
				}
				boolean faster;
				if(myPokemon.getStatus().getSpeed() >= opponentPokemon.getStatus().getSpeed()) { //if speed is the same, randomly choose who attacks first
					faster = true;
				}
				else faster = false;
				while(!myDead && !computerDead) {
					System.out.println("Choose a move: ");
					for(int i=0;i<myPokemon.getAbilities().length;i++) {
						System.out.println(i+1 + ". " + myPokemon.getAbilities()[i].getAbilityName());
					}
					int myAbilityChoice = scan.nextInt();
					while(myAbilityChoice <= 0 || myAbilityChoice > brawlers.size()) {
						System.out.println("Invalid ");
						myAbilityChoice = scan.nextInt();
					}
					int ComputerAbilityChoice = rand.nextInt(opponentPokemon.getAbilities().length);
					Ability myAttack = myPokemon.getAbilities()[myAbilityChoice - 1];
					Ability opponentAttack = opponentPokemon.getAbilities()[ComputerAbilityChoice];
					if(faster) {
						System.out.println("Player: " + myPokemon.getName() + " used " + myAttack.getAbilityName() + "!");
						int myDamage = damage(myPokemon, myAttack, opponentPokemon);
						System.out.println("It did " + myDamage + " damage! ");
						opponentPokemon.getStatus().setHealth(opponentPokemon.getStatus().getHealth() - myDamage);
						if(opponentPokemon.getStatus().getHealth() == 0) {
							computerDead = true;
							System.out.println("Computer: " + opponentPokemon.getName() + " was defeated! ");
							computerCount++;
						}
						else {
							System.out.println("Computer: " + opponentPokemon.getName() + " used " + opponentAttack.getAbilityName() + "!");
							int opponentDamage = damage(opponentPokemon, opponentAttack, myPokemon);
							System.out.println("It did " + opponentDamage + " damage! ");
							myPokemon.getStatus().setHealth(myPokemon.getStatus().getHealth() - opponentDamage);
							if(myPokemon.getStatus().getHealth() == 0) {
								myDead = true;
								System.out.println("Player: " + myPokemon.getName() + " was defeated! ");
								myCount++;
							}
						}
					}
					else {
						System.out.println("Computer: " + opponentPokemon.getName() + " used " + opponentAttack.getAbilityName() + "!");
						int opponentDamage = damage(opponentPokemon, opponentAttack, myPokemon);
						System.out.println("It did " + opponentDamage + " damage! ");
						myPokemon.getStatus().setHealth(myPokemon.getStatus().getHealth() - opponentDamage);
						if(myPokemon.getStatus().getHealth() == 0) {
							myDead = true;
							System.out.println("Player: " + myPokemon.getName() + " was defeated! ");
							myCount++;
						}
						else {
							System.out.println("Player: " + myPokemon.getName() + " used " + myAttack.getAbilityName() + "!");
							int myDamage = damage(myPokemon, myAttack, opponentPokemon);
							System.out.println("It did " + myDamage + " damage! ");
							opponentPokemon.getStatus().setHealth(opponentPokemon.getStatus().getHealth() - myDamage);
							if(opponentPokemon.getStatus().getHealth() == 0) {
								computerDead = true;
								System.out.println("Computer: " + opponentPokemon.getName() + " was defeated! ");
								computerCount++;
							}
						}
					}
					System.out.println("Player: " + myPokemon.getName() + " has " + myPokemon.getStatus().getHealth() + " HP. ");
				}			
			}
			if(myVictory) {
				System.out.println("You win!");
			}
			else if (computerVictory) {
				System.out.println("You lose! ");
			}
//			while(true) {
//				String line = scan.nextLine();
//				sendMessage(pw, "The Jeff: " + line);
//			}
		} finally {
			scan.close();
		}
		
	}
	public int damage(Pokemon attacker, Ability attack, Pokemon defender) { //correctly calculates the damage
		String type = attack.getAbilityType();
		int power = attack.getAbilityDamage();
		int attack_stat = attacker.getStatus().getAttack();
		int defense_stat = defender.getStatus().getDefense();
		String defense_type = defender.getType();
		double multiplier = 0.0;
		if(type.equals("fire")) {
			if(defense_type.equals("air")) {
				multiplier = 2.0;
			}
			else if (defense_type.equals("water")){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type.equals("earth")) {
			if(defense_type.equals("lightning")){
				multiplier = 2.0;
			}
			else if (defense_type.equals("air")){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type.equals("water")) {
			if(defense_type.equals("fire")){
				multiplier = 2.0;
			}
			else if (defense_type.equals("lightning")){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type.equals("air")){
			if(defense_type.equals("earth")) {
				multiplier = 2.0;
			}
			else if (defense_type.equals("fire")){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type.equals("lightning")) {
			if(defense_type.equals("water")) {
				multiplier = 2.0;
			}
			else if (defense_type.equals("earth")){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		if(multiplier == 2.0) {
			System.out.println("It was super effective! ");
		}
		else if (multiplier == 0.5) {
			System.out.println("It was not very effective...");
		}
		int damage = (int) ((((double)attack_stat*((double)power/(double)defense_stat))/5)* multiplier);
		if(damage > defender.getStatus().getHealth()) {
			damage = defender.getStatus().getHealth();
		}
		return damage;
	}

	public static void main(String [] args) {
		System.out.println("Please enter an IP address: ");
		Scanner scan = new Scanner(System.in);
		String IP_address = scan.next();
		System.out.println("Please enter a port: ");
		int port = scan.nextInt();
		GameClient cc = new GameClient(IP_address, port);
		///
		///
		cc.startGame();
	}
}