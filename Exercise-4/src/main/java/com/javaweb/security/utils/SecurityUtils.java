package com.javaweb.security.utils;

import com.javaweb.security.CustomUserDetails; // <--- Sửa import đúng class này
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

public class SecurityUtils {

    // Sửa kiểu trả về và kiểu ép kiểu thành CustomUserDetails
    public static CustomUserDetails getPrincipal() {
        return (CustomUserDetails) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
    }

    public static List<String> getAuthorities() {
        List<String> results = new ArrayList<>();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
        return results;
    }
}