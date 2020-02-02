package com.gump.spring.annotation.aimport;

import org.springframework.context.annotation.ImportSelector;
import org.springframework.core.type.AnnotationMetadata;

import java.util.Map;

/**
 * @program: Learn.demo
 * @description:
 * @author: gumpliu
 * @create: 2019-06-11 12:04
 **/
public class UserImportSelector implements ImportSelector {
    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        Map<String, Object> map =  annotationMetadata.getAnnotationAttributes(EnableUserService.class.getName(), true);
        for(Map.Entry<String, Object> entry : map.entrySet()){
            System.out.println("key is : " + entry.getKey() + " value is : " + entry.getValue());
        }

        return new String[]{UserServiceImpli.class.getName()};
    }
}
