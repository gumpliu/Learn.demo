package com.gump.algorithm.sort;

/**
 * 
 * 快速排序 二
 * 
 * @author YSS
 *
 */
public class QuickSortMain {
	
	
	public static void main(String[] args) {
		int[] nums = {10,23,1,4,5,89,1000};
		quickSort(nums, 0, nums.length - 1);
		for(int i = 0; i< nums.length; i++) {
			System.out.print(nums[i] + "  ");
		}
	}
	
	public static void quickSort(int[] nums,int left, int right) {
		
		int md = findMd(nums, left, right);
		if(left < right) {
			quickSort(nums, left, md-1);
			quickSort(nums, md + 1, right);
		}
	}
	
	public static int findMd(int[] nums,int left, int right) {
		/** 第一种写法 */
//		int value = nums[left];
//		while(left < right) {
//			while (left < right && nums[right] > value ) {
//				right--;
//			}
//			nums[left] = nums[right];
//			while (left < right && nums[left] < value ) {
//				left++;
//			}
//			nums[right] = nums[left];
//		}
//		nums[left] = value;
//		return left;
		/** 第二种写法 */
		int value = nums[right];
		int i = left - 1;
		if(left < right){
			for(int j = left;j < right ; j++){
				if(nums[j]<= value){
					i = i + 1;
					int jValue = nums[j];
					nums[j] = nums[i];
					nums[i] = jValue;
				}
			}
			nums[right] = nums[i + 1];
			nums[i + 1] = value;
		}
		return i + 1;
	}
}
