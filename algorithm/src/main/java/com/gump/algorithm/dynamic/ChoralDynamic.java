package com.gump.algorithm.dynamic;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 题目描述
 N位同学站成一排，音乐老师要请其中的(N-K)位同学出列，使得剩下的K位同学不交换位置就能排成合唱队形。 合唱队形是指这样的一种队形：设K位同学从左到右依次编号为1, 2, …, K，他们的身高分别为T1, T2, …, TK， 则他们的身高满足T1 < T2 < … < Ti , Ti > Ti+1 > … > TK (1 <= i <= K)。 你的任务是，已知所有N位同学的身高，计算最少需要几位同学出列，可以使得剩下的同学排成合唱队形。
 输入描述:
 输入的第一行是一个整数N（2 <= N <= 100），表示同学的总数。
 第一行有n个整数，用空格分隔，第i个整数Ti（130 <= Ti <= 230）是第i位同学的身高（厘米）。
 输出描述:
 可能包括多组测试数据，对于每组数据，
 输出包括一行，这一行只包含一个整数，就是最少需要几位同学出列。
 示例1
 输入
 复制
 8
 186 186 150 200 160 130 197 220
 输出
 复制
 4
 ————————————————
 版权声明：本文为CSDN博主「东山阿强」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
 原文链接：https://blog.csdn.net/weixin_43306331/java/article/details/104382888
 */
public class ChoralDynamic {
  static int[] father;
	public static void main(String[] args) {
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			String str;
			while((str = br.readLine()) != null) {
				 int n = Integer.parseInt(str);
				 String[] parts = br.readLine().split(" ");
				 int[] nums = new int[n];
				 int[] left = new int[n];
				 int[] right = new int[n];
				 for(int i = 0; i < n; i++) {
					 nums[i] = Integer.parseInt(parts[i]);
				 }
				 for(int i = 0; i < n; i++) {
					 left[i] = 1;
					 for(int j = i-1; j >= 0; j--) {
						 if(nums[i]>nums[j]) 
							 left[i] = Math.max(left[i], left[j]+1);
					 }
				 }
				 for(int i = n-1; i >= 0; i--) {
					 right[i] = 1;
					 for(int j = i+1; j < n; j++) {
						 if(nums[i]>nums[j]) 
							 right[i] = Math.max(right[i], right[j]+1);
					 }
				 }		
				 int max = 0;
				 for(int i = 0; i < n; i++) {
					 max = Math.max(max, left[i]+right[i]-1);
				 }
				 System.out.println(n-max);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}