package com.gump.javabase.nio;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;

/**
 * 
 * pipe 测试
 * 
 * @author YSS
 *
 */

public class PipeMain {

	public static void main(String[] args) {
		try {
			Pipe pipe=Pipe.open();
			//建立缓冲区
			ByteBuffer buffer=ByteBuffer.allocate(1024);
			buffer.put(("管道连接通讯").getBytes());
			buffer.flip();
			//写入管道
			Pipe.SinkChannel sinkChannel=pipe.sink();
			sinkChannel.write(buffer);
			
			//直接从管道读取
			Pipe.SourceChannel sourceChannel=pipe.source();
			buffer.flip();
			int let=sourceChannel.read(buffer);
			System.out.println(new String(buffer.array(),0,let));
			sourceChannel.close();
			sinkChannel.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
