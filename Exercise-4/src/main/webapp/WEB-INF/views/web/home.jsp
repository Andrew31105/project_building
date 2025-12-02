    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ</title>
        <style>
            /* Container chứa phân trang - CĂN GIỮA */
            .pagination-wrapper {
                text-align: center;
                padding: 30px 0;
                margin: 30px 0;
            }

            .pagination {
                display: inline-flex; /* Thay vì flex */
                justify-content: center;
                align-items: center;
                list-style: none;
                padding: 15px 30px;
                margin: 0 auto; /* Thêm auto */
                background-color: #5bc0de;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

            /* Mỗi item trong pagination */
            .pagination .page-item {
                margin: 0 5px;
                display: inline-block;
            }

            /* Link trong pagination */
            .pagination .page-link {
                display: block;
                padding: 10px 16px;
                background-color: #fff;
                color: #333;
                text-decoration: none;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: all 0.3s ease;
                font-weight: 500;
                cursor: pointer;
            }

            /* Hover effect */
            .pagination .page-link:hover {
                background-color: #46b8da;
                color: #fff;
                border-color: #46b8da;
                transform: translateY(-2px);
            }

            /* Active page */
            .pagination .page-item.active .page-link {
                background-color: #2c3e50;
                color: #fff;
                border-color: #2c3e50;
            }
            <style>
                 /* Container chứa phân trang - CĂN GIỮA MẠNH MẼ */
             .pagination-wrapper {
                 display: flex !important;
                 justify-content: center !important;
                 align-items: center !important;
                 width: 100% !important;
                 padding: 30px 0 !important;
                 margin: 30px auto !important;
             }

            /* Phân trang - ô màu xanh */
            .pagination {
                display: inline-flex !important;
                justify-content: center !important;
                align-items: center !important;
                list-style: none !important;
                padding: 15px 30px !important;
                margin: 0 auto !important;
                background-color: #5bc0de !important;
                border-radius: 8px !important;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1) !important;
            }

            /* Mỗi item trong pagination */
            .pagination .page-item {
                margin: 0 5px !important;
                display: inline-block !important;
            }

            /* Link trong pagination */
            .pagination .page-link {
                display: block !important;
                padding: 10px 16px !important;
                background-color: #fff !important;
                color: #333 !important;
                text-decoration: none !important;
                border: 1px solid #ddd !important;
                border-radius: 4px !important;
                transition: all 0.3s ease !important;
                font-weight: 500 !important;
                cursor: pointer !important;
            }

            /* Hover effect */
            .pagination .page-link:hover {
                background-color: #46b8da !important;
                color: #fff !important;
                border-color: #46b8da !important;
                transform: translateY(-2px);
            }

            /* Active page */
            .pagination .page-item.active .page-link {
                background-color: #2c3e50 !important;
                color: #fff !important;
                border-color: #2c3e50 !important;
            }
        </style>
    </head>

    <body>
    <div class="page-wrapper">
        <div class="">
    <%--        <header>--%>
    <%--            <div class="p-4">--%>
    <%--                <div class="row navbar">--%>
    <%--                    <div class="col-12 col-md-3">--%>
    <%--                        <div class="logo">--%>
    <%--                            <a href="/trang-chu">--%>
    <%--                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo.png?1676257083798" alt="Logo">--%>
    <%--                            </a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>

    <%--&lt;%&ndash;                    <div class="col-12 col-md-6">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                        <div class="item-menu">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            <div class="nav nav1">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                <div class="nav-item p-2">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    <a class="nav-item-link" href="/trang-chu">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                        <span style="color: var(--primary-color);">Trang chủ</span>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    </a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                <div class="nav-item p-2">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    <a href="/gioi-thieu"><span>Giới thiệu</span></a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                <div class="nav-item p-2">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    <a href="/san-pham"><span>Sản phẩm</span></a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                <div class="nav-item p-2">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    <a href="/tin-tuc"><span>Tin tức</span></a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                <div class="nav-item p-2">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                    <a href="/lien-he"><span>Liên hệ</span></a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>

    <%--&lt;%&ndash;                    <div class="nav-login col-12 col-md-3 text-end">&ndash;%&gt;--%>

    <%--&lt;%&ndash;                        <div id="header-guest">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            <a href="/login" class="btn btn-primary px-4 text-white">Đăng nhập</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            <a href="/register" class="btn btn-outline-primary px-4">Đăng ký</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

    <%--&lt;%&ndash;                        <div id="header-user" style="display: none;">&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            <span class="me-2">Xin chào, <b id="user-display-name">User</b></span>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                            <button onclick="logout()" class="btn btn-danger px-3">Thoát</button>&ndash;%&gt;--%>
    <%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>

    <%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </header>--%>
            <div class="container-fluid">
                <div class="p-0">
                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                    class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/slider_1.png?1676257083798" alt="">
                                </div>
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="img-slideshow"><img src="https://media.tapchitaichinh.vn/images/upload/hoangthuviet/04202019/bat-dong-san.jpg"
                                                                alt=""></div>
                                <div class="carousel-caption d-none d-md-block">
                                    <!-- <h5>Cho thuê căn hộ chung cư Saigon Mia</h5>
                                    <p>. Dự án cho thuê căn hộ chung cư Saigon Mia là dự án được sử dụng dành cho các
                                        khách hàng thành đạt với sở thích và mong muốn được sống trong môi trường có
                                        nguồn không khí trong lành</p> -->
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://richnguyen.vn/wp-content/uploads/2020/08/buc-anh-bat-dong-san-dep-2.jpg" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <!-- <h5>Dự án Chung cư Hòa Khánh Liên Chiểu Đà Nẵng</h5>
                                    <p>Dự án xây dựng nhằm đáp ứng nhu cầu về nhà ở cho cán bộ, công nhân viên chức, các
                                        đối tượng chính sách xã hội có thu nhập thấp</p> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SEARCH -->
            <div class="search">
        <div class="container">
            <form:form id="listFormBuilding" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">

                <div class="row justify-content-center align-items-end">

                    <div class="col-12 col-md-2">
                        <div class="search-item">
                            <p class="search-text">Chọn quận/huyện</p>
                            <form:select path="district" class="search-option" id="district">
                                <form:option value="" label="-- Chọn quận --"/>
                                <form:options items="${districts}"/>
                            </form:select>
                        </div>
                    </div>

                                <div class="col-12 col-md-3">
                <div class="search-item">
                    <p class="search-text">Chọn giá tiền</p>

                    <select class="search-option" id="rentType" onchange="updateRentPrice()">
                        <option value="">-- Chọn mức giá --</option>
                        <option value="under_10">Dưới 10 triệu</option>
                        <option value="10_20">Từ 10 - 20 triệu</option>
                        <option value="above_20">Trên 20 triệu</option>
                    </select>

                    <form:hidden path="rentPriceFrom" id="rentPriceFrom"/>
                    <form:hidden path="rentPriceTo" id="rentPriceTo"/>
                </div>
            </div>

                    <div class="col-12 col-md-3">
                        <div class="search-item">
                            <p class="search-text">Chọn loại bất động sản</p>
                            <select name="typeCode" class="search-option" id="typeCode">
                                <option value="">-- Chọn loại BĐS --</option>
                                <c:forEach var="item" items="${buildingType}">
                                    <option value="${item.key}">${item.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
        <div class="search-item">
            <div class="search-btn">
                <button type="button" class="search-btn-text" id="btnSearch" style="padding: 8px 15px; font-size: 14px; width: 100%;">
    <i class="fa-solid fa-magnifying-glass search-btn-icon"></i>
    <span>Tìm kiếm</span>
</button>
            </div>
        </div>
    </div>
                </div>

                <form:hidden path="page" id="page"/>

            </form:form>
        </div>
    </div>
            <!-- CONTENT 1  -->
            <div class="content">
                <div class="content-title">
                    <div class="title-cover">
                        <span id="title1">Dự án BĐS nổi bật</span>
                        <span id="title2">Tổng hợp các BĐS tại Hà Nội, Đà Nẵng, TP Hồ Chí Minh,... và các tỉnh thành
                                phố khác hot hiện tại</span>
                    </div>
                </div>
                            <div class="content-product">
                    <div class="container">
                        <div class="content1 justify-content-center">
                            <div class="row">
    <c:forEach var="item" items="${buildings}">
        <div class="col-12 col-md-4">
            <div class="product1 vip" style="margin-bottom: 30px; background: #fff; border: 1px solid #e5e5e5; border-radius: 5px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">

                <div class="product1-image new" style="position: relative; overflow: hidden; height: 250px;">
                    <a href="<c:url value='/chi-tiet-toa-nha-${item.id}'/>">
                        <c:if test="${not empty item.avatar}">
                            <img src="${item.avatar}" alt="${item.name}" style="width: 100%; height: 100%; object-fit: cover;">
                        </c:if>
                        <c:if test="${empty item.avatar}">
                            <img src="https://via.placeholder.com/350x250?text=No+Image" alt="Chưa có ảnh" style="width: 100%; height: 100%; object-fit: cover;">
                        </c:if>
                    </a>
                    <span style="position: absolute; top: 10px; left: 10px; background: #d82c2c; color: #fff; padding: 2px 10px; font-size: 12px; border-radius: 3px;">Mới đăng</span>
                </div>

                <div class="product1-conntent" style="padding: 15px; background: #fff;">
                    <div class="product1-conntent-header" style="height: 50px; overflow: hidden;">
                        <a href="<c:url value='/chi-tiet-toa-nha-${item.id}'/>" style="color: #333; font-weight: bold; font-size: 16px; text-decoration: none;">
                            ${item.name}
                        </a>
                    </div>

                    <p class="product1-conntent-title" style="color: #666; font-size: 13px; margin: 10px 0; height: 40px; overflow: hidden;">
                        ${item.address}
                    </p>

                    <ul class="product1-conntent-list" style="list-style: none; padding: 0; color: #555; font-size: 13px;">
                        <li class="product1-conntent-item" style="margin-bottom: 5px;">
                            <i class="fa-solid fa-building"></i>
                            <span>Diện tích: ${item.floorArea} m²</span>
                        </li>
                        <li class="product1-conntent-item" style="margin-bottom: 5px;">
                            <i class="fa-solid fa-bed"></i>
                            <span>Hướng: ${empty item.direction ? 'KXĐ' : item.direction}</span>
                        </li>
                        <li class="product1-conntent-item">
                            <i class="fa-solid fa-layer-group"></i>
                            <span>Hạng: ${empty item.level ? 'Thường' : item.level}</span>
                        </li>
                    </ul>
                </div>

                <div class="product1-footer" style="padding: 10px 15px; border-top: 1px solid #eee; display: flex; justify-content: space-between; align-items: center; background: #fff;">
                    <span class="product1-footer-cost" style="color: #d82c2c; font-weight: bold; font-size: 18px;">
                        ${item.rentPrice} Triệu
                    </span>

                    <a href="<c:url value='/chi-tiet-toa-nha-${item.id}'/>" class="btn btn-success btn-sm" style="background-color: #28a745; border: none;">
                        Xem chi tiết
                    </a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
                                <!-- Phần phân trang - đặt sau vòng lặp hiển thị buildings -->
    </div> <!-- Đóng row của buildings -->


    <%--<div class="container">--%>
    <%--    <div class="row">--%>
    <%--        <div class="col-12">--%>
    <%--            <div class="pagination-wrapper">--%>
    <%--                <c:if test="${modelSearch.totalPage > 0}">--%>
    <%--                    <ul class="pagination">--%>
    <%--                        <!-- Nút Previous -->--%>
    <%--                        <c:if test="${modelSearch.page > 1}">--%>
    <%--                            <li class="page-item">--%>
    <%--                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${modelSearch.page - 1})">--%>
    <%--                                    Trước--%>
    <%--                                </a>--%>
    <%--                            </li>--%>
    <%--                        </c:if>--%>

    <%--                        <!-- Các số trang -->--%>
    <%--                        <c:forEach var="i" begin="1" end="${modelSearch.totalPage}">--%>
    <%--                            <li class="page-item ${modelSearch.page == i ? 'active' : ''}">--%>
    <%--                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${i})">${i}</a>--%>
    <%--                            </li>--%>
    <%--                        </c:forEach>--%>

    <%--                        <!-- Nút Next -->--%>
    <%--                        <c:if test="${modelSearch.page < modelSearch.totalPage}">--%>
    <%--                            <li class="page-item">--%>
    <%--                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${modelSearch.page + 1})">--%>
    <%--                                    Sau--%>
    <%--                                </a>--%>
    <%--                            </li>--%>
    <%--                        </c:if>--%>
    <%--                    </ul>--%>
    <%--                </c:if>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
        <div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center">
                <c:if test="${modelSearch.totalPage > 0}">
                    <ul class="pagination justify-content-center">
                        <!-- Nút Previous -->
                        <c:if test="${modelSearch.page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${modelSearch.page - 1})">
                                    Trước
                                </a>
                            </li>
                        </c:if>

                        <!-- Các số trang -->
                        <c:forEach var="i" begin="1" end="${modelSearch.totalPage}">
                            <li class="page-item ${modelSearch.page == i ? 'active' : ''}">
                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${i})">${i}</a>
                            </li>
                        </c:forEach>

                        <!-- Nút Next -->
                        <c:if test="${modelSearch.page < modelSearch.totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="javascript:void(0);" onclick="loadPage(${modelSearch.page + 1})">
                                    Sau
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </c:if>
            </div>
        </div>
    </div>

            <!-- CONTENT 2  -->
            <section class="section-why mt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-12">
                            <div class="title_module_main a-center text-center">
                                <h2 style="margin-bottom: 15px;"><span>Vì sao bạn chọn bất động sản
                                            SkyLand ?</span>
                                </h2>
                                <p style="margin-bottom: 30px;">Chúng tôi cung cấp đầy đủ và chính xác
                                    nhất thông tin
                                    các dự án bất động sản trên
                                    toàn quốc song hành với dịch vụ tư vấn nhanh chóng và hiệu quả</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-12">
                            <div class="wrap">
                                <div
                                        class="swiper_why swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-multirow">
                                    <div class="swiper-wrapper">
                                        <div class="item swiper-slide swiper-slide-active">
                                            <div class="row section-why">
                                                <div class="col-12 col-md-4">
                                                    <div class="wrap-temp d-flex">
                                                        <div class="ico">
                                                            <img class="img-responsive lazyload loaded"
                                                                 src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why1.png?1676257083798" data-src=""
                                                                 alt="Chất lượng tốt nhất" data-was-processed="true">
                                                        </div>
                                                        <div class="content_p ml-4">
                                                            <h4><a href="#" class="why-title a-text">Chất lượng
                                                                tốt nhất</a>
                                                            </h4>
                                                            <p class="why-desc">Nghiên cứu, thiết kế và
                                                                đầu tư xây dựng
                                                                với hệ thống dịch
                                                                vụ
                                                                với chất
                                                                lượng tốt nhất</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-4">
                                                    <div class="wrap-temp d-flex">
                                                        <div class="ico">
                                                            <img class="img-responsive lazyload loaded"
                                                                 src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why2.png?1676257083798" data-src="" alt=""
                                                                 data-was-processed="true">
                                                        </div>
                                                        <div class="content_p ml-4">
                                                            <h4><a href="#" class="why-title a-text">Tìm kiếm
                                                                thông tin dễ
                                                                dàng</a></h4>
                                                            <p class="why-desc">Tìm kiếm bất động sản
                                                                bạn muốn theo danh
                                                                mục cực kì dễ
                                                                dàng</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-4">
                                                    <div class="wrap-temp d-flex">
                                                        <div class="ico">
                                                            <img class="img-responsive lazyload loaded"
                                                                 src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why3.png?1676257083798" data-src="" alt=""
                                                                 data-was-processed="true">
                                                        </div>
                                                        <div class="content_p ml-4">
                                                            <h4><a href="#" class="why-title a-text">Kết nối
                                                                với nhà đầu tư</a>
                                                            </h4>
                                                            <p class="why-desc">Nhà đầu tư sẽ mang đến
                                                                những sản phẩm và
                                                                dịch vụ tốt nhất
                                                                đáp ứng nhu cầu của bạn</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why4.png?1676257083798" data-src=""
                                                             alt="Chất lượng tốt nhất" data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4 class=""><a href="#" class="why-title a-text">Tối
                                                            ưu hóa dịch
                                                            vụ</a></h4>
                                                        <p class="why-desc">Nghiên cứu, thiết kế và đầu
                                                            tư xây dựng với
                                                            hệ thống dịch vụ
                                                            với chất
                                                            lượng tốt nhất</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why5.png?1676257083798" data-src=""
                                                             alt="Chất lượng tốt nhất" data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Đảm bảo quyền
                                                            lợi khách
                                                            hàng</a></h4>
                                                        <p>
                                                        <p class="why-desc">Thực hiện các chương trình
                                                            chăm sóc và gia
                                                            tăng lợi ích cho
                                                            khách hàng.</p>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why6.png?1676257083798" data-src=""
                                                             alt="Chất lượng tốt nhất" data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Tiết kiệm thời
                                                            gian và chi
                                                            phí</a></h4>
                                                        <p class="why-desc">Cập nhật giá cả nhanh chóng
                                                            và chính xác
                                                            giúp bạn tiết kiệm
                                                            chi phí hơn nhiều</p>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- FOOTER  -->
            <div class="brand mt-5 border-top">
                <div class="container">
                    <div class="row">
                        <div class="d-flex justify-content-evenly mt-4">
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand1.png?1676257083798" alt=""></div>
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand2.png?1676257083798" alt=""></div>
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand3.png?1676257083798" alt=""></div>
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand4.png?1676257083798" alt=""></div>
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand5.png?1676257083798" alt=""></div>
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/brand6.png?1676257083798" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="footer">
                <div class="container-fluid">
                    <div class="top-footer text-center mt-0">
                        <div class="logo logo-footer pt-5">
                            <a href="./ViewHome.html"><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798"
                                                           alt="logo-footer"></a>
                            <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, SkyLand tự hào là sàn
                                mua
                                bán, giao dịch và quảng cáo
                                bất động sản hàng đầu tại Việt Nam</p>
                            <div class="item-footer mt-5">
                                <div class="row">
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798" alt="">
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Trụ sở chính</p>
                                            <p class="desc-footer">Số 46 Man Thiện, TP Thủ Đức, TP HCM</p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798" alt="">
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Hotline</p>
                                            <p class="desc-footer"><a class="a-text" href="#">098828</a></p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798" alt="">
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Email</p>
                                            <p class="desc-footer"><a class="a-text" href="#">vsh@gmail.com</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <div class="border-bottom mb-5 mt-4"></div>
                        </div>
                    </div>
                    <div class="bottom-footer container">
                        <div class="row">
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-footer-2">
                    <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
                        Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
                </div>
            </footer>
        </div>
    </div>

    <%--<section class="vh-100 gradient-custom form-register">--%>
    <%--    <div class="container">--%>
    <%--        <div class="row d-flex justify-content-center align-items-center h-100">--%>
    <%--            <div class="col-12 col-md-8 col-lg-6 col-xl-5">--%>
    <%--                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">--%>
    <%--                    <div class="card-body p-2 px-5 text-center">--%>
    <%--                        <div class="md-5 md-4 mt-4 pb-2">--%>
    <%--                            <h2 class="fw-bold mb-2 text-uppercase">Create an account</h2>--%>
    <%--                            <p class="text-white-50 mb-2">Please enter your Information</p>--%>

    <%--                            <div class="row">--%>
    <%--                                <div class="col-md-6 mb-2">--%>
    <%--                                    <div class="form-outline">--%>
    <%--                                        <label class="form-label" for="form3Example1m">First name</label>--%>
    <%--                                        <input type="text" id="form3Example1m"--%>
    <%--                                               class="form-control form-control-lg" />--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                                <div class="col-md-6 mb-2">--%>
    <%--                                    <div class="form-outline">--%>
    <%--                                        <label class="form-label" for="form3Example1n">Last name</label>--%>
    <%--                                        <input type="text" id="form3Example1n"--%>
    <%--                                               class="form-control form-control-lg" />--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>

    <%--                            <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">--%>
    <%--                                <h6 class="mb-0 me-4">Gender: </h6>--%>

    <%--                                <div class="form-check form-check-inline mb-0 me-4">--%>
    <%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
    <%--                                           id="femaleGender" value="option1" />--%>
    <%--                                    <label class="form-check-label" for="femaleGender">Female</label>--%>
    <%--                                </div>--%>

    <%--                                <div class="form-check form-check-inline mb-0 me-4">--%>
    <%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
    <%--                                           id="maleGender" value="option2" />--%>
    <%--                                    <label class="form-check-label" for="maleGender">Male</label>--%>
    <%--                                </div>--%>

    <%--                                <div class="form-check form-check-inline mb-0">--%>
    <%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
    <%--                                           id="otherGender" value="option3" />--%>
    <%--                                    <label class="form-check-label" for="otherGender">Other</label>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>

    <%--                            <div class="form-outline form-white mb-2">--%>
    <%--                                <label class="form-label" for="typePasswordX">Username</label>--%>
    <%--&lt;%&ndash;                                <input type="email" id="typePasswordX" class="form-control form-control-lg" />&ndash;%&gt;--%>
    <%--                            </div>--%>

    <%--                            <div class="form-outline form-white mb-2">--%>
    <%--                                <label class="form-label" for="typeEmailX">Password</label>--%>
    <%--&lt;%&ndash;                                <input type="email" id="typeEmailX" class="form-control form-control-lg" />&ndash;%&gt;--%>
    <%--                            </div>--%>

    <%--                            <div class="form-outline form-white mb-2">--%>
    <%--                                <label class="form-label" for="typeEmailX">Repeat your password</label>--%>
    <%--&lt;%&ndash;                                <input type="email" id="typeEmailX" class="form-control form-control-lg" />&ndash;%&gt;--%>
    <%--                            </div>--%>

    <%--                            <div class="form-check d-flex justify-content-center mb-2">--%>
    <%--                                <input class="form-check-input me-2" type="checkbox" value=""--%>
    <%--                                       id="form2Example3cg" />--%>
    <%--                                <label class="form-check-label">--%>
    <%--                                    I agree all statements in <a href="#!" class="text-body"><u--%>
    <%--                                        style="color: white ;">Terms of--%>
    <%--                                    service</u></a>--%>
    <%--                                </label>--%>
    <%--                            </div>--%>


    <%--                            <button class="btn btn-outline-light btn-lg px-5" type="submit">Register</button>--%>

    <%--                            <div class="d-flex justify-content-center text-center mt-2 pt-1">--%>
    <%--                                <a href="#!" class="login-extension text-white"><i--%>
    <%--                                        class="fab fa-facebook-f fa-lg"></i></a>--%>
    <%--                                <a href="#!" class="login-extension text-white"><i--%>
    <%--                                        class="fab fa-twitter fa-lg mx-4 px-2"></i></a>--%>
    <%--                                <a href="#!" class="login-extension text-white"><i--%>
    <%--                                        class="fab fa-google fa-lg"></i></a>--%>
    <%--                            </div>--%>

    <%--                            <p class="text-center text-muted mt-2 mb-0">Have already an account? <a href="#!"--%>
    <%--                                                                                                    class="fw-bold text-body"><u style="color: white ;">Login here</u></a></p>--%>

    <%--                            </form>--%>

    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--</section>--%>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

    <script>
        // Hàm cập nhật giá trị khi chọn khoảng giá
        function updateRentPrice() {
            var type = document.getElementById("rentType").value;
            var from = document.getElementById("rentPriceFrom");
            var to = document.getElementById("rentPriceTo");

            if (type === "under_10") {
                from.value = "";
                to.value = "10";
            } else if (type === "10_20") {
                from.value = "10";
                to.value = "20";
            } else if (type === "above_20") {
                from.value = "20";
                to.value = "";
            } else {
                from.value = "";
                to.value = "";
            }
        }

        $(document).ready(function() {
            // ✅ Enable lại tất cả field khi load trang
            $('#rentPriceFrom, #rentPriceTo, #district, #typeCode').prop('disabled', false);

            // Giữ trạng thái select box
            var from = $('#rentPriceFrom').val();
            var to = $('#rentPriceTo').val();

            if (to == '10' && (!from || from == '')) {
                $('#rentType').val('under_10');
            } else if (from == '10' && to == '20') {
                $('#rentType').val('10_20');
            } else if (from == '20' && (!to || to == '')) {
                $('#rentType').val('above_20');
            } else {
                $('#rentType').val('');
            }

            // ✅ XỬ LÝ NÚT TÌM KIẾM - PHẦN BỊ MẤT
            $('#btnSearch').click(function(e) {
                e.preventDefault(); // Ngăn submit mặc định

                console.log("Đã bấm nút tìm kiếm!"); // Debug

                $('#page').val(1); // Reset về trang 1

                // Disable các field rỗng để không gửi lên URL
                if ($('#rentPriceFrom').val() === '' || !$('#rentPriceFrom').val()) {
                    $('#rentPriceFrom').prop('disabled', true);
                }

                if ($('#rentPriceTo').val() === '' || !$('#rentPriceTo').val()) {
                    $('#rentPriceTo').prop('disabled', true);
                }

                if ($('#typeCode').val() === '' || !$('#typeCode').val()) {
                    $('#typeCode').prop('disabled', true);
                }

                if ($('#district').val() === '' || !$('#district').val()) {
                    $('#district').prop('disabled', true);
                }

                // Submit form bằng JavaScript thuần (chắc chắn hơn)
                document.getElementById('listFormBuilding').submit();
            });
        });

        // Hàm phân trang
        function loadPage(page) {
            // ✅ Enable lại tất cả field trước khi chuyển trang
            $('#rentPriceFrom, #rentPriceTo, #district, #typeCode').prop('disabled', false);

            $('#page').val(page);
            $('#listFormBuilding').submit();
        }
    </script>

    </body>
    </html>