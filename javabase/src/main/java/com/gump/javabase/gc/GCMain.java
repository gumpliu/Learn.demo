package com.gump.javabase.gc;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: Learn.demo
 * @description: gc 测试
 * @author: gumpliu
 * @create: 2019-04-24 16:55
 **/
public class GCMain{

    /**
     * 代码栈中存在List对象的引用list和GCModel对象的引用o。
     * 在For循环中，我们不断的生成新的对象，然后将其添加到List对象中，之后将GCModel引用置空。
     * 问题是当GCModel引用被置空后，如果发生 GC，我们创建的GCModel对象是否能够被 GC 回收呢？答案是否定的。
     * GC 在跟踪代码栈中的引用时，会发现list引用，而继续往下跟踪，就会发现 list 引用指向的内存空间中又存在指向 GCModel 对象的引用。
     * 也就是说尽管GCModel 引用已经被置空，但是GCModel对象仍然存在其他的引用，是可以被访问到的，所以 GC 无法将其释放掉。如果在此循环之后，
     * GCModel对象对程序已经没有任何作用，那么我们就认为此 Java 程序发生了内存泄漏。
     */

    static List<GCModel> list = new ArrayList<GCModel>();

    public static void main(String []args){

        for (int i = 1; i<100; i++)
        {
            GCModel o = new GCModel("" + i);
            list.add(o);
            o = null;
        }
        System.gc();

        for(Object o : list){
            System.out.println(o);
        }

    }

}

class GCModel{
    String str;

    public GCModel(String str){
        this.str = str;
    }

    public String getStr(){
        return str;
    }

    @Override
    public String toString() {
        return str;
    }
}
