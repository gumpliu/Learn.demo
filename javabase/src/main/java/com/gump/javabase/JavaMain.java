package com.gump.javabase;

import java.math.BigDecimal;
import java.util.HashMap;
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
//	private static final int COUNT_BITS = Integer.SIZE - 3;
//	private static final int CAPACITY   = (1 << COUNT_BITS) - 1;
//
//	static final ReentrantLock lock = new ReentrantLock(false);
//
//	static final Condition notEmpty = lock.newCondition();
//	static final Condition notFull =  lock.newCondition();
//
//
//	private static final Object object = new Object();
//
//	// runState is stored in the high-order bits
//	private static final int RUNNING    = -1 << COUNT_BITS;
//	private static final int SHUTDOWN   =  0 << COUNT_BITS;
//	private static final int STOP       =  1 << COUNT_BITS;
//	private static final int TIDYING    =  2 << COUNT_BITS;
//	private static final int TERMINATED =  3 << COUNT_BITS;
//
//	private static int workerCountOf(int c)  { return c & ~CAPACITY; }
//
//
//	public static int x;

  public static void main(String[]args){
//  	System.out.println(CAPACITY);
//  	System.out.println(Integer.toBinaryString(~CAPACITY));
//	  System.out.println(Integer.toBinaryString(3));
//
//	  System.out.println(workerCountOf(3));

//	  Thread thread1 = new Thread(new Runnable() {
//		  @Override
//		  public void run() {
//
//			  lock.lock();
//			  try {
//					System.out.println(Thread.currentThread().getName());
//					try {
//						notEmpty.await();
//						System.out.println("11111");
//					}catch (InterruptedException e) {
//						e.printStackTrace();
//					}
//				}finally {
//				  System.out.println("55555");
//				  lock.unlock();
//			  }
//		  }
//	  });
//
//	  thread1.start();
//	  System.out.println("22222");
//
//	  try {
//		  Thread.sleep(100);
//		  System.out.println("33333");
//
//	  } catch (InterruptedException e) {
//		  e.printStackTrace();
//	  }
//
//	  lock.lock();
//	  try {
//		  System.out.println("44444");
//		  notEmpty.signal();
//
//	  }finally {
//		  System.out.println("66666");
//		  lock.unlock();
//	  }
//
//	  System.out.println(Thread.currentThread().getName());


//	  Properties maps =  System.getProperties();
//	  System.out.println(maps.toString());
//	  System.out.println("-------------------------");
//
//	  System.out.println(System.getenv().toString());

//	  int h = 107465;
//
//	  System.out.println(Integer.toBinaryString(h));
//
//	  System.out.println(Integer.toBinaryString(h >>> 16));


//		  int busyTime = 10;
//		  int idleTime = busyTime;
//
//		  while(true){
//			  long startTime = System.currentTimeMillis();
//			  //busy loop:
//			  while((System.currentTimeMillis()-startTime)<=busyTime)
//				  ;
//			  try {
//				  Thread.sleep(idleTime);
//			  } catch (InterruptedException e) {
//				  e.printStackTrace();
//			  }
//		  }

//	  System.out.println((Integer.numberOfLeadingZeros(16) | 1 << 15) << 16 );
//	  System.out.println(Integer.toBinaryString(Integer.numberOfLeadingZeros(16)));
//
//	  System.out.println(Integer.toBinaryString(1 << 15));
//
//	  System.out.println(Integer.toBinaryString((Integer.numberOfLeadingZeros(16) | 1 << 15)));
//
//	  System.out.println(Integer.toBinaryString((Integer.numberOfLeadingZeros(16) | 1 << 15) << 16));
//
//
//	  System.out.println(Integer.toBinaryString(((Integer.numberOfLeadingZeros(16) | 1 << 15) << 16) >>> 16));
//	  System.out.println(Integer.toBinaryString(((Integer.numberOfLeadingZeros(16) | 1 << 15) << 16) >> 18));
//
//
//	  System.out.println(Integer.toBinaryString((1 << 16)  >> 16));
//	  System.out.println(Integer.toBinaryString((1 << 16)  >>> 16));
//	  System.out.println(Integer.toBinaryString((-1 << 29) | 0 ));
//
//	  System.out.println(Integer.toBinaryString(((-1 << 29) | 0)& (~((1<<29)-1))));
//	  System.out.println(Integer.toBinaryString(((1<<29)-1)));
//
//	  System.out.println(Integer.toBinaryString(~((1<<29)-1)));
//
//
//	  System.out.println(Integer.toBinaryString((1 << 15)));
//




//	  HashMap<String,String> map = new HashMap<String, String>();
//
//	  map.put("lsp", "lsp");
//	  0100 0000 0000 0000


//	  double doubl = 0.3;
//
//	  double d1 = 0.1;
//
//	  BigDecimal decimal = new BigDecimal(0.1);
//
//
//	  System.out.println(doubl - d1);
//	  System.out.println(decimal); 1 10 100 101 110 111

	  int num = 6;
	  int num2 = 7;
	  int num3 = 3;
	  int num4 = 6;
	  int num5 = 3;
	  int num6 = 7;
	  int num7 = 6;
	  int num8 = 7;

	 int nums =  num^num2^num3^num4^num5^num6^num7^num8;
	 System.out.println(nums);


  }

	/*
	 * 按权展开法
	 */
	public static double BinToTen1(String binary) {
		//查找该二进制是否存在小数点
		int index = binary.indexOf('.');
		//转化成的十进制
		double ten = 0;
		//整数部分
		double integer = 0;
		//小数部分
		double decimal = 0;
		//index等于-1，说明没有小数部分
		if(index == -1) {
			for(int i = 0; i < binary.length(); i++) {
				//48为字符'0'对应的ASCII值；
				//ten += (binary.charAt(i) - 48) * Math.pow(2, -(i-(binary.length() - 1)));
				//或者可以将字符转化为字符串，再由字符串转化为数字
				ten += Integer.parseInt(String.valueOf(binary.charAt(i))) * Math.pow(2, -(i-(binary.length() - 1)));
			}
		} else {
			//计算整数部分
			for(int i = 0; i < index; i++) {
				integer += Integer.parseInt(String.valueOf(binary.charAt(i))) * Math.pow(2, -(i-(index - 1)));
			}
			//计算小数部分
			for(int j = index + 1; j < binary.length(); j++) {
				decimal += Integer.parseInt(String.valueOf(binary.charAt(j))) * Math.pow(2, (index - j));
			}
			ten = integer + decimal;
		}
		return ten;

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

