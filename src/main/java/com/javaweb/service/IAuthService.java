package com.javaweb.service;

import com.javaweb.model.request.LoginRequest;
import com.javaweb.model.response.JwtResponse;

import javax.servlet.http.HttpServletResponse;

public interface IAuthService {
    JwtResponse login(LoginRequest request, HttpServletResponse response);
}
