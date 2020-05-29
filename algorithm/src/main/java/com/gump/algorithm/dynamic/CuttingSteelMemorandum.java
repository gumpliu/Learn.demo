package com.gump.algorithm.dynamic;

/**
 * @Description: 切割钢条动态算法，备忘录，自顶向下
 * @Author gumpLiu
 * @Date 2020-05-29
 * @Version V1.0
 **/
public class CuttingSteelMemorandum {


    public static void main(String [] args){
        //切割公式max(Pi+R(n-i))，R(n-i)表示n-i最大价值
        int [] p = {1,5, 8, 9, 10, 17, 17, 20, 24, 30};

        int [] memorandum = new int[p.length];
        

       System.out.println(cutSteel(p.length, p, memorandum));
    }

    /**
     * 切割
     * @param n 总长度
     * @param p 切割价格表
     * @return 返回价格
     */
    public static int cutSteel(int n, int[] p, int[] memorandum){

        if(n == 0){ return 0; }

        if(memorandum[n-1] > 0){
            return memorandum[n-1];
        }

        int q = -1;

        for(int i = 0; i< n; i++){

            int tmp = p[i] + cutSteel(n - i - 1, p, memorandum);

            if(q < tmp){
                q = tmp;
            }
        }
        memorandum[n-1] = q;

        return q;
    }

}
