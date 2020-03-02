package com.yss.fsip.generic.repository;

import ch.qos.logback.classic.Logger;
import com.yss.fsip.context.FSIPContextFactory;
import com.yss.fsip.log.core.BatchDBLoggerAppender;
import com.yss.fsip.log.core.impl.DBLogger;
import com.yss.fsip.util.HttpClientUtil;
import org.aopalliance.intercept.MethodInvocation;
import ch.qos.logback.classic.LoggerContext;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

public abstract class SubSecrecyFilter {

    private static AtomicBoolean isStart = new AtomicBoolean(false);

    public static Object dofilter(MethodInvocation Invocation) throws Throwable{

        Object obj=Invocation.proceed();
        //批处理的方法中上下文不会记录user信息，因此批处理不记录日志
        if(FSIPContextFactory.getContext().getUserId()!=null){
            Object[] objects=Invocation.getArguments();
            Object logParam=null;
            if(objects!=null && objects.length>0){
                logParam=objects[0];
            }
            if(isStart.get()==false) {
                LoggerContext context = (LoggerContext) LoggerFactory.getILoggerFactory();
                Logger logger = context.getLogger("bizLogger."+Invocation.getMethod().getDeclaringClass().getName());
                logger.setAdditive(false);
                BatchDBLoggerAppender dbAppender=new BatchDBLoggerAppender();
                dbAppender.start();
                logger.addAppender(dbAppender);
                logger.setAdditive(false);
                isStart.set(true);
            }
            DBLogger db=new DBLogger();
            db.success(Invocation.getMethod().getDeclaringClass(),Invocation.getMethod(),logParam);
        }
        return obj;
    }
}

