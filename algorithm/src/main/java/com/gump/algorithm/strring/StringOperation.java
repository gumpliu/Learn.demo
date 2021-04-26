package com.gump.algorithm.strring;

/**
 * @Description: 字符串操作
 * @Author gumpLiu
 * @Date 2021-04-26
 * @Version V1.0
 **/
public class StringOperation {

    public static void main(String[] args) {
        solve("abcd");
    }

    /**
     * 反转字符串
     * @param str string字符串
     * @return string字符串
     */
    public static String solve (String str) {
        // write code here
        if(str == null || str.equals("")) return "";

        char [] chars = str.toCharArray();

        for(int i = 0; i< chars.length/2; i++){
            swap(i, chars.length - 1 - i, chars);
        }
        return new String(chars);
    }

    public static void swap(int i, int j, char[] num){
        char c = num[i];
        char num_j = num[j];
        num[j] = c;
        num[i] = num_j;
    }

}
