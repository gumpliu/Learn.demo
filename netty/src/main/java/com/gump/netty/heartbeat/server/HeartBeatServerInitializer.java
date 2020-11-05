package com.gump.netty.heartbeat.server;

import com.gump.netty.heartbeat.codec.NettyMessageDecoder;
import com.gump.netty.heartbeat.codec.NettyMessageEncoder;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.timeout.ReadTimeoutHandler;

/**
 * @Description: heartBeat server 初始化类
 * @Author gumpLiu
 * @Date 2020-11-05
 * @Version V1.0
 **/
public class HeartBeatServerInitializer extends ChannelInitializer<SocketChannel> {
    @Override
    protected void initChannel(SocketChannel ch) throws Exception {
        ch.pipeline().addLast(
                new NettyMessageDecoder(1024 * 1024, 4, 4));
        ch.pipeline().addLast(new NettyMessageEncoder());
        ch.pipeline().addLast("readTimeoutHandler", new ReadTimeoutHandler(50));
        ch.pipeline().addLast(new LoginAuthRespHandler());
        ch.pipeline().addLast("HeartBeatHandler", new HeartBeatRespHandler());
    }
}
