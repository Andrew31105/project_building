<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%-- THÊM DÒNG NÀY ĐỂ KHẮC PHỤC LỖI C:IF --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Chỉnh sửa tòa nhà</title>
</head>
<body>

<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Trang chủ</a></li>
                <li class="active">Quản lý tòa nhà</li>
            </ul>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>Danh Sách Tòa Nhà <small><i class="ace-icon fa fa-angle-double-right"></i> Nhập thông tin chi tiết</small></h1>
            </div>

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <form:form modelAttribute="building" id="listForm" method="POST" enctype="multipart/form-data">
                        <div class="form-horizontal">

                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Tên Tòa Nhà</label><div class="col-xs-9"><form:input class="form-control" path="name"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Quận</label><div class="col-xs-3"><form:select class="form-control" path="district"><form:option value="">---Chọn Quận---</form:option><form:options items="${districts}"/></form:select></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phường</label><div class="col-xs-9"><form:input class="form-control" path="ward"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Đường</label><div class="col-xs-9"><form:input class="form-control" path="street"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Kết cấu</label><div class="col-xs-9"><form:input class="form-control" path="structure"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Số tầng hầm</label><div class="col-xs-9"><form:input class="form-control" path="numberOfBasement"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Diện tích sàn</label><div class="col-xs-9"><form:input class="form-control" path="floorArea"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Hướng</label><div class="col-xs-9"><form:input class="form-control" path="direction"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Hạng</label><div class="col-xs-9"><form:input class="form-control" path="level"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Diện tích thuê</label><div class="col-xs-9"><form:input class="form-control" path="rentArea"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Giá thuê</label><div class="col-xs-9"><form:input class="form-control" path="rentPrice"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phí dịch vụ</label><div class="col-xs-9"><form:input class="form-control" path="serviceFee"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phí ô tô</label><div class="col-xs-9"><form:input class="form-control" path="carFee"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phí mô tô</label><div class="col-xs-9"><form:input class="form-control" path="motoFee"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phí ngoài giờ</label><div class="col-xs-9"><form:input class="form-control" path="overtimeFee"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Tiền điện</label><div class="col-xs-9"><form:input class="form-control" path="electricityFee"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Đặt cọc</label><div class="col-xs-9"><form:input class="form-control" path="deposit"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Thời gian thuê</label><div class="col-xs-9"><form:input class="form-control" path="rentTime"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Thời gian trang trí</label><div class="col-xs-9"><form:input class="form-control" path="decorationTime"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Tên quản lý</label><div class="col-xs-9"><form:input class="form-control" path="managerName"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Số điện thoại quản lý</label><div class="col-xs-9"><form:input class="form-control" path="managerPhone"/></div></div>
                            <div class="form-group"><label class="col-xs-3 control-label no-padding-right">Phí môi giới</label><div class="col-xs-9"><form:input class="form-control" path="brokerageFee"/></div></div>

                            <div class="form-group">
                                <label class="col-xs-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-xs-9">
                                    <input type="file" class="col-xs-12" id="uploadImage" name="imageFile" accept="image/*"/>
                                    <div style="margin-top: 15px;">
                                        <c:if test="${not empty building.avatar}">
                                            <img src="${building.avatar}" id="viewImage" style="width: 300px; height: 200px; object-fit: cover; border: 1px solid #ccc;">
                                        </c:if>
                                        <c:if test="${empty building.avatar}">
                                            <img src="https://via.placeholder.com/300x200?text=No+Image" id="viewImage" style="width: 300px; height: 200px; object-fit: cover; border: 1px solid #ccc;">
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3 control-label no-padding-right">Ảnh chi tiết (Chọn nhiều)</label>
                                <div class="col-xs-9">
                                    <input type="file" class="col-xs-12" name="imageFiles" multiple="multiple" id="uploadListImage" accept="image/*" />

                                    <div id="previewContainer" style="display: flex !important; flex-wrap: wrap !important; gap: 10px !important; margin-top: 10px !important; width: 100% !important;">

                                        <c:if test="${not empty building.images}">
                                            <c:forTokens items="${building.images}" delims="," var="imgUrl">
                                                <div class="image-box-custom image-box-old" data-url="${imgUrl}"
                                                     style="position: relative !important; width: 150px !important; height: 150px !important; border: 2px solid #ddd !important; border-radius: 5px !important; overflow: hidden !important; background-color: #fff !important; flex-shrink: 0 !important;">
                                                    <img src="${imgUrl}" style="width: 100% !important; height: 100% !important; object-fit: cover !important;" />
                                                    <button type="button" onclick="removeOldImage(this)"
                                                            style="position: absolute !important; top: 2px !important; right: 2px !important; background: red !important; color: white !important; border: none !important; width: 20px !important; height: 20px !important; border-radius: 50% !important; font-weight: bold !important; cursor: pointer !important; opacity: 0.8 !important;">
                                                        X
                                                    </button>
                                                </div>
                                            </c:forTokens>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3 control-label no-padding-right">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:checkboxes items="${buildingType}" path="typeCode"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty building.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Sửa tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty building.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>

                            <form:hidden path="id" id="buildingId"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var selectedFiles = []; // KHAI BÁO MẢNG TOÀN CỤC ĐỂ LƯU FILE

    $(document).ready(function() {

        // --- 1. XỬ LÝ AVATAR ---
        $("#uploadImage").change(function(){
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#viewImage').attr('src', e.target.result).css('display', 'block');
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        // --- 2. XỬ LÝ ẢNH CHI TIẾT (LOGIC TÍCH LŨY FILE) ---
        $("#uploadListImage").on('change', function(e){
            if (this.files) {
                // Đẩy từng file vào mảng tích lũy
                for (let i = 0; i < this.files.length; i++) {
                    selectedFiles.push(this.files[i]);
                }
            }
            // QUAN TRỌNG: Render xong phải reset input để chọn tiếp được file khác
            $(this).val('');
            renderPreview();
        });

        function renderPreview() {
            $('#previewContainer').find('.image-box-new').remove();
            selectedFiles.forEach(function(file, index) {
                var imgSrc = URL.createObjectURL(file);
                var html =
                    '<div class="image-box-custom image-box-new" style="position: relative; width: 150px; height: 150px; border: 2px solid #28a745; margin-right: 10px; margin-bottom: 10px;">' +
                        '<img src="' + imgSrc + '" style="width: 100%; height: 100%; object-fit: cover;" />' +
                        '<button type="button" onclick="removeNewImage(' + index + ')" ' +
                            'style="position: absolute; top: 0; right: 0; background: red; color: white;">X</button>' +
                    '</div>';
                $('#previewContainer').append(html);
            });
        }

        // Xóa ảnh khỏi mảng tích lũy
        window.removeNewImage = function(index) {
            selectedFiles.splice(index, 1);
            renderPreview();
        }

        window.removeOldImage = function(button) {
            if (confirm("Xóa ảnh cũ này?")) {
                $(button).closest('.image-box-old').remove();
            }
        }

        // --- 3. SỰ KIỆN CLICK NÚT LƯU ---
        $('#btnAddOrUpdateBuilding').click(function(e) {
            e.preventDefault();
            var formData = new FormData();

            // A. Dữ liệu text (Trừ các trường file/ảnh ra)
            var formArray = $('#listForm').serializeArray();
            $.each(formArray, function(i, v) {
                if (v.name != 'imageFile' && v.name != 'imageFiles' && v.name != 'images') {
                    formData.append(v.name, v.value);
                }
            });

            // B. Ảnh Cũ (Lấy từ DOM các ảnh còn hiển thị)
            var finalOldImages = [];
            $('.image-box-old').each(function() {
                if ($(this).is(':visible')) {
                    var url = $(this).data('url');
                    if (url) finalOldImages.push(url);
                }
            });
            formData.append('images', finalOldImages.length > 0 ? finalOldImages.join(',') : "");

            // ============================================================
            // C. ẢNH MỚI (ĐÂY LÀ CHỖ SỬA LỖI)
            // Phải duyệt mảng selectedFiles, KHÔNG ĐƯỢC lấy từ $('#uploadListImage')
            // ============================================================
            if (selectedFiles.length > 0) {
                for (var i = 0; i < selectedFiles.length; i++) {
                    // Dùng đúng tên "imageFiles" để Spring Boot map vào List<MultipartFile>
                    formData.append('imageFiles', selectedFiles[i]);
                    console.log("Đã thêm file: " + selectedFiles[i].name); // Debug log
                }
            } else {
                console.log("Không có ảnh mới nào được chọn.");
            }

            // D. Avatar
            var avatarInput = document.getElementById('uploadImage');
            if (avatarInput && avatarInput.files.length > 0) {
                formData.append('imageFile', avatarInput.files[0]);
            }

            // Gửi API
            addOrUpdateBuilding(formData);
        });

        function addOrUpdateBuilding(formData) {
            $.ajax({
                type: "POST",
                url: "${buildingAPI}",
                data: formData,
                contentType: false,
                processData: false,
                success: function(respond) {
                    alert("Thao tác thành công!");
                    window.location.href = "/admin/building-list";
                },
                error: function(respond) {
                    alert("Lỗi hệ thống!");
                    console.log(respond);
                }
            });
        }

        $('#btnCancel').click(function () {
            window.location.href = "/admin/building-list"
        });
    });
</script>

</body>
</html>