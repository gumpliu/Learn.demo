package com.gump.algorithm.dynamic;

import java.util.Arrays;

/**
 * @Description: TODO
 * @Author gumpLiu
 * @Date 2020-06-11
 * @Version V1.0
 **/
public class Test {
    public static void main(String []args){

        int[] nums = {10,9,2,5,3,7,101,18};

        System.out.println(findNumberOfLIS(nums));
    }
    public static int findNumberOfLIS(int[] nums) {

        if (nums.length == 0) {
            return 0;
        }

        int[] dp = new int[nums.length];
        int[] combination = new int[nums.length];

        Arrays.fill(dp, 1);
        Arrays.fill(combination, 1);

        int max = 1, res = 0;

        for (int i = 1; i < dp.length; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    if (dp[j] + 1 > dp[i]) { //如果+1长于当前LIS 则组合数不变
                        dp[i] = dp[j] + 1;
                        combination[i] = combination[j];
                    } else if (dp[j] + 1 == dp[i]) { //如果+1等于当前LIS 则说明找到了新组合
                        combination[i] += combination[j];
                    }
                }
            }
            max = Math.max(max, dp[i]);
        }

        for (int i = 0; i < nums.length; i++)
            if (dp[i] == max) res += combination[i];

        return res;
    }
}
