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

  public static void main(String[] args) {
    List<ListNode> listNodes = new ArrayList<>();
  }

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

  public ListNode mergeKLists(ArrayList<ListNode> lists) {
    if(lists == null || lists.size() == 0) return null;
    //
    while (lists.size() > 1){
      ListNode node1 = lists.get(lists.size() - 1);
      ListNode node2 = lists.get(lists.size() - 2);
      lists.remove(lists.size() - 1);
      lists.remove(lists.size() - 2);

      ListNode meger = mergeKLists(node1, node2);
      lists.add(lists.size() - 1, meger);
    }


    return lists.get(0);
  }

  public ListNode mergeKLists(ListNode node1, ListNode node2) {

    if(node1 == null) return node2;
    if (node2 == null) return node1;

     ListNode heard = new ListNode();

    while (node1 != null && node2 != null){
      if(node1.num >= node2.num){
        ListNode next = node2.next;
        node2.next = null;
        heard.next = node2;
        heard = node2;
        node2 = next;
      }else{
        ListNode next = node1.next;
        node1.next = null;
        heard.next = node1;
        heard = node1;
        node1 = next;
      }
    }

    if(node1 != null){
      heard.next = node1;
    }
    if (node2 != null){
      heard.next = node2;
    }

    return heard.next;
  }


}


class ListNode{
  public   int num;
  public ListNode next;

  public ListNode(){
  }


  public ListNode(int num){
    this.num = num;
  }
}