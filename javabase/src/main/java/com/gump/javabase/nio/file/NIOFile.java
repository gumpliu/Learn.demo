package com.gump.javabase.nio.file;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Scanner;

public class NIOFile {

	public static void splitFile(String filePath, int fileCount) throws IOException {
	    FileInputStream fis = new FileInputStream(filePath);
	    FileChannel inputChannel = fis.getChannel();
	    final long fileSize = inputChannel.size();
	    long average = fileSize / fileCount;//平均值
	    long bufferSize = 1024 * 1024 * 100; //缓存块大小，自行调整
	    ByteBuffer byteBuffer = ByteBuffer.allocate(Integer.valueOf(bufferSize + "")); // 申请一个缓存区
	    long startPosition = 0; //子文件开始位置
	    long endPosition = average < bufferSize ? 0 : average - bufferSize;//子文件结束位置
	    for (int i = 0; i < fileCount; i++) {
	        if (i + 1 != fileCount) {
	            int read = inputChannel.read(byteBuffer, endPosition);// 读取数据
	            readW:
	            while (read != -1) {
	                byteBuffer.flip();//切换读模式
	                byte[] array = byteBuffer.array();
	                for (int j = 0; j < array.length; j++) {
	                    byte b = array[j];
	                    if (b == 10 || b == 13) { //判断\n\r
	                        endPosition += j;
	                        break readW;
	                    }
	                }
	                endPosition += bufferSize;
	                byteBuffer.clear(); //重置缓存块指针
	                read = inputChannel.read(byteBuffer, endPosition);
	            }
	        }else{
	            endPosition = fileSize; //最后一个文件直接指向文件末尾
	        }

	        FileOutputStream fos = new FileOutputStream(filePath + (i + 1));
	        FileChannel outputChannel = fos.getChannel();
		    long startTime = System.currentTimeMillis();

	        System.out.println("fileName="+ filePath + (i + 1));
	        inputChannel.transferTo(startPosition, endPosition - startPosition, outputChannel);//通道传输文件数据
		    System.out.println("耗费时间： " + (System.currentTimeMillis() - startTime) + " ms");

	        outputChannel.close();
	        fos.close();
	        startPosition = endPosition + 1;
	        endPosition += average;
	    }
	    inputChannel.close();
	    fis.close();

	}

	public static void main(String[] args) throws Exception {
	    Scanner scanner = new Scanner(System.in);
	    scanner.nextLine();
	    long startTime = System.currentTimeMillis();
	    splitFile("D:/sofa_workspace-forwindows64.20190225.zip",105);
	    long endTime = System.currentTimeMillis();
	    System.out.println("耗费时间： " + (endTime - startTime) + " ms");
	    scanner.nextLine();
	}
}
