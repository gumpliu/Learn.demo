package com.gump.algorithm.sort;

/**
 * @Description: 插入排序
 *               原理：插入已排好的序列中，即与已排序列中元素比较，找到合适位置
 *
 *              插入排序是从第二个开始，第二个与第一个比较，如果第二个比第一个数小，
 *              把第二个插入到第一个前面，即与第一个数交互位置。
 *
 * @Author gumpLiu
 * @Date 2020-10-13
 * @Version V1.0
 **/
public class InsertSort {
    public static void main(String []args){
        int[] num = {8,3,9,10,29,23};
//        sort1(num);
//        sort2(num);
        sort1(num);

        for(int value : num){
            System.out.print(value + "\t");
        }
    }
    //交换
    public static void sort(int[] num){
        for(int i = 1; i < num.length ; i++){
            for(int j = i; j > 0 ; j--){
                if(num[j] < num[j-1]){
                    swap(num, j, j-1);
                }
            }
        }
    }

    //插入排序
    public static void sort1(int[] num){
        for(int i = 1; i < num.length ; i++){
            int compare = num[i];//带插入的值
            int j;//寻找带插入的位置
            for(j = i; j>0 && num[j-1] > compare; j--){
                num[j] = num[j-1];
            }
            if(i != j){
                num[j] = compare;
            }
        }
    }


    private static void swap(int[] num, int i, int j){
        int temp = num[i];
        num[i] = num[j];
        num[j] = temp;
    }

}
