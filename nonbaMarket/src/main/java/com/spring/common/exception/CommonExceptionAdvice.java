package com.spring.common.exception;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

//@ControllerAdvice
//@Log4j

public class CommonExceptionAdvice {
	
//	@ExceptionHandler(Exception.class)
//	public String exceptionMethod(Exception ex, Model model,HttpServletRequest request) {
//		log.error("Exception ....."+ ex.getMessage());
//		String value="";
//		
//		String uri = request.getRequestURI();
//		
//		if(uri.contains("/admin")) {
//			value="adminError/custom404";
//		}
//		else value="error/custom404";
//		
//		model.addAttribute("exception",ex);
//		return value;
//		
//		
//	}
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(HttpStatus.NOT_FOUND)
//	public String handle404(NoHandlerFoundException ex,HttpServletRequest request) {
//		
//		String uri = request.getRequestURI();
//		String value="";
//		if(uri.contains("/admin")) {
//			value="adminError/custom404";
//		}
//		else value="error/custom404";
//		
//		
//		return value;
//		
//		
//	}
}
