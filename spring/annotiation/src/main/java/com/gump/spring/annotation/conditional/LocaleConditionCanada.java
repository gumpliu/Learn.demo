package com.gump.spring.annotation.conditional;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

import java.util.Locale;

/**
 * LocaleConditionCanada demo
 *
 * @author gumpliu
 * @create 2019-06-11 21:50
 */
public class LocaleConditionCanada implements Condition {
  @Override
  public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {

    return Locale.getDefault().equals(Locale.CANADA);
  }
}
