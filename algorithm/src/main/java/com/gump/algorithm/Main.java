package com.gump.algorithm;

import java.util.*;
public class Main {
	//直接求解可以通过60%
	public static void main(String[] args)
	{
		Scanner in=new Scanner(System.in);
		int roomNum=in.nextInt();
		int[] visitedNum=new int[roomNum];
		int[] transferDoor=new int[roomNum];
		for(int i=0;i<roomNum;i++)
		{
			transferDoor[i]=in.nextInt()-1;
		}
		int movingCount=0;//移动次数

		//从第一个房间开始 第一个房间已经过问过一次
		visitedNum[0]=0;
		int roomID=0;
		while(roomID!=roomNum)
		{
			visitedNum[roomID]+=1;
			movingCount++;
			if(visitedNum[roomID]%2==0)
			{
				roomID+=1;
			}
			else
			{
				roomID=transferDoor[roomID];
			}
		}
		System.out.println(movingCount%1000000007);
	}
}