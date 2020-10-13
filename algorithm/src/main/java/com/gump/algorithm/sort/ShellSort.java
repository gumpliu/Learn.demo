package com.gump.algorithm.sort;

/**
 * @Description: 希尔排序（缩小增量排序，跳跃式）
 *               希尔排序是把大序列分组为小序列（插入排序），实现基本排序后进行排序（插入排序）
 * @Author gumpLiu
 * @Date 2020-10-13
 * @Version V1.0
 **/
public class ShellSort {

    public static void main(String []args){
        int[] num = {8,3,9,10,29,23};
        sort(num);
        for(int value : num){
            System.out.println(value);
        }
    }

    public static void sort(int [] num){
        int section = num.length/2;
        int j;
        int temp;
        while (section >=1){
            for(int i = section; i < num.length; i++){
                temp = num[i];
                j = i - section;
                while (j >=0 && num[j] > temp){
                    num[j + section] = num[j];
                    j = j - section;
                }
                num[j + section] = temp;
            }
            section /=2;
        }
    }
}
