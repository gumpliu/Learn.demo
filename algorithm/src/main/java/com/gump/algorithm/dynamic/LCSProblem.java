package com.gump.algorithm.dynamic;

/**
 * 最长公共子序列
 */
public class LCSProblem {
    public static void main(String[] args) {
        String[] x = {"","D", "A", "B", "C"};
        String[] y = {"","B", "D", "A", "D", "C", "B","D","C"};
        int[][] b = getLength(x, y);
        Display(b, x, x.length - 1, y.length - 1);
    }

    public static int[][] getLength(String[] x, String[] y) {
        //过程返回表B，指向表c[][]时所选择的子问题最优解
        int[][] b = new int[x.length][y.length];
        //c[][]保存了X和Y的LCS的长度。
        int[][] c = new int[x.length][y.length];
        for (int i = 1; i < x.length; i++) {
            for (int j = 1; j < y.length; j++) {
                if (x[i] == y[j]) {
                    c[i][j] = c[i - 1][j - 1] + 1;
                    b[i][j] = 1;
                } else if (c[i - 1][j] >= c[i][j - 1]) {
                    c[i][j] = c[i - 1][j];
                    b[i][j] = 0;
                } else {
                    c[i][j] = c[i][j - 1];
                    b[i][j] = -1;
                }
            }
        }
        return b;
    }

    public static void Display(int[][] b, String[] x, int i, int j) {
        if (i == 0 || j == 0) {
            return;
        }
        if (b[i][j] == 1) {
            Display(b, x, i - 1, j - 1);
            System.out.print(x[i] + " ");
        } else if (b[i][j] == 0) {
            Display(b, x, i - 1, j);
        } else if (b[i][j] == -1) {
            Display(b, x, i, j - 1);
        }
    }
}