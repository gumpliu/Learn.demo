package com.gump.algorithm.linked;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 链表操作
 *
 * @author gumpliu
 * @create 2021-04-22 22:15
 */
public class LinkedList {

  public List<Integer> printListFromTailToHead(ListNode listNode) {

    if(listNode == null) return Collections.emptyList();

    List<Integer> list = new ArrayList<>();
    while (listNode != null){
      list.add(0, listNode.num);
      listNode = listNode.next;
    }

    return list;

  }

  /**
   * 输入一个链表，反转链表后，输出新链表的表头。
   * @param head
   * @return
   */
  public ListNode ReverseList(ListNode head){
    ListNode pre = null;
    ListNode cur = head;
    ListNode next = null;

    while (cur != null){
      //下一个节点
      next = cur.next;
      //转指针
      cur.next = pre;
      pre = cur;
      cur = next;
    }
    return pre;
  }
}


class ListNode{
  public   int num;
  public ListNode next;

  public ListNode(int num){
    this.num = num;
  }
}