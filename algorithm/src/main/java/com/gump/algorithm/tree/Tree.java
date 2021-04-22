package com.gump.algorithm.tree;

/**
 * 树相关算法
 */
public class Tree {

  /**
   * 根据前，中序列 构建二叉树
   * @param pre，前序列
   * @param in，中序列
   * @return
   */
  public TreeNode reConstructBinaryTree(int [] pre , int [] in) {
    TreeNode root = new TreeNode(pre[0]);
    return root;
  }

}

class TreeNode {
      int val;
      TreeNode left;
      TreeNode right;
      TreeNode(int x) { val = x; }
  }