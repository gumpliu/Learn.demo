package com.gump.algorithm.sort;

/**
 * @Description: 归并排序：数组一分两半，每一半排序完成后，在进行合并
 *
 * @Author gumpLiu
 * @Date 2020-10-13
 * @Version V1.0
 **/
public class MergeSort_LSP {

    public static void main(String[] args) {
        int[] data = { 2, 1, 5, 3, 11, 10, 9, 9, 10 };

        System.out.println("排序前的数组：");
        print(data);
        System.out.println("-----------------------------------------");

        sort(data, 0, data.length - 1);
        System.out.println("排序后的数组：");
        print(data);
        sort_(data);
        System.out.println("排序后的数组：");
        print(data);
    }

    /**
     * 非递归 归并排序
     *
     * @param arr 排序数组
     */
    public static void mergeSort(int[] arr){
        // { 2, 1, 5, 3, 11, 10, 9, 9, 10 };

    }

    /**
     * 非递归方式归并排序
     * @param num 排序数组
     */
    public static void sort_(int[] arr){
        // 从 1开始分割，与递归不同的是，递归由数组长度一分为二最后到1，
        // 而非递归则是从1开始扩大二倍直到数组长度
        int len = 1;

        while (arr.length > len) {
            // 完全二叉树一层内的遍历，控制间隔大小
            for (int i = 0; i + len <= arr.length - 1; i += len * 2) {
                int left = i;
                int mid = i + len - 1;
                int right = i + len * 2 - 1;

                // 防止超出数组长度
                if (right > arr.length - 1)
                    right = arr.length - 1;

                // 合并排序相同
                merge(arr, left, mid, right);
            }

            // 下一层
            len *= 2;
        }

    }

    /**
     * 递归方式归并排序
     * @param num 排序数组
     * @param left 左坐标
     * @param right 右坐标
     */
    public static void sort(int[] num, int left, int right){
        //为什么会是left>=right呢，而不是left>rigth，因为相等时表示有一个元素，如果rigth-left=1时，表示有两个元素
        if(left >= right) return;
        //中间位置，把数组分了两半
        int mid = left + (right - left)/2;
        //左数组
        sort(num, left, mid);
        //右数组
        sort(num, mid + 1, right);
        //最后合并
        merge(num, left, mid, right);
    }

    /**
     * 合并，即数组中left->mid，mid->right的数已经排好顺序。
     *      把lef->mid,mid->rigth排好的顺序扩大到left->rigth
     * @param num
     * @param left
     * @param mid
     * @param right
     */
    public static void merge(int[] num, int left, int mid, int right){

        /**
         * 因为是对数组排序，不能在对数组进行扩充。
         * 需使用额外空间保存排序的数据，在同步到num[]数组中
         **/
        if(left >= right) return;

        //定义临时数组，数组大小为right - left + 1
        int[]temp = new int[right - left + 1];
        //定义三个指针
        int leftPointer = left;//左边数组开始坐标
        int rightPinter = mid + 1;//右边数组开始坐标
        int tempPinter = 0;//新数组开始坐标

        while (leftPointer <= mid && rightPinter <=right)
            temp[tempPinter++] = num[leftPointer]< num[rightPinter]? num[leftPointer++] : num[rightPinter++];

        while (leftPointer <= mid)
            temp[tempPinter++] = num[leftPointer++];

        while (rightPinter <= right)
            temp[tempPinter++] = num[rightPinter++];

        for(int i = 0; i < temp.length; i++){
            num[left++] = temp[i];
        }
//        print(num);
    }


    public static void print(int[] data) {
        for (int i = 0; i < data.length; i++) {
            System.out.print(data[i] + "\t");
        }
        System.out.println();
    }
}
