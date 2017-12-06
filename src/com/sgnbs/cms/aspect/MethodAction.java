package com.sgnbs.cms.aspect;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
* @company  *********
* @description 类的方法描述注解
*/
@Target(ElementType.METHOD)   
@Retention(RetentionPolicy.RUNTIME)   
@Documented  
@Inherited  
public @interface MethodAction {
	/**
	 * 方法描述
	 * @return
	 */
	public String optionDescription() default "no description"; 
	
	/**
	 * 方法名称
	 * @return
	 */
	public String methodName() default "no method name"; 
}
