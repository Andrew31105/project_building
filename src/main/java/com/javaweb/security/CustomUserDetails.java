package com.javaweb.security;

import com.javaweb.entity.UserEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;
import java.util.stream.Collectors;

public class CustomUserDetails implements UserDetails {
    private Long id;
    private String username;
    private UserEntity userEntity;

    public CustomUserDetails(UserEntity userEntity) {

        this.userEntity = userEntity;
        this.id = userEntity.getId();
        this.username = userEntity.getUserName();
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return userEntity.getRoles()
                .stream()
                .map(role -> new SimpleGrantedAuthority(role.getCode()))
                .collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        return userEntity.getPassword();
    }

    @Override
    public String getUsername() {
        return userEntity.getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return userEntity.getStatus() == 1;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return userEntity.getStatus() == 1;
    }



    public Long getId() {
        return id;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }
    public void setUsername(String username) {
        this.username = username;
    }

}
