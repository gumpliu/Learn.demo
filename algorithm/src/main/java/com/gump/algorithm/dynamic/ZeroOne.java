package com.gump.algorithm.dynamic;

/**
 * @Description: TODO
 * @Author gumpLiu
 * @Date 2021-01-01
 * @Version V1.0
 **/
public class ZeroOne {


    public static void main(String[] args) {
        //strs = ["10",  "0", "1"], m = 5, n = 3

        String [] str = {"10",  "0", "1"};
        System.out.println(findMaxForm(str, 1, 1));

        System.out.println(findMaxForm1(str, 1, 1));

    }


    public static int findMaxForm1(String[] strs, int m, int n){
        //状态：i表示0的个数，j表示1的个数 dp[i][j] =
        //
        return 0;
    }

    public static int findMaxForm(String[] strs, int m, int n) {
        int[][] dp = new int[m + 1][n + 1];
        for (String s: strs) {
            int[] count = countzeroesones(s);
            for (int zeroes = m; zeroes >= count[0]; zeroes--)
                for (int ones = n; ones >= count[1]; ones--)
                    dp[zeroes][ones] = Math.max(1 + dp[zeroes - count[0]][ones - count[1]], dp[zeroes][ones]);
        }
        return dp[m][n];
    }
    public static int[] countzeroesones(String s) {
        int[] c = new int[2];
        for (int i = 0; i < s.length(); i++) {
            c[s.charAt(i)-'0']++;
        }
        return c;
    }
}
