import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

public class Test {
	public static void main(String[] args) {
		System.out.println("Please enter a valid file: ");
		Scanner scan = new Scanner(System.in);
		String name = scan.next();
		Gson gson = new Gson();
		while(name == null) {
			System.out.println("Please enter a valid file: ");
			name = scan.next();
		}
		try {
			FileReader reader = new FileReader(name);
			Brawlers pokemonArray = gson.fromJson(reader, Brawlers.class);
			System.out.println(pokemonArray.size());
			List<Pokemon> pokemon = pokemonArray.getPokemon();
			for(int i=0;i < pokemon.size(); i++) {
				System.out.println(pokemon.get(i).getName());
				System.out.println(pokemon.get(i).getType());
				System.out.println(pokemon.get(i).getStatus().getHealth());
				System.out.println(pokemon.get(i).getStatus().getAttack());
				System.out.println(pokemon.get(i).getStatus().getDefense());
				System.out.println(pokemon.get(i).getStatus().getSpeed());
				for(int j=0;j < pokemon.get(i).getAbilities().length; j++) {
					System.out.println(pokemon.get(i).getAbilities()[j].getAbilityName());
					System.out.println(pokemon.get(i).getAbilities()[j].getAbilityType());
					System.out.println(pokemon.get(i).getAbilities()[j].getAbilityDamage());
				}
			}
		}
		catch (FileNotFoundException fnfe) {
			System.out.println(fnfe.getMessage()); //remember to change the text
			
		}
		catch (JsonSyntaxException jse) {
			System.out.println(jse.getMessage());
			
		}
	}
	
	public static void brawl(Brawlers array1) { //how to write it in a multi-threaded fashion
		System.out.println("Choose 3 Brawlers: ");
		for(int i=0;i<array1.size();i++) {
			System.out.println(array1.getPokemon().get(i).getName());
		}
		Scanner scan = new Scanner(System.in);
		int index1 = 0, index2 = 0, index3 = 0;
		boolean valid = false;
		while(!valid) {
			index1 = scan.nextInt();
			index2 = scan.nextInt();
			index3 = scan.nextInt();
			if((index1 < 0 || index1 > array1.size()) || (index2 < 0 || index2 > array1.size()) || (index3 < 0 || index3 > array1.size()) ) {
				System.out.println("Invalid! ");
				for(int i=0;i<array1.size();i++) {
					System.out.println(array1.getPokemon().get(i).getName());
				}
			}
			else valid = true;
		}
		System.out.println("Excellent! ");
		System.out.println("You send " + array1.getPokemon().get(index1 - 1).getName());
	}
	
	
	public int damage(Pokemon attacker, Ability attack, Pokemon defender) {
		String type = attack.getAbilityType();
		int power = attack.getAbilityDamage();
		int attack_stat = attacker.getStatus().getAttack();
		int defense_stat = defender.getStatus().getDefense();
		String defense_type = defender.getType();
		double multiplier = 0.0;
		if(type == "fire") {
			if(defense_type == "air") {
				multiplier = 2.0;
			}
			else if (defense_type == "water"){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type == "earth") {
			if(defense_type == "lightning") {
				multiplier = 2.0;
			}
			else if (defense_type == "air"){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type == "water") {
			if(defense_type == "fire") {
				multiplier = 2.0;
			}
			else if (defense_type == "lightning"){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type == "air") {
			if(defense_type == "earth") {
				multiplier = 2.0;
			}
			else if (defense_type == "fire"){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		else if (type == "lightning") {
			if(defense_type == "water") {
				multiplier = 2.0;
			}
			else if (defense_type == "earth"){
				multiplier = 0.5;
			}
			else {
				multiplier = 1.0;
			}
		}
		int damage = (int) (((attack_stat*(power/defense_stat))/5)* multiplier);
		if(damage > defender.getStatus().getHealth()) {
			damage = defender.getStatus().getHealth();
		}
		return damage;
	}
}