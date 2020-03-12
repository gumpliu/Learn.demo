package com.gump.javabase;

import java.util.Map;
import java.util.Properties;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @program: Learn.demo
 * @description: Main 类
 * @author: gumpliu
 * @create: 2019-04-24 14:23
 **/
public class JavaMain {
	private static final int COUNT_BITS = Integer.SIZE - 3;
	private static final int CAPACITY   = (1 << COUNT_BITS) - 1;

	static final ReentrantLock lock = new ReentrantLock(false);

	static final Condition notEmpty = lock.newCondition();
	static final Condition notFull =  lock.newCondition();


	private static final Object object = new Object();

	// runState is stored in the high-order bits
	private static final int RUNNING    = -1 << COUNT_BITS;
	private static final int SHUTDOWN   =  0 << COUNT_BITS;
	private static final int STOP       =  1 << COUNT_BITS;
	private static final int TIDYING    =  2 << COUNT_BITS;
	private static final int TERMINATED =  3 << COUNT_BITS;

	private static int workerCountOf(int c)  { return c & ~CAPACITY; }


	public static int x;

  public static void main(String[]args){
//  	System.out.println(CAPACITY);
//  	System.out.println(Integer.toBinaryString(~CAPACITY));
//	  System.out.println(Integer.toBinaryString(3));
//
//	  System.out.println(workerCountOf(3));

	  Thread thread1 = new Thread(new Runnable() {
		  @Override
		  public void run() {

			  lock.lock();
			  try {
					System.out.println(Thread.currentThread().getName());
					try {
						notEmpty.await();
						System.out.println("11111");
					}catch (InterruptedException e) {
						e.printStackTrace();
					}
				}finally {
				  System.out.println("55555");
				  lock.unlock();
			  }
		  }
	  });

	  thread1.start();
	  System.out.println("22222");

	  try {
		  Thread.sleep(100);
		  System.out.println("33333");

	  } catch (InterruptedException e) {
		  e.printStackTrace();
	  }

	  lock.lock();
	  try {
		  System.out.println("44444");
		  notEmpty.signal();

	  }finally {
		  System.out.println("66666");
		  lock.unlock();
	  }

	  System.out.println(Thread.currentThread().getName());


//	  Properties maps =  System.getProperties();
//	  System.out.println(maps.toString());
//	  System.out.println("-------------------------");
//
//	  System.out.println(System.getenv().toString());


  }
  
  static class Task implements Runnable{

	@Override
	public void run() {
		try {
			Thread.currentThread().sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("aaa");		
	}
	  
  }
  
  
  public static int max(int a,int b){
	   if(a>b){
		   return a;
	   }else{
		   return b;
	   }
  }
  
  public static int add(int num) {
	  if(num == 1 || num == 2) {
		  return num;
	  }
	  return add(num-1) + add(num - 2);
  }

}

