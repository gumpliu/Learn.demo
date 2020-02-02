package com.gump.activity.util;

import org.apache.commons.lang3.StringUtils;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: object对象util
 * @author: gumpliu
 * @create: 2019-06-04 15:08
 **/
public class ObjectUtil {

    /**
     * 判断object是否为空
     *
     * @param object
     * @return
     */
    public static boolean isEmptory(Object object){
        return object == null || StringUtils.isEmpty(object.toString());
    }
}
