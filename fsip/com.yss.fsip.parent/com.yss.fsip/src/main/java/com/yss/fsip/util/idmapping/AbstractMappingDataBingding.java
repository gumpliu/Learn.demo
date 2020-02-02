//package com.yss.fsip.util.idmapping;
//
//
//import org.springframework.beans.BeanUtils;
//import org.springframework.util.CollectionUtils;
//import org.springframework.util.StringUtils;
//
//import java.beans.PropertyDescriptor;
//import java.lang.reflect.InvocationTargetException;
//import java.lang.reflect.Method;
//import java.util.Arrays;
//import java.util.Collections;
//import java.util.List;
//
//public abstract class AbstractMappingDataBingding implements MappingDataBinding {
////    public String getData(String code, String typeValue, String separator)
////            throws InvocationTargetException, IllegalAccessException {
////        List<String> ids = Collections.EMPTY_LIST;
////        if (isNotEmpty(separator) && isNotEmpty(typeValue)) {
////            String[] idStrings = typeValue.split(separator);
////            Arrays.asList(idStrings);
////
////        }else{
////            ids.add(typeValue);
////        }
////
//////        Method method = BeanUtils.findMethod(bean.getClass(), methodName, String.class);
//////
//////
//////        for(String id : ids){
//////            Object result =  method.invoke(bean, typeValue);
//////            PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(result.getClass(), code);
//////            propertyDescriptor.getReadMethod().invoke(result);
//////        }
////
////        return "";
////    }
//
//    /**
//     * 被转换值 统一转换成list集合
//     *
//     * @param value
//     * @param separator
//     * @return
//     */
//    protected List<String> toList(String value, String separator){
//        List<String> ids = Collections.EMPTY_LIST;
//        if (isNotEmpty(separator) && isNotEmpty(value)) {
//            String[] idStrings = value.split(separator);
//            Arrays.asList(idStrings);
//
//        }else{
//            ids.add(value);
//        }
//        return ids;
//    }
//
//    /**
//     * 转换值已
//     *
//     * @param names
//     * @param separator
//     * @return
//     */
//    protected String toString(List<String> names, String separator){
//
//        if(CollectionUtils.isEmpty(names)){
//            return "";
//        }
//        if(names.size() == 1){
//            return names.get(0);
//        }
//        String nameStr = "";
//
//        for(String name: names){
//            nameStr +=name + separator;
//        }
//        return nameStr.substring(0, nameStr.length() - 1);
//    }
//
//
//
//    /**
//     * String 为空判断
//     *
//     * @param value
//     * @return
//     */
//    protected  boolean isNotEmpty(String value){
//        return value != null && value.length() > 0;
//    }
//
//}
