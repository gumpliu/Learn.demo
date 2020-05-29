package com.gump.algorithm.dynamic;

/**
 * @Description: 切割钢条动态算法，自低向上
 * @Author gumpLiu
 * @Date 2020-05-29
 * @Version V1.0
 **/
public class CuttingSteelBottomUp {


    public static void main(String [] args){
        //切割公式max(Pi+R(n-i))，R(n-i)表示n-i最大价值，i为切割位置
        int [] p = {1,5, 8, 9, 10, 17, 17, 20, 24, 30};

       System.out.println(bottomUpCutSteel(p));
    }

    /**
     * 切割
     * @param n 总长度
     * @param p 切割价格表
     * @return 返回价格
     */
    public static int bottomUpCutSteel(int[] p){

        int [] memorandum = new int[p.length + 1];
        //记录切割位置
        int [] cunt = new int[p.length];


        memorandum[0] = 0;

        for(int i = 0; i< p.length; i++){
            int q = -1;

            for(int j = 0; j <= i; j++){

                int tmp = p[j] + memorandum[i - j];

                if(q < tmp){
                    q = tmp;
                    cunt[i] = j+1;
                }
            }

            memorandum[i + 1] = q;

        }
        return memorandum[p.length];
    }

}
