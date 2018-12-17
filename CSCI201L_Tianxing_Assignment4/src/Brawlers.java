import java.io.Serializable;
import java.util.List;

public class Brawlers implements Serializable{
	private List<Pokemon> Brawlers;
	public int size() {
		return Brawlers.size();
	}
	public List<Pokemon> getPokemon(){
		return Brawlers;
	}
	
}
