package com.gump.javabase.semaphore;

public class MainTest {

	
	public static void main(String[] args) {
		
		if(test1() && test2()) {
			System.out.println("main");
		}
		
		if(test1() || test2()) {
			System.out.println("main");
		}
		
	}
	
	public static boolean test1() {
		System.out.println("test1");
		return false;
	}
	
	public static boolean test2() {
		System.out.println("test2");
		return false;
	}
	
}
