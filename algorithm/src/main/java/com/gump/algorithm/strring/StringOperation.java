package com.gump.algorithm.strring;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

/**
 * @Description: 字符串操作
 * @Author gumpLiu
 * @Date 2021-04-26
 * @Version V1.0
 **/
public class StringOperation {

    public static void main(String[] args) {
//        [1,2,4,4,5],4
        int[] num = {-2,-2,-2};
        search(num, -2);
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


    /**
     * 给出一个仅包含字符'(',')','{','}','['和']',的字符串，判断给出的字符串是否是合法的括号序列
     * 括号必须以正确的顺序关闭，"()"和"()[]{}"都是合法的括号序列，但"(]"和"([)]"不合法。
     * @param s string字符串
     * @return bool布尔型
     */
    public static boolean isValid (String s) {
        char[] chars = s.toCharArray();
        Stack stack = new Stack();
        for(char c : chars){
            switch (c){
                case '(' :
                case '{' :
                case '[' :
                    stack.push(c);
                    break;
                case ')' :
                     if(stack.empty()) return false;
                     if(!stack.pop().equals('(')){
                         return false;
                     }
                    break;
                case '}' :
                    if(stack.empty()) return false;
                    if(!stack.pop().equals('{')){
                        return false;
                    }
                    break;
                case ']' :
                    if(stack.empty()) return false;
                    if(!stack.pop().equals('[')){
                        return false;
                    }
                    break;
                default:
                    return false;
            }

        }
        return stack.empty();
    }


    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 请实现有重复数字的升序数组的二分查找
     * 给定一个 元素有序的（升序）整型数组 nums 和一个目标值 target  ，
     * 写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1
     *
     * 如果目标值存在返回下标，否则返回 -1
     * @param nums int整型一维数组
     * @param target int整型
     * @return int整型
     */
    public static int search (int[] nums, int target) {
        // write code here
        if(nums == null || nums.length == 0) return -1;


        int start = 0;
        int end = nums.length;
        int index = -1;
        while (start <= end){
            int mod = (end + start)/2;
            if(nums[mod] == target){
                index = mod;
                break;
            }else if(nums[mod] > target){
                end = mod - 1;
            }else if(nums[mod] < target){
                start = mod + 1;
            }
        }

        if(index == -1) return -1;

        for(int i = index - 1; i>=0; i--){
            if(nums[i] == target){
                --index;
            }else {
                return i + 1;
            }

        }

        return index;
    }


    public static void swap(int i, int j, char[] num){
        char c = num[i];
        char num_j = num[j];
        num[j] = c;
        num[i] = num_j;
    }

}
