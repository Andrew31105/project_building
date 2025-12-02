<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title>Thông tin khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">

        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="/admin/home">Trang chủ</a>
                </li>
                <li>
                    <a href="/admin/customer-list">Danh sách khách hàng</a>
                </li>
                <li class="active">Thông tin khách hàng</li>
            </ul>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>Thông tin khách hàng</h1>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <form:form id="formEdit" modelAttribute="customerEdit" cssClass="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="fullName"> Tên khách hàng </label>
                            <div class="col-sm-9">
                                <form:input path="name" id="fullName" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="phone"> Số điện thoại </label>
                            <div class="col-sm-9">
                                <form:input path="customerPhone" id="phone" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="email"> Email </label>
                            <div class="col-sm-9">
                                <form:input path="email" id="email" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="companyName"> Tên công ty </label>
                            <div class="col-sm-9">
                                <form:input path="companyName" id="companyName" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="demand"> Nhu cầu </label>
                            <div class="col-sm-9">
                                <form:input path="demand" id="demand" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
    <label class="col-sm-3 control-label no-padding-right" for="status">Trạng thái</label>
    <div class="col-sm-9">
        <form:select path="status" id="status" cssClass="form-control">
                    <form:option value="">--- Chọn trạng thái ---</form:option>
                    <form:option value="CHUA_XU_LY">Chưa xử lý</form:option>
                    <form:option value="DANG_XU_LY">Đang xử lý</form:option>
                    <form:option value="DA_XU_LY">Đã xử lý (Đã mua)</form:option>
                    </form:select>
                    </div>
                    </div>

                        <form:hidden path="id" id="customerId"/>


                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty customerEdit.id}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateCustomer">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật khách hàng
                                    </button>
                                </c:if>
                                <c:if test="${empty customerEdit.id}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateCustomer">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm khách hàng
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="button" onclick="window.location.href='/admin/customer-list'">
                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                    Hủy
                                </button>
                            </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();

        // 1. Gom dữ liệu từ form thành JSON object
        var formData = $('#formEdit').serializeArray();
        var data = {};
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        // 2. Kiểm tra ID để biết gọi API nào
        var id = $('#customerId').val();

        if (id != "") {
            // Có ID -> Gọi API Cập nhật (PUT)
            updateCustomer(data);
        } else {
            // Không có ID -> Gọi API Thêm mới (POST)
            addCustomer(data);
        }
    });

    function addCustomer(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert("Thêm khách hàng thành công!");
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                alert("Lỗi hệ thống! Vui lòng kiểm tra lại.");
                console.log(response);
            }
        });
    }

    function updateCustomer(data) {
        $.ajax({
            type: "POST", // Hoặc PUT tùy backend bạn quy định
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert("Cập nhật thành công!");
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                alert("Cập nhật thất bại!");
                console.log(response);
            }
        });
    }
</script>

</body>
</html>