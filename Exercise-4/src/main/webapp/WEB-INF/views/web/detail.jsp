<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
    /* ======================================================== */
    /* CẤU HÌNH CSS */
    html { font-size: 14px !important; }
    body {
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        font-size: 14px !important;
        line-height: 1.42857143;
        color: #333;
        background-color: #fff;
    }

    /* SLIDER */
    .carousel-inner > .item > img,
    .carousel-inner > .item > a > img {
        width: 100%; height: 450px !important; object-fit: cover; border-radius: 4px;
    }

    /* THUMBNAIL */
    .thumbnail-container { display: flex; gap: 10px; margin-top: 15px; overflow-x: auto; padding-bottom: 5px; white-space: nowrap; }
    .thumbnail-item { width: 100px; height: 70px; object-fit: cover; cursor: pointer; border-radius: 4px; border: 2px solid #ddd; opacity: 0.6; transition: all 0.3s ease; flex-shrink: 0; }
    .thumbnail-item:hover { opacity: 1; border-color: #999; }
    .thumbnail-item.active { opacity: 1; border-color: #d82c2c; box-shadow: 0 0 5px rgba(216, 44, 44, 0.5); }

    /* TEXT & BẢNG */
    .contact-box { background: #f9f9f9; padding: 20px; border-radius: 4px; border: 1px solid #eee; }
    .building-title { font-size: 28px; font-weight: bold; color: #333; margin-top: 0; }
    .price-tag { font-size: 24px; color: #d82c2c; font-weight: bold; }

    .table-custom-detail td { padding: 8px 0; border-bottom: 1px dashed #ddd; }
    .label-info-custom { color: #666; font-weight: normal; width: 45%; }
    .value-info-custom { color: #333; font-weight: bold; }

    /* NÚT SLIDER */
    .carousel-control.left, .carousel-control.right { background-image: none !important; display: flex; align-items: center; justify-content: center; }
    .carousel-control i { font-size: 30px; text-shadow: 1px 1px 2px rgba(0,0,0,0.5); }
</style>

<div class="container" style="margin-top: 30px; margin-bottom: 50px;">

    <ul class="breadcrumb">
        <li><a href="#">Trang chủ</a></li>
        <li class="active">${building.name}</li>
    </ul>

    <div class="row">
        <div class="col-md-8">

            <div id="buildingCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <c:if test="${not empty building.avatar}">
                            <img src="${building.avatar}" alt="Avatar">
                        </c:if>
                        <c:if test="${empty building.avatar}">
                            <img src="https://via.placeholder.com/800x450?text=No+Image" alt="No Image">
                        </c:if>
                    </div>
                    <c:if test="${not empty building.images}">
                        <c:forTokens items="${building.images}" delims="," var="imgUrl">
                            <div class="item">
                                <img src="${imgUrl}" alt="Chi tiết">
                            </div>
                        </c:forTokens>
                    </c:if>
                </div>
                <a class="left carousel-control" href="#buildingCarousel" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
                <a class="right carousel-control" href="#buildingCarousel" data-slide="next"><i class="fa fa-chevron-right"></i></a>
            </div>

            <div class="thumbnail-container">
                <c:if test="${not empty building.avatar}">
                    <img src="${building.avatar}" class="thumbnail-item active" data-target="#buildingCarousel" data-slide-to="0">
                </c:if>
                <c:if test="${empty building.avatar}">
                    <img src="https://via.placeholder.com/100x70?text=No+Img" class="thumbnail-item active" data-target="#buildingCarousel" data-slide-to="0">
                </c:if>
                <c:if test="${not empty building.images}">
                    <c:forTokens items="${building.images}" delims="," var="imgUrl" varStatus="status">
                        <img src="${imgUrl}" class="thumbnail-item" data-target="#buildingCarousel" data-slide-to="${status.count}">
                    </c:forTokens>
                </c:if>
            </div>

            <div style="margin-top: 30px;">
                <h1 class="building-title">${building.name}</h1>
                <p class="text-muted">
                    <i class="fa fa-map-marker-alt" style="color:red"></i>
                    ${building.street}, ${building.ward}, ${districts[building.district]}
                </p>

                <div class="row" style="border-bottom: 1px solid #eee; padding-bottom: 15px;">
                    <div class="col-xs-6">
                        Giá thuê: <span class="price-tag">${building.rentPrice} Triệu/tháng</span>
                    </div>
                    <div class="col-xs-6 text-right">
                        Diện tích sàn: <b>${building.floorArea} m²</b>
                    </div>
                </div>

                <h4 style="margin-top: 20px;">Thông tin chi tiết</h4>
                <div class="row">
                    <div class="col-sm-6">
                        <table class="table-custom-detail" style="width:100%">
                            <tr><td class="label-info-custom">Hạng văn phòng:</td><td class="value-info-custom">${building.level}</td></tr>
                            <tr><td class="label-info-custom">Hướng:</td><td class="value-info-custom">${building.direction}</td></tr>
                            <tr><td class="label-info-custom">Kết cấu:</td><td class="value-info-custom">${building.structure}</td></tr>

                            <tr>
                                <td class="label-info-custom">Loại tòa nhà:</td>
                                <td class="value-info-custom">
                                    <c:if test="${not empty building.typeCode}">
                                        <c:forEach var="item" items="${building.typeCode}" varStatus="loop">
                                            ${buildingType[item]}${!loop.last ? ', ' : ''}
                                        </c:forEach>
                                    </c:if>
                                </td>
                            </tr>

                            <tr><td class="label-info-custom">Thời gian trang trí:</td><td class="value-info-custom">${building.decorationTime}</td></tr>
                        </table>
                    </div>

                    <div class="col-sm-6">
                        <table class="table-custom-detail" style="width:100%">
                            <tr><td class="label-info-custom">Phí dịch vụ:</td><td class="value-info-custom">${building.serviceFee}</td></tr>
                            <tr><td class="label-info-custom">Tiền điện:</td><td class="value-info-custom">${building.electricityFee}</td></tr>
                            <tr><td class="label-info-custom">Phí ngoài giờ:</td><td class="value-info-custom">${not empty building.overtimeFee ? building.overtimeFee : 'Thương lượng'}</td></tr>
                            <tr><td class="label-info-custom">Tiền nước:</td><td class="value-info-custom">${building.waterFee}</td></tr>
                            <tr><td class="label-info-custom">Phí ô tô:</td><td class="value-info-custom">${building.carFee}</td></tr>
                            <tr><td class="label-info-custom">Phí mô tô:</td><td class="value-info-custom">${building.motoFee}</td></tr>
                        </table>
                    </div>
                </div>

                <div class="mt-4">
                    <h4>Giới thiệu thêm</h4>
                    <div class="content-desc" style="line-height: 1.8; color: #444;">
                        <p>${not empty building.note ? building.note : 'Đang cập nhật thông tin mô tả...'}</p>

                        <p><strong>Diện tích trống:</strong> ${building.rentArea}</p>
                        <p><strong>Thời hạn thuê:</strong> ${building.rentTime}</p>
                        <p><strong>Đặt cọc:</strong> ${building.deposit}</p>
                        <p><strong>Thanh toán:</strong> ${building.payment}</p>
                        <c:if test="${not empty building.brokerageFee}">
                            <p><strong>Phí môi giới:</strong> ${building.brokerageFee}</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="contact-box">
                <h4 style="margin-top:0">Liên hệ quản lý</h4>
                <div class="media">
                    <div class="media-left">
                        <div style="width: 50px; height: 50px; background: #5cb85c; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white;">
                            <i class="fa fa-user"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading" style="margin-top: 5px;">${building.managerName}</h4>
                        <span class="text-muted">Quản lý tòa nhà</span>
                    </div>
                </div>
                <hr>
                <button class="btn btn-success btn-block btn-lg"><i class="fa fa-phone"></i> ${building.managerPhone}</button>
                <button class="btn btn-default btn-block btn-lg" style="margin-top: 10px; font-weight: bold; border: 2px solid #ccc;" id="btnSendRequest"><i class="fa fa-envelope"></i> Gửi yêu cầu</button>
                <p class="text-center text-muted" style="margin-top: 10px; font-size: 12px;">* Vui lòng liên hệ trước khi đến xem.</p>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#buildingCarousel').on('slid.bs.carousel', function () {
            var currentIndex = $('div.item.active').index();
            $('.thumbnail-item').removeClass('active');
            var currentThumb = $('.thumbnail-item').eq(currentIndex);
            currentThumb.addClass('active');
            if(currentThumb.length > 0) {
                 currentThumb[0].scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
            }
        });
    });
    $('#btnSendRequest').click(function(e) {
        e.preventDefault();

        var isLoggedIn = false;
        var currentUserName = "";
        <security:authorize access="isAuthenticated()">
        isLoggedIn = true;

        currentUserName = "<security:authentication property='principal.username'/>";
        </security:authorize>

        if (!isLoggedIn) {
            alert("Bạn cần đăng nhập để gửi yêu cầu!");
            window.location.href = "<c:url value='/login'/>";
            return;
        }

        var data = {
            "userName": currentUserName,
        };

        // 3. Gọi AJAX
        $.ajax({
            type: "POST",
            url: "<c:url value='/api/customer/transaction'/>",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success: function(response) {
                alert("Gửi yêu cầu thành công! Chúng tôi sẽ liên hệ với " + currentUserName + " sớm.");
            },
            error: function(response) {
                console.log(response);
                alert("Gửi yêu cầu thất bại! Vui lòng thử lại.");
            }
        });
    });

</script>