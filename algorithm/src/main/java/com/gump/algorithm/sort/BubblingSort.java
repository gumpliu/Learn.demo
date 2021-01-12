package com.gump.algorithm.sort;

/**
 * @Description: 冒泡排序，交换排序
 *               冒泡原理：从第一个数开始，相邻的两个数相互比较，
 *                       如果第一个比第二个数字大，交换，如果比第二个小。不交换。
 *                       交换与不交换指针都需要加1。
 *                       继续拿交换后大的数字与相邻的比较，以此类推。
 *
 * @Author gumpLiu
 * @Date 2020-10-12
 * @Version V1.0
 **/
public class BubblingSort {

    public static void main(String []args){
        int[] num = {1,100, 130, 140, 150, 120, 5};
//        sort1(num);
//        sort2(num);
//        sort3(num);
        bubbingOptimizeSort(num);
        for(int value : num){
            System.out.print(value + "\t");
        }
    }

    public static void bubbingOptimizeSort(int [] num){
        /**
         * 两边开始，一头从最小，一头从最大
         */
        for(int j = num.length - 1,i = 1; j >= i; j--,i++){
            findMax(num, j);
            findMin(num, i);
        }

    }


    public static void bubblingSort(int [] num){
        /**
         * j的作用是确定内部循环最大数值，内部循环确定好数值后数值放在最后位置,j减一
         * 依次循环，知道j>0。顺序排完
         */
        for(int j = num.length - 1; j > 0; j--){
            findMax(num, j);
        }
    }

    /**
     * 寻找0->maxPointer 最大值并存放在maxPointer位置上
     *
     * @param arr 操作数组
     * @param maxPointer 最大数组索引
     */
    public static void findMax(int[] arr, int maxPointer){
        /**
         * 内部循环每次都从0开始，确定一个数后减一，由外部循环赋值控制
         * i<num.length-1，如果是num.length，在i+1时会数组越界
         * **/
        for(int i = 0; i < maxPointer; i++){
            if(arr[i] > arr[i + 1]){
                swap(arr, i, i+1);
            }
        }
    }

    /**
     * 寻找0->minPointer 最小值并存放在minPointer位置上
     * @param arr
     * @param minPointer 最小数组索引
     */
    public static void findMin(int[] arr, int minPointer){
        for(int i = minPointer; i < arr.length; i++){
            if(arr[i] < arr[i - 1]){
                swap(arr, i, i-1);
            }
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
