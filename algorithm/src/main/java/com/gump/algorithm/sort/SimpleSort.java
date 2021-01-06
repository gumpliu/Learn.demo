package com.gump.algorithm.sort;

/**
 * @Description: 简单排序(选择排序)，确定交换位置后在进行数据交换
 *               与冒泡排序性能好，优点在于减少了交换次数，
 *                                    但是比较次数没有减少
 * @Author gumpLiu
 * @Date 2020-10-12
 * @Version V1.0
 **/
public class SimpleSort {

    public static void main(String [] args){
        int[] num = {8,3,9,10,29,23,1, 2,11};
        sort(num);
        for(int value : num){
            System.out.print(value + "  " );
        }
    }

    public static void sort(int[] num){

        for(int i = 0; i < num.length; i++){
            int min = i;//当前最小值坐标
            for(int j = i + 1; j < num.length; j++){
                //找到最小值 index
                if(num[min] > num[j]){
                    min = j;
                }
            }

            if(min != i){
                swap(num, i, min);
            }


        }


    }

    private static void swap(int[] num, int i, int j){
        int temp = num[i];
        num[i] = num[j];
        num[j] = temp;
    }
}
