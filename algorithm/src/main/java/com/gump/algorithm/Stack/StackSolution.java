package com.gump.algorithm.Stack;

import java.util.Stack;

/**
 * @Description: java 栈操作
 * @Author gumpLiu
 * @Date 2021-04-23
 * @Version V1.0
 **/
public class StackSolution {
    /** 用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型。 **/
    Stack<Integer> stack1 = new Stack<Integer>();
    Stack<Integer> stack2 = new Stack<Integer>();

    public void push(int node) {
        stack1.push(node);
    }

    public int pop() {
        if(stack2.empty()){
            while (!stack1.empty()){
                stack2.push(stack1.pop());
            }
        }
        return stack2.pop();
    }
}
