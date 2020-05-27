package com.gump.algorithm.dynamic;

/**
 * 动态规划在矩阵链相乘的应用，目的求出最小的计算代价。
 * 主要的计算思想是递归，而且是带备忘录的递归，辅助作用。存放计算结果。
 * <p>手动定义矩阵链大小,用一个序列p表示[30 35 15 5 10 20 25]
 * A1:30X35
 * A2:35X15
 * A3:15X5
 * A4:5X10
 * A5:10x20
 * A6:20x25
 */
public class MatrixLinkedMultiply {

    public static void main(String[] args) {
        //矩阵列
        int[] p = {30, 35, 15, 5, 10, 20, 25};
        int n = p.length - 1;
        //存放计算代价
        int[][] m = new int[n][n];
        //存放分割标号k的值
        int[][] s = new int[n - 1][n];
        //链长为1的最小计算代价为0.
        for (int i = 0; i < n; i++) {
            m[i][i] = 0;
        }
        //链长从2到n遍历
        for (int L = 2; L <= n; L++) {
            //遍历的范围，逐渐缩小范围，从第一个开始。
            for (int i = 0; i < n - L + 1; i++) {
                //每次区间加1，遵从自底向上的递归形式求解。
                int j = i + L - 1;
                //初始化m[i,j]的值为无限大。
                m[i][j] = Integer.MAX_VALUE;
                for (int k = i; k <= j - 1; k++) {
                    //递归求解公式,当前乘次数
                    int q = m[i][k] + m[k + 1][j] + p[i] * p[k + 1] * p[j + 1];
                    //取最小成次数，并保存到m[i][j]
                    if (q < m[i][j]) {
                        //保存序列代价的结果
                        m[i][j] = q;
                        //保存分割点k的值
                        s[i][j] = k;
                    }
                }
            }
        }

        //输出计算代价的矩阵m，其最终结果是矩阵m[0][m.length-1]
        System.out.println("该矩阵链的最小计算次数：" + m[0][n - 1]);
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m.length; j++) {
                System.out.print(m[i][j] + "          ");
            }
            System.out.println();
        }
        //构造最优解
        MatrixLinkedMultiply.printOptimalPatterns(s, 0, n - 1);
        System.out.println();
        for (int i = 0; i < s.length; i++) {
            for (int j = 0; j < s[i].length; j++) {
                System.out.print(s[i][j] + "          ");
            }
            System.out.println();
        }

    }

    static void printOptimalPatterns(int[][] s, int i, int j) {
        if (i == j) {
            System.out.print("A" + (i + 1));//A从1开始，所以记得加1
        } else {
            System.out.print("(");
            printOptimalPatterns(s, i, s[i][j]);
            printOptimalPatterns(s, s[i][j] + 1, j);
            System.out.print(")");
        }
    }
}