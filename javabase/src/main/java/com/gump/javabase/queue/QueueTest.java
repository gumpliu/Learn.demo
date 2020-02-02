package com.gump.javabase.queue;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

public class QueueTest {
	
	
	public static void main(String [] args) {
		
		ArrayBlockingQueue<String> queue = new ArrayBlockingQueue<String>(100);
		
		queue.add("lsp");
		queue.add("sxl");
		
		try {
//			System.out.println(queue.take());

			System.out.println(queue.poll(10000, TimeUnit.SECONDS));
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	

}
