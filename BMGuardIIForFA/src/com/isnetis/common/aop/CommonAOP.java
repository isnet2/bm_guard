package com.isnetis.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class CommonAOP {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Around("within(com.isnetis..service.*Service*) || within(com.isnetis..controller.*Controller) ")
	public Object logging(ProceedingJoinPoint joinPoint) throws Throwable{
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		
		logger.info("["+className+"] ["+methodName+"] start.");
		Object returnValue = joinPoint.proceed();
		if(className.contains("Controller")){
			logger.info("["+className+"] ["+methodName+"] end.\n");
		}else{
			logger.info("["+className+"] ["+methodName+"] end.");
		}
		return returnValue;
	}
}
