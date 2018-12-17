
public class Pokemon {
	private String name;
	private String type;
	private Status stats;
	private Ability[] abilities;
	Pokemon(String name, String type, int health, int attack, int defense, int speed, Ability[] abilities){
		this.name = name;
		this.type = type;
		this.stats = new Status(health, attack, defense, speed);
		this.abilities = abilities;
	}
	public String getName(){
		return name;
	}
	public String getType() {
		return type;
	}
	public Status getStatus() {
		return stats;
	}
	public Ability[] getAbilities(){
		return abilities;
	}
}
