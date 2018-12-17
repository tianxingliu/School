import java.io.FileNotFoundException;
import java.io.FileReader;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

public class Laundry{
	public static void main(String[] args) {
		Gson gson = new Gson();
		Loads theLaundryLoads = null;
		String name = "";
		Scanner scan = new Scanner(System.in);
		while(true) {
			System.out.println("Please enter a valid file: ");
			name = scan.next();
			try {
				FileReader reader = new FileReader(name);
				theLaundryLoads = gson.fromJson(reader, Loads.class);
			} catch (FileNotFoundException fnfe) {
				System.out.println(fnfe.getMessage()); //remember to change the text
			} catch (JsonSyntaxException jse) {
				System.out.println(jse.getMessage());
			} finally {
				if(theLaundryLoads != null) break;
			}
		}
		String[] laundryLoads = theLaundryLoads.getLoads();
		LaundryThread[] lts = new LaundryThread[laundryLoads.length];
		ExecutorService executors = Executors.newCachedThreadPool();
		for(int i=0; i<laundryLoads.length; i++) {
			LaundryThread lt = new LaundryThread(i, laundryLoads[i]);
			lts[i] = lt;
		}
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime before = LocalDateTime.now();
		for(int i=0; i<laundryLoads.length; i++) {
			try {
				Thread.sleep(1000);
				executors.execute(lts[i]);
			} catch (InterruptedException e) {2··
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			}
		}
		executors.shutdown(); // no more threads can be added to the thread pool
		while(!executors.isTerminated()) {
			Thread.yield();
		}
		before = lts[0].start;
		LocalDateTime after = LocalDateTime.now();
		System.out.println("Order Processing Began At " + dtf.format(before));
		for(int i=0; i<laundryLoads.length; i++) {
			System.out.println("Order " + i + " takes " + lts[i].difference/1000.0 + " seconds to complete. ");
		}
		System.out.println("Order Processing Concluded At " + dtf.format(after));
		System.out.println("Execution took " + Duration.between(before, after).toMillis()/1000.0 + " seconds. ");
	}
}
