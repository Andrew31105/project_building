package com.javaweb.controller.admin;

import com.javaweb.model.request.LoginRequest;
import com.javaweb.model.response.JwtResponse;
import com.javaweb.security.CustomUserDetailsService;
import com.javaweb.security.utils.JWTUtil;
import com.javaweb.service.impl.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// --- IMPORT QUAN TRỌNG CẦN THÊM ---
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class AuthController {

    @Autowired
    private AuthService authService;

    // Thêm tham số HttpServletResponse response vào hàm
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request, HttpServletResponse response) {
        JwtResponse result = authService.login(request, response);
        return ResponseEntity.ok(result);
    }
}