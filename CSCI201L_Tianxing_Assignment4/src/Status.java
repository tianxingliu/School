
public class Status {
	private int health;
	private int attack;
	private int defense;
	private int speed;
	public Status(int health, int attack, int defense, int speed){
		this.health = health;
		this.attack = attack;
		this.defense = defense;
		this.speed = speed;
	}
	public int getHealth() {
		return health;
	}
	public int getAttack() {
		return attack;
	}
	public int getDefense() {
		return defense;
	}
	public int getSpeed() {
		return speed;
	}
	public void setHealth(int health) {
		this.health = health;
	}
}
