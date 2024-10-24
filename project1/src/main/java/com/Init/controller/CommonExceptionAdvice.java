package com.Init.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkflowController.class);
	
	@ExceptionHandler (Exception.class)
	public String commonEx2(Exception e,HttpServletRequest request) {
		logger.debug("예외 발생!!");
		logger.debug("e :"+e);
		logger.debug("e message :"+e.getMessage());
		logger.debug("e rul :"+request.getRequestURL());
		return "error_page";
	}

}
