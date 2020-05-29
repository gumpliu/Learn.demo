package com.gump.algorithm.dynamic;

/**
 * @Description: 切割钢条动态算法
 * @Author gumpLiu
 * @Date 2020-05-29
 * @Version V1.0
 **/
public class CuttingSteel {


    public static void main(String [] args){
        //切割公式max(Pi+R(n-i))，R(n-i)表示n-i最大价值
        int [] p = {1,5, 8, 9, 10, 17, 17, 20, 24, 30};

       System.out.println(cutSteel(p.length, p));
    }

    /**
     * 切割
     * @param n 总长度
     * @param p 切割价格表
     * @return 返回价格
     */
    public static int cutSteel(int n, int[] p){
        if(n == 0){ return 0; }

        int q = -1;

        for(int i = 0; i< n; i++){

            int tmp = p[i] + cutSteel(n - i - 1, p);

            if(q < tmp){
                q = tmp;
            }
        }
        return q;
    }

}
