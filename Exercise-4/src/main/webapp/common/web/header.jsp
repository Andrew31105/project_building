<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="p-4" style="background-color: #fff; border-bottom: 1px solid #eee;">
    <div class="container">
        <div class="row navbar align-items-center">
            <div class="col-12 col-md-3">
                <div class="logo">
                    <a href="<c:url value='/trang-chu'/>">
                        <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo.png?1676257083798"
                             alt="Logo" style="max-height: 50px;">
                    </a>
                </div>
            </div>

            <div class="col-12 col-md-6">
                <div class="item-menu">
                    <div class="nav nav1 d-flex justify-content-center" style="gap: 20px;">
                        <div class="nav-item">
                            <a class="nav-item-link" href="<c:url value='/trang-chu'/>" style="text-decoration: none; font-weight: bold; color: #35bf76; text-transform: uppercase;">
                                Trang chủ
                            </a>
                        </div>
                        <div class="nav-item"><a href="/gioi-thieu" style="text-decoration: none; color: #333; text-transform: uppercase; font-weight: 500;">Giới thiệu</a></div>
                        <div class="nav-item"><a href="/tin-tuc" style="text-decoration: none; color: #333; text-transform: uppercase; font-weight: 500;">Tin tức</a></div>
                        <div class="nav-item"><a href="/lien-he" style="text-decoration: none; color: #333; text-transform: uppercase; font-weight: 500;">Liên hệ</a></div>
                    </div>
                </div>
            </div>

            <div class="nav-login col-12 col-md-3 text-end">

                <security:authorize access="isAnonymous()">
                    <div id="header-guest">
                        <a href="<c:url value='/login'/>" class="btn" style="background-color: #35bf76; color: white; border-radius: 4px;">Đăng nhập</a>
                        <a href="<c:url value='/register'/>" class="btn" style="background-color: #35bf76; color: white; border-radius: 4px; margin-left: 5px;">Đăng ký</a>
                    </div>
                </security:authorize>

                <security:authorize access="isAuthenticated()">
                    <div id="header-user" class="d-flex align-items-center justify-content-end" style="gap: 10px;">
                        <span style="color: #333;">
                            Xin chào,
                            <b><security:authentication property="principal.username"/></b>
                        </span>

                        <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN', 'STAFF')">
                            <a href="<c:url value='/admin/home'/>" class="btn btn-sm" style="background-color: #35bf76; color: white; border: none; padding: 5px 10px; border-radius: 4px;">
                                <i class="fa fa-cogs"></i> Admin
                            </a>
                        </security:authorize>

                        <a href="<c:url value='/logout'/>" class="btn btn-danger btn-sm" style="padding: 5px 10px; border-radius: 4px;">
                            Thoát
                        </a>
                    </div>
                </security:authorize>

            </div>
        </div>
    </div>
</div>