package com.javaweb.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(RegistrationFailedException.class)
    public ModelAndView handleRegistrationException(RegistrationFailedException e) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register");
        mav.addObject("message", "Đăng ký thất bại: " + e.getMessage());
        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleGlobalException(Exception e) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error");
        mav.addObject("message", "Lỗi hệ thống: " + e.getMessage());
        return mav;
    }
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<String> handleBadCredentialsException(BadCredentialsException e) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Tài khoản hoặc mật khẩu không chính xác!");
    }
}