package com.gump.algorithm.dynamic;

import java.lang.reflect.Method;

/**
 * @Description: 切割钢条动态算法
 * @Author gumpLiu
 * @Date 2020-05-29
 * @Version V1.0
 **/
public class CuttingSteel {



    public static void main(String [] args){
        //切割公式max(Pi+R(n-i))，R(n-i)表示n-i最大价值
//        //todo 动态规划 切割公式 dp[n] = max(Pi + dp(n-i))
//        int [] p = {1,5, 8, 9, 10, 17, 17, 20, 24, 30};
//
//        int[]dp = new int[10];
//
//        for(int i = 0; i< dp.length; i++){
//            if(i == 0) dp[i] = p[i];
//            else dp[i] = Integer.MIN_VALUE;
//        }
//
//       System.out.println(cutSteel(p.length - 1, p , dp));

//        Method[] methods = CuttingSteel.class.getMethods();
//        for(Method method : methods){
//            System.out.println(method.getGenericReturnType());
//        }
        System.out.println( Integer.toBinaryString(1 >> 5 -1 ));

        System.out.println( Integer.toBinaryString(-1 >>> (31 - 21) >>> 5));

        System.out.println( Integer.toBinaryString(-1 >>> (31 - 21) >>> 5 << 5));

        System.out.println( Integer.toBinaryString(~(-1 >>> (31 - 21) >>> 5 << 5)));

        System.out.println( Integer.toBinaryString(19));

        System.out.println( Integer.toBinaryString(19 & (~(-1 >>> (31 - 21) >>> 5 << 5))));


    }

    /**
     * 位运算。
     * 通过掩码运算，把 N 的二进制表示中的 i~j 位置变为0，然后把 M 移动到其中。
     * 时间、空间复杂度O(1)
     */
    public int insertBits(int N, int M, int i, int j) {
        int mask = -1 >>> (31 - j) >>> i << i;// 运算结果为 ...000000111111100...
        return N & ~mask | (M << i);
    }

    public int reverseBits(int num) {
        String str = Integer.toBinaryString(num);

        char[] nums = str.toCharArray();
        Integer[] lens = new Integer[nums.length];
        for(int i = 0; i< nums.length; i++){
            if(nums[i] == '1'){
                lens[i] = lens[i - 1] + 1;
            }else{

            }
        }




        return 0;
    }


    /**
     * 自顶向下 切割
     * @param n 总长度
     * @param p 切割价格表
     * @return 返回价格
     */
    public static int cutSteel(int n, int[] p, int[] dp){

        if(n >= 0 && dp[n] >=0) return dp[n];

        if(n <= 0){ return 0; }
        int res = 0;
        for(int i = 0; i<= n; i++){
            //todo 自顶向下
            res= Math.max(res, p[i] + cutSteel(n - i - 1,  p, dp));
        }
        dp[n] = res;

        return dp[n];
    }

}
