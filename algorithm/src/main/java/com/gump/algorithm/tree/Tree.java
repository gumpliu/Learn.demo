package com.gump.algorithm.tree;

import java.util.Arrays;

/**
 * 树相关算法
 */
public class Tree {


    public static void main(String[] args){
        int[] pre = {1,2,4,7,3,5,6,8};

        int[] in = {4,7,2,1,5,3,8,6};

        reConstructBinaryTree(pre, in);
    }

  /**
   * 根据前，中序列 构建二叉树
   *
   * 前序{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}
   *        1   2,4,7  4,7,2,     ,5,3,8,6
   *
   *
   * @param pre，前序列
   * @param in，中序列
   *          以递归方式实现
   * @return
   */
  public static TreeNode reConstructBinaryTree(int [] pre , int [] in) {
      if(pre.length <=0 || in.length <=0) return null;

      int rootNum = pre[0];
      TreeNode rootTree = new TreeNode(pre[0]);

      for(int i = 0; i < in.length; i++){
          if(in[i] == rootNum ) {
              rootTree.left = reConstructBinaryTree(Arrays.copyOfRange(pre, 1, i+1), Arrays.copyOfRange(in, 0, i));
              rootTree.right = reConstructBinaryTree(Arrays.copyOfRange(pre, i + 1, pre.length), Arrays.copyOfRange(in, i+1, in.length));
              break;
          }
      }
      return rootTree;
  }

    /**
     * 非递归
     * @param pre
     * @param in
     * @return
     */
  public static TreeNode reConstructBinaryTree1(int [] pre , int [] in) {
        if(pre.length <=0 || in.length <=0) return null;

        int rootNum = pre[0];
        TreeNode rootTree = new TreeNode(pre[0]);

        for(int i = 0; i < in.length; i++){
            if(in[i] == rootNum ) {

                break;
            }
        }
        return rootTree;
    }




}

class TreeNode {
      int val;
      TreeNode left;
      TreeNode right;
      TreeNode(int x) { val = x; }
  }