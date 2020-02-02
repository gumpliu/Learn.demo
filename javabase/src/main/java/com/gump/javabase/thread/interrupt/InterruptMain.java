package com.gump.javabase.thread.interrupt;

/**
 * @program: Learn.demo
 * @description: interrupt 测试
 * @author: gumpliu
 * @create: 2019-04-24 14:26
 **/
public class InterruptMain {

    public static void main(String []args){

        Thread thread = new Thread(new InterruptThread());

        thread.start();

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        /**
         * 当线程执行了interrupt(),标记为true ，表示线程已中断，但不代表线程立即终止，线程状态可能为terminate runnable
         */
        thread.interrupt();

        while (true){
            if(thread.isInterrupted()){
                try {
                    thread.sleep(200);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                System.out.println("|||||||||||||||||| thread status is " + thread.getState().name());
                thread.interrupt();
                break;
            }
        }

    }


}

class InterruptThread implements Runnable {


    @Override
    public void run() {
        while (true){
            if(Thread.currentThread().isInterrupted()){
                break;
            }
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            System.out.println("<<<<<<< thread status is " + Thread.currentThread().getState().name());
        }

        System.out.println(">>>>> thread status is " + Thread.currentThread().getState().name());
    
    }
}
