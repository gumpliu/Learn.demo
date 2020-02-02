package com.gump.javabase.annotation.inherited;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface ATable {  
  
    public String name() default "";  
}  
  