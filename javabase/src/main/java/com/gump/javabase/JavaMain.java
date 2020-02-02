package com.gump.javabase;

import java.util.Map;
import java.util.Properties;

/**
 * @program: Learn.demo
 * @description: Main 类
 * @author: gumpliu
 * @create: 2019-04-24 14:23
 **/
public class JavaMain {
	
	public static int x;

  public static void main(String[]args){
//	  Scanner sc = new Scanner(System.in);
//	   int n = sc.nextInt();
//	   int[] datas = new int[n];
//	   int[] max = new int[n];
//	   int result = 0;
//	   for(int i=0;i<n;i++){
//		   datas[i] = sc.nextInt();
//		   max[i] = 1;
//	   }
//	   for(int i=0;i<n;i++){
//		   for(int j=0;j<i;j++){
//			   if(datas[j]<=datas[i]){
//				   max[i] = max(max[i],max[j]+1);
//			   }
//		   }
//		   result = max(result,max[i]);
//	   }
//	   System.out.print(result);
//	  test:
//		  for(;;) {
//			 if(true) {
//				 System.out.println("ddd");
//				 Task task = new Task();
//				 task.run();
//
//				 continue test;
//			 }
//		  }

	  Properties maps =  System.getProperties();
	  System.out.println(maps.toString());
	  System.out.println("-------------------------");

	  System.out.println(System.getenv().toString());


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

