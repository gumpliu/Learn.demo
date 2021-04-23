package com.gump.algorithm.jumpfloor;

/**
 * @Description:
 * 一只青蛙一次可以跳上1级台阶，也可以跳上2级。
 * 求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
 * @Author gumpLiu
 * @Date 2021-04-23
 * @Version V1.0
 **/
public class JumpFloor {

    public static void main(String[] args) {

    }

    public static int jumpFloor(int target){
            if(target == 0){
                return 0;
            }

            int a = 1; int b = 0; int c;
            for(int i = 1; i <= target; i++){
                c = a;
                a = a + b;
                b = c;
            }
            return a;
        }

}
