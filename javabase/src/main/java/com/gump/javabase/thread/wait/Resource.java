package com.gump.javabase.thread.wait;

/**
 * 资源类
 * @author Huxudong
 * @createTime 2020-04-01 21:57:39
 **/
public class Resource {
    /** 产品数 */
    private  int product = 0;

    /** 进货 */
    public synchronized void get() {
        //这里只能使用while不能使用if ,这里会发生虚假唤醒
        while (product >= 10) {
            System.out.println(Thread.currentThread().getName()+":"+"产品已满!");
            /** 当商品已经满的时候，进货线程挂起 */
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        /** 进货 */
        System.out.println(Thread.currentThread().getName()+":"+ ++product);
        /** 唤醒其他线程 */
        this.notifyAll();
        
    }

    /** 售货 */
    public synchronized void sale() {
        //这里只能使用while不能使用if ,这里会发生虚假唤醒
        while(product <= 0) {
            System.out.println(Thread.currentThread().getName()+":"+"产品已空");
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        /** 售货 */
        System.out.println(Thread.currentThread().getName()+":"+ --product);
        /** 唤醒其他线程 */
        this.notify();
    }
}