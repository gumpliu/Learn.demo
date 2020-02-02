package com.gump.spring.annotation.conditional;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Locale;

/**
 * BeanConditionTest main
 *
 * @author gumpliu
 * @create 2019-06-11 22:06
 */
public class BeanConditionTestMain {

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
                    AppConfig.class);

    MyClientBean bean = context.getBean(MyClientBean.class);
    System.out.printf("Injected MyService instance in ClientBean: %s\n", bean.getServiceBean()
            .getClass()
            .getSimpleName());
  }

}
