package com.gump.algorithm.array;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * 二维数组，查找指定值
 *
 * @author gumpliu
 * @create 2021-04-22 21:59
 */
public class ArrayFind {

  public static void main(String [] args){
    int [] num = {2,3,4};
    System.out.println(maxLength(num));
  }

  /**
   * 查找指定值是否存在，左上角最小，右下角最大
   * @param target
   * @param array
   * @return
   */
  public boolean Find(int target, int [][] array) {
    //m为行，n为列
    int maxM = array.length;//最大行数
    if(maxM == 0) return false;
    int n = array[0].length;//最大列数
    int m = 0; n = n -1;//数组越界
    while (m < maxM && n >= 0){
      if(target > array[m][n]){
        ++m;
      }else if(target < array[m][n]){
        --n;
      }else {
        return true;
      }
    }
    return false;
  }

  /**
   * 给定一个数组，找出其中最小的K个数。例如数组元素是4,5,1,6,2,7,3,8这8个数字，
   * 则最小的4个数字是1,2,3,4。如果K>数组的长度，那么返回一个空的数组
   *
   * topk 小问题
   *
   * @param input
   * @param k
   * @return
   */
  public List<Integer> GetLeastNumbers_Solution(int [] input, int k) {

    int[] dun = Arrays.copyOfRange(input, 0, k);

    //构建堆
    buildHead(dun);
    for(int i = k; i<input.length; i++){
//      if(dun[0] > ){}
    }



    //主要在于排序，使用快排
    return Collections.emptyList();
  }

  public void reBuildHead(int[] num, int target){

  }

  public void buildHead(int [] num){
    //堆从低向上处理
    for(int i = num.length/2; i <=0; i--){
      int left = 2 * i;
      if(left > num.length) continue;

      int right = left + 1;
      int _swap = left;
      if(right <= num.length){
        if(num[left] > num[right]){
          _swap = right;
        }
      }
      if(num[i] > num[right]){
        swap(i, left, num);
      }
    }
  }

  /**
   * 给定一个数组arr，返回arr的最长无的重复子串的长度(无重复指的是所有数字都不相同)。
   * 输入 [2,3,4,5]，输出 4
   * @param arr int整型一维数组 the array
   * @return int整型
   */
  public static int maxLength (int[] arr) {
    int left = 0;
    int max = 0;
    for(int i = 1; i < arr.length; i++){
      //二次比较，看看当前arr[i]是否在left-i中
      boolean isCom = false;
      for(int j = left; j < i; j++){
        if(arr[j] == arr[i]){
          left = j + 1;
          isCom = true;
        }
      }
      int cMax = isCom ? i - left : i - left + 1;
      max = cMax > max? cMax: max;
    }
    return max;
  }


  public void swap(int i, int j, int[] num){
    int c = num[i];
    int num_j = num[j];
    num[j] = c;
    num[i] = num_j;
  }

}
