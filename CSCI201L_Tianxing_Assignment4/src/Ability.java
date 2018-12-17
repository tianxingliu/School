
public class Ability {
	private String name;
	private String type;
	private int damage;
	Ability(String name, String type, int damage){
		this.name = name;
		this.type = type;
		this.damage = damage;
	}
	public String getAbilityName() {
		return name;
	}
	public String getAbilityType() {
		return type;
	}
	public int getAbilityDamage() {
		return damage;
	}
}
