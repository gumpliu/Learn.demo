package com.gump.javabase.thread.wait;

import java.util.concurrent.TimeUnit;

/**
 * 线程操作资源类，实现线程与资源类的解耦合
 * @author Huxudong
 * @createTime 2020-04-01 23:13:54
 **/
public class TestPc {
    public static void main(String[] args) {
        Resource resource = new Resource();
        new Thread(()->{
            for (int i = 0; i < 20; i++) {
                try {
                    /** 睡眠，便于观察结果 */
                    TimeUnit.SECONDS.sleep(2);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                resource.get();
            }
        },"生产者A").start();



        new Thread(()->{
            for (int i = 0; i < 20; i++) {
                resource.sale();
            }

        },"消费者C").start();

        new Thread(()->{
            for (int i = 0; i < 20; i++) {

                resource.get();
            }

        },"生产者B").start();

        new Thread(()->{
            for (int i = 0; i < 20; i++) {
                resource.sale();
            }

        },"消费者D").start();
    }
}