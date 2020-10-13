package com.gump.algorithm.sort;

/**
 * @Description: 冒泡排序，交换排序
 * @Author gumpLiu
 * @Date 2020-10-12
 * @Version V1.0
 **/
public class BubblingSort {

    public static void main(String []args){
        int[] num = {8,3,9,10,29,23};
//        sort1(num);
//        sort2(num);
        sort3(num);

        for(int value : num){
            System.out.println(value);
        }
    }



    public static void sort1(int [] num){

        for(int i = 0; i < num.length; i++){
            for(int j = i + 1; j< num.length ; j++){
                if(num[i] > num[j]){
                    swap(num, i, j);
                }
            }

        }
    }

    public static void sort2(int [] num){

        for(int i = 0; i < num.length; i++){
            for(int j = num.length - 1; j> i ; j--){
                if(num[j-1] > num[j]){
                    swap(num, j-1, j);
                }
            }
        }
    }


    public static void sort3(int [] num){
        boolean flag = true;
        for(int i = 0; i < num.length && flag; i++){
            flag = false;
            for(int j = num.length - 1; j> i ; j--){
                if(num[j-1] > num[j]){
                    swap(num, j-1, j);
                    flag = true;
                }
            }
        }
    }


    private static void swap(int[] num, int i, int j){
        int temp = num[i];
        num[i] = num[j];
        num[j] = temp;
    }

}
