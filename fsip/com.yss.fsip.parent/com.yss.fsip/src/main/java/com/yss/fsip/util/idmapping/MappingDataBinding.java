package com.yss.fsip.util.idmapping;

/**
 * 数据绑定接口
 *
 * @Author: gumpLiu
 * @Date: 2019-11-14 11:27
 */
public interface MappingDataBinding {

    /***
     * 通过type,value获取需要转换的值
     *
     * @param type IdMappingTarget中type值，type值是去掉前缀的
     * @param value 待转换值，如：id值
     * @return java.lang.String
     */
    public String getData(String type, String value);

}
