import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.Semaphore;

public class LaundryThread extends Thread{
	private static Semaphore onLoad = new Semaphore(1);
	private static Semaphore onSmall = new Semaphore(5);
	private static Semaphore onMedium = new Semaphore(3);
	private static Semaphore onLarge = new Semaphore(2);
	private int num;
	private String size;
	private DateTimeFormatter dtf;
	public long difference;
	public LocalDateTime start;
	public LaundryThread(int num, String size) {
		this.num = num;
		this.size = size;
		dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	}
	public void run() {
		LocalDateTime before = null;
		try {
			onLoad.acquire();
			before = LocalDateTime.now();
			this.start = before;
			System.out.println(dtf.format(before) + " Starting order " + num);
			Thread.sleep(1000);
		} catch(InterruptedException ie) {
			System.out.println("MyThread.run IE: " + ie.getMessage());
		} finally {
			onLoad.release();
			if(size.equals("Small")) {
				try {
					onSmall.acquire();
					Thread.sleep(2000);
				}catch(InterruptedException ie) {
					System.out.println("MyThread.run IE: " + ie.getMessage());
				} finally {
					onSmall.release();
				}
			}
			else if(size.equals("Medium")) {
				try {
					onMedium.acquire();
					Thread.sleep(3000);
				}catch(InterruptedException ie) {
					System.out.println("MyThread.run IE: " + ie.getMessage());
				} finally {
					onMedium.release();
				}
			}
			else if(size.equals("Large")) {
				try {
					onLarge.acquire();
					Thread.sleep(5000);
				}catch(InterruptedException ie) {
					System.out.println("MyThread.run IE: " + ie.getMessage());
				} finally {
					onLarge.release();
				}
			}
			LocalDateTime after = LocalDateTime.now();
			System.out.println(dtf.format(after) + " Ending order " + num);
			difference = Duration.between(before, after).toMillis();
		}
	}
}
