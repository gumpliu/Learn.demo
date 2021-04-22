package com.gump.algorithm.array;

/**
 * 二维数组，查找指定值
 *
 * @author gumpliu
 * @create 2021-04-22 21:59
 */
public class ArrayFind {

  public static void main(String [] args){

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

}
