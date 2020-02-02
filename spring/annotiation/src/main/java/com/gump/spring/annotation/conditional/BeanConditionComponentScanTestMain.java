package com.gump.spring.annotation.conditional;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

import java.util.Locale;

/**
 * BeanConditionTest main
 *
 * @author gumpliu
 * @create 2019-06-11 22:06
 */
@Configuration
@ComponentScan(basePackageClasses = BeanConditionComponentScanTestMain.class,
        useDefaultFilters = false,
        includeFilters = {@ComponentScan.Filter(
                type = FilterType.ASSIGNABLE_TYPE,
                value = {MyClientBean.class,
                         ServiceBeanImpl1.class,
                         ServiceBeanImpl2.class})})
public class BeanConditionComponentScanTestMain {

  public static void main (String[] args) {

    runApp(Locale.US);
    System.out.println("----------");
    runApp(Locale.CANADA);
  }

  public static void runApp (Locale locale) {

    /**In real application, Locale will be set with your machine
     * depending on your location.
     * Here we are setting it manually to test our example*/
    System.out.printf("setting default locale: %s\n", locale);
    Locale.setDefault(locale);

    AnnotationConfigApplicationContext context =
            new AnnotationConfigApplicationContext(
                    BeanConditionComponentScanTestMain.class);

    MyClientBean bean = context.getBean(MyClientBean.class);
    System.out.printf("Injected MyService instance in ClientBean: %s\n", bean.getServiceBean()
            .getClass()
            .getSimpleName());
  }

}
