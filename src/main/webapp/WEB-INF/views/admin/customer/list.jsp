<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>

<div class="main-content">
    <div class="main-content-inner">

        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value='/admin/home'/>">Trang chủ</a>
                </li>
                <li class="active">Quản lý khách hàng</li>
            </ul>
        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Danh Sách Khách Hàng
                    <small><i class="ace-icon fa fa-angle-double-right"></i> Quản lý thông tin khách hàng</small>
                </h1>
            </div>

            <div class="widget-box">
                <div class="widget-header">
                    <h5 class="widget-title">Tìm Kiếm</h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">

                        <form:form id="listForm" modelAttribute="CustomerRequest" action="${customerListURL}" method="GET">

                            <div class="row">
                                <div class="col-xs-4">
                                    <label>Tên khách hàng</label>
                                    <form:input path="name" class="form-control"/>
                                </div>

                                <div class="col-xs-4">
                                    <label>Di động</label>
                                    <form:input path="customerPhone" class="form-control"/>
                                </div>

                                <div class="col-xs-4">
                                    <label>Trạng thái</label>
                                    <form:select path="status" class="form-control">
                                        <form:option value="">--- Chọn trạng thái ---</form:option>
                                        <form:option value="CHUA_XU_LY">Chưa xử lý</form:option>
                                        <form:option value="DANG_XU_LY">Đang xử lý</form:option>
                                        <form:option value="DA_XU_LY">Đã xử lý (Đã mua)</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 10px;">
                                <div class="col-xs-4">
                                    <label>Email</label>
                                    <form:input path="email" class="form-control"/>
                                </div>

                                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                    <div class="col-xs-4">
                                        <label>Nhân viên phụ trách</label>
                                        <form:select path="staffId" class="form-control">
                                            <form:option value="">--- Chọn nhân viên ---</form:option>
                                            <form:options items="${liststaff}"/>
                                        </form:select>
                                    </div>
                                </security:authorize>
                            </div>

                            <form:hidden path="page" id="page"/>
                            <form:hidden path="limit" id="limit"/>

                            <div class="row">
                                <div class="col-xs-12" style="margin-top:20px;">
                                    <button type="button" id="btnSearchCustomer" class="btn btn-danger">
                                        <i class="ace-icon fa fa-search"></i> Tìm kiếm
                                    </button>
                                </div>
                            </div>

                        </form:form>

                    </div>
                </div>
            </div>

            <div class="pull-right" style="margin-top:10px;">
                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                <a href="<c:url value='/admin/customer-edit'/>" class="btn btn-xs btn-info" title="Thêm khách hàng">
                    <i class="ace-icon fa fa-plus"></i>
                </a>
                </security:authorize>


                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                <button class="btn btn-xs btn-danger" id="btnDeleteCustomer" title="Xóa khách hàng">
                    <i class="ace-icon fa fa-trash-o"></i>
                </button>
                </security:authorize>
            </div>

            <table id="tableList" class="table table-striped table-bordered table-hover" style="margin-top:20px;">
                <thead>
                <tr>
                    <th class="center">
                        <input type="checkbox" class="ace" id="checkAll">
                    </th>
                    <th>Tên khách hàng</th>
                    <th>Di động</th>
                    <th>Email</th>
                    <th>Nhu cầu</th>
                    <th>Người thêm</th>
                    <th>Ngày thêm</th>
                    <th>Tình trạng</th>
                    <th>Thao tác</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${customerRequest.listResult}">
                    <tr>
                        <td class="center">
                            <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                            <span class="lbl"></span>
                        </td>
                        <td>${item.name}</td>
                        <td>${item.customerPhone}</td>
                        <td>${item.email}</td>
                        <td>${item.demand}</td>
                        <td>${item.managementStaff}</td>
                        <td>${item.createddate}</td>
                        <td>${item.status}</td>
                        <td>
                            <div class="btn-group">
                                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                    <button class="btn btn-xs btn-success"
                                            onclick="assignmentCustomer(${item.id})" title="Giao khách hàng">
                                        <i class="ace-icon fa fa-check"></i>
                                    </button>
                                </security:authorize>

                                <a class="btn btn-xs btn-info" href="<c:url value='/admin/customer-edit-${item.id}'/>" title="Sửa thông tin">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>


                                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                    <button class="btn btn-xs btn-danger" onclick="deleteCustomer(${item.id})" title="Xóa khách hàng">
                                        <i class="ace-icon fa fa-trash-o"></i>
                                    </button>
                                </security:authorize>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="row">
                <div class="col-xs-12 text-center">
                    <c:if test="${customerRequest.totalPage > 0}">
                        <ul class="pagination">

                            <c:if test="${customerRequest.page > 1}">
                                <li>
                                    <a href="#" onclick="loadPage(${customerRequest.page - 1})">
                                        <i class="ace-icon fa fa-angle-double-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${customerRequest.totalPage}">
                                <li class="${customerRequest.page == i ? 'active' : ''}">
                                    <a href="#" onclick="loadPage(${i})">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${customerRequest.page < customerRequest.totalPage}">
                                <li>
                                    <a href="#" onclick="loadPage(${customerRequest.page + 1})">
                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <input type="hidden" id="customerId" name="customerId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script>
    // ... (Giữ nguyên Script cũ) ...
    // 1. XỬ LÝ PHÂN TRANG & TÌM KIẾM

    // Hàm gọi khi ấn vào số trang
    function loadPage(page) {
        $('#page').val(page); // Gán số trang user click vào input ẩn
        $('#listForm').submit(); // Submit form để gửi cả điều kiện tìm kiếm + số trang về server
    }

    // Hàm gọi khi ấn nút Tìm kiếm
    $('#btnSearchCustomer').click(function (e) {
        e.preventDefault();
        $('#page').val(1); // Reset về trang 1 khi tìm kiếm mới
        $('#listForm').submit();
    });

    // 2. XỬ LÝ CHECKBOX ALL (Optional - làm đẹp thêm)
    $('#checkAll').click(function(){
        $('input:checkbox').not(this).prop('checked', this.checked);
    });

    // 3. XỬ LÝ GIAO KHÁCH HÀNG (ASSIGNMENT)
    function assignmentCustomer(customerId) {
        $('#customerId').val(customerId);
        loadStaff(customerId); // Gọi hàm load nhân viên
        $('#assignmentCustomerModal').modal();
    }

    function loadStaff(customerId) {
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + customerId + "/staffs",
            dataType: "json", // Đảm bảo nhận JSON
            success: function (response) {
                var rows = "";
                var data = response.data ? response.data : response;

                $.each(data, function (index, item) {
                    rows += '<tr>' +
                                '<td class="center"><input type="checkbox" value="' + item.staffId + '" id="checkbox_' + item.staffId + '" ' + (item.checked ? 'checked' : '') + '/></td>' +
                                '<td>' + item.fullName + '</td>' +
                            '</tr>';
                });
                $('#staffList tbody').html(rows);
            },
            error: function(res) {
                console.log(res);
                alert("Lỗi tải danh sách nhân viên!");
            }
        });
    }

    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffId'] = staffs;

        $.ajax({
            type: "POST",
            url: "${customerAPI}/assignments",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (res) {
                alert("Giao khách hàng thành công!");
                $('#assignmentCustomerModal').modal('hide');
            },
            error: function (res) {
                alert("Thất bại!");
                console.log(res);
            }
        });
    });

    // 4. XỬ LÝ XÓA KHÁCH HÀNG
    function deleteCustomer(id) {
        var customerId = [id];
        deleteCustomers(customerId);
    }

    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault();
        var customerIds = $('#tableList').find('tbody input[name="checkList"]:checked').map(function () {
            return $(this).val();
        }).get();

        if (customerIds.length === 0) {
            alert("Vui lòng chọn khách hàng cần xóa!");
            return;
        }
        deleteCustomers(customerIds);
    });

    function deleteCustomers(data) {
        if (!confirm("Bạn có chắc chắn muốn xóa khách hàng này không?")) {
            return;
        }
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${customerListURL}?message=delete_success";
            },
            error: function (error) {
                window.location.href = "${customerListURL}?message=error_system";
            }
        });
    }
</script>

</body>
</html>