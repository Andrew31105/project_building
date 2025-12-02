<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div id="navbar" class="navbar navbar-default ace-save-state" style="background-color:#35bf76">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="/admin/home" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-10">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, <span id="admin-fullname" style="font-weight: bold;">Admin</span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#" id="link-profile">
                                <i class="ace-icon fa fa-user"></i>
                                Thông tin tài khoản
                            </a>
                        </li>
                        <li>
                            <a href="/admin/profile-password">
                                <i class="ace-icon fa fa-key"></i>
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" onclick="logoutAdmin()">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var token = localStorage.getItem('accessToken');
        if (!token) {
            window.location.href = '/login?message=not_login';
            return;
        }

        // Giải mã token lấy tên Admin
        try {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));
            var decodedToken = JSON.parse(jsonPayload);
            var username = decodedToken.sub;

            document.getElementById('admin-fullname').innerText = username;
            document.getElementById('link-profile').href = "/admin/profile-" + username;
        } catch (e) {
            console.error("Lỗi token:", e);
        }
    });

    function logoutAdmin() {
        localStorage.removeItem('accessToken');
        window.location.href = '/login';
    }
</script>


