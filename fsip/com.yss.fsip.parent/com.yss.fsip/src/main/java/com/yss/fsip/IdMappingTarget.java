package com.yss.fsip;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * IdMappingTarget注解主要用于标注在类的属性上
 * 将想要的ID 转换成 描写信息
 * 
 * @author dongxiangheng
 * @version 1.0, 2019年6月25日
 * @since 1.0, 2019年6月25日
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface IdMappingTarget {

	/**
	 * 需要获取缓存数据的业务标识，
	 * 		如:数据来源是cache,type为缓存的key值；如是数据库,type为属性名
	 * @return
	 */

    public String type();
    /**
	 * 描述需要转换的code数据来源同类的那个字段，
	 * 例如 A类的 xx字段存放的是CODE值，是需要转换成描述信息的。
	 *   那这里注解就可以写成 @IdMappingTarget(fromCode="XX")
	 * @return
	 */
    public String fromCode();

	/**
	 * MappingDataBinding 实现类
	 * @return
	 */
	public Class mappingDataBinding();

    /**
     * 用于处理一个字段需要转换多个ID和描述的情况,如果不是多值转换不需要填写
     * 例如  A类的 xx字段存放的了多个CODE值，id1,id2,id3
     * 是需要转换成对应的描述信息描述1,描述2,描述3
     * 那这里注解就可以写成 @IdMappingTarget(dataSplit=",")
     */
//    public String dataSplit() default  "";

}