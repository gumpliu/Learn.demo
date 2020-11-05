package com.gump.netty.heartbeat.client;

import com.gump.netty.heartbeat.codec.NettyMessageDecoder;
import com.gump.netty.heartbeat.codec.NettyMessageEncoder;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.handler.timeout.ReadTimeoutHandler;

/**
 * @Description: heartBeat client 初始化类
 * @Author gumpLiu
 * @Date 2020-11-05
 * @Version V1.0
 **/
public class HeartBeatClientInitializer extends ChannelInitializer<Channel> {
    @Override
    protected void initChannel(Channel ch) throws Exception {
        ch.pipeline().addLast(
                new NettyMessageDecoder(1024 * 1024, 4, 4));
        ch.pipeline().addLast("MessageEncoder",
                new NettyMessageEncoder());
        ch.pipeline().addLast("readTimeoutHandler",
                new ReadTimeoutHandler(50));
        ch.pipeline().addLast("LoginAuthHandler",
                new LoginAuthReqHandler());
        ch.pipeline().addLast("HeartBeatHandler",
                new HeartBeatReqHandler());
    }
}
