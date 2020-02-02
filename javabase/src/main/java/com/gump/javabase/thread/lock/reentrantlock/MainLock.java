package com.gump.javabase.thread.lock.reentrantlock;

import java.util.concurrent.Callable;
import java.util.concurrent.locks.ReentrantLock;

/**
 * ReentrantLock debug
 * @author YSS
 *
 */
public class MainLock {
	
	final static ReentrantLock reentrantLock = new ReentrantLock(true);
	
	static int num = 0;
	
	public static void main(String [] args) {
		
		for(int i=0;i< 10; i++) {
			Thread myThread = new Thread(new MyRunnable());
			myThread.start();
			Thread myThread1 = new Thread(new MyRunnable());
			myThread1.start();
			System.out.println(myThread1.isInterrupted());
		}

		try {
//			System.out.println(Thread.interrupted());
//			System.out.println(Thread.interrupted());
//			System.out.println(Thread.interrupted());
//			System.out.println(Thread.interrupted());
//			System.out.println(Thread.interrupted());
//			System.out.println(Thread.interrupted());
			Thread.currentThread().sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void add() {
		reentrantLock.lock();
		
		num = num + 1;
		System.out.println("num=" + num);
		
		reentrantLock.unlock();
		
	}

}
class MyRunnable implements Runnable{

	@Override
	public void run() {
		MainLock.add();
	}

	
}


