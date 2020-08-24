package com.gump.javabase.thread;

/**
 * @Description: 顺序打印1-100
 * @Author gumpLiu
 * @Date 2020-07-08
 * @Version V1.0
 **/
public class ThreadOrderMain {

    private volatile int flag = 1;

    private volatile int i = 0;

    private Thread thread1, thread2, thread3;


    private int number;

    public ThreadOrderMain(int number){
        this.number = number;
        thread1 = new Thread1();
        thread2 = new Thread2();
        thread3 = new Thread3();

        thread1.start();
        thread2.start();
        thread3.start();

    }


    class Thread1 extends Thread{

        @Override
        public void run() {
            while (i <= number){
                if(flag == 1){
                    System.out.println(i);
                    i++;
                    flag = 2;
                }
            }
        }
    }

    class Thread2 extends Thread{

        @Override
        public void run() {
            while (i <= number){
                if(flag == 2){
                    System.out.println(i);
                    i++;
                    flag = 3;
                }
            }
        }
    }

    class Thread3 extends Thread{

        @Override
        public void run() {
            while (i <= number){
                if(flag == 3){
                    System.out.println(i);
                    i++;
                    flag = 1;
                }
            }
        }
    }


    public static void main(String[] args) {
        ThreadOrderMain threadOrderMain  = new ThreadOrderMain(100);
    }


}
