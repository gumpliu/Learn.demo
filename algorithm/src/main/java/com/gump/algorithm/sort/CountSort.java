package com.gump.algorithm.sort;

/**
 * @Description: 计数排序  排序是稳定的
 *               经常作用于基数排序的一个子过程
 * @Author gumpLiu
 * @Date 2020-05-20
 * @Version V1.0
 **/
public class CountSort {
    public static void main(String[]args){
        //排序的数组
        int a[]={100,93,97,92,96,99,92,70,93,97,90,94,92,95};
        int b[]=countSort(a);
        for(int i:b){
            System.out.println(i+"");
        }
        System.out.println();
    }
    public static int[] countSort(int[]a){
        int b[] = new int[a.length];
        int max = a[0],min = a[0];
        //获取a[]最大、最小值
        for(int i:a){
            if(i>max){
                max=i;
            }
            if(i<min){
                min=i;
            }
        }//这里k的大小是要排序的数组中，元素大小的极值差+1
        int k=max-min+1;
        int c[]=new int[k];
        //c[]记录，a[]元素出现的次数，存放位置为a[i]-min差值。
        for(int i=0;i<a.length;++i){
            c[a[i]-min]+=1;//优化过的地方，减小了数组c的大小
        }
        for(int i=1;i<c.length;++i){
            c[i]=c[i]+c[i-1];
        }
        for(int i=a.length-1;i>=0;--i){
            //取出一个元素，c[a[i]-min]减一
            b[--c[a[i]-min]]=a[i];//按存取的方式取出c的元素
        }
        return b;
    }
}
