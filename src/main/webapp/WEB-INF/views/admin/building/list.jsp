<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                    <a href="<c:url value='/trang-chu'/>">Trang chủ</a>
                </li>
                <li class="active">Quản lý tòa nhà</li>
            </ul>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh Sách Tòa Nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div>

            <div class="widget-box ui-sortable-handle" style="opacity: 1;">
                <div class="widget-header">
                    <h5 class="widget-title">Tìm Kiếm</h5>
                    <div class="widget-toolbar">
                        <a href="#" data-action="collapse">
                            <i class="ace-icon fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="widget-body" style="font-family:'Times New Roman', Times, serif;">
                    <div class="widget-main" >
                        <form:form id="listForm" modelAttribute="buildingSearchRequest" action="${buildingListURL}" method="GET">

                            <div class="row">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label class="name">Tên tòa nhà</label>
                                            <form:input class="form-control" path="name"/>
                                        </div>
                                        <div class="col-xs-6">
                                            <label class="name">Diện tích sàn</label>
                                            <form:input class="form-control" path="floorArea"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-2">
                                            <label class="name">Quận</label>
                                            <form:select class="form-control" path="district">
                                                <form:option value="">---Chọn Quận---</form:option>
                                                <form:options items="${districts}" />
                                            </form:select>
                                        </div>
                                        <div class="col-xs-5">
                                            <label class="name">Phường</label>
                                            <form:input class="form-control" path="ward"/>
                                        </div>
                                        <div class="col-xs-5">
                                            <label class="name">Đường</label>
                                            <form:input class="form-control" path="street"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-4">
                                            <label class="name">Số tầng hầm</label>
                                            <form:input class="form-control" path="numberOfBasement"/>
                                        </div>
                                        <div class="col-xs-4">
                                            <label class="name">Hướng</label>
                                            <form:input class="form-control" path="direction"/>
                                        </div>
                                        <div class="col-xs-4">
                                            <label class="name">Hạng</label>
                                            <form:input class="form-control" path="level"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-3">
                                            <label class="name">Diện tích từ</label>
                                            <form:input class="form-control" path="areaFrom"/>
                                        </div>
                                        <div class="col-xs-3">
                                            <label class="name">Diện tích đến</label>
                                            <form:input class="form-control" path="areaTo"/>
                                        </div>
                                        <div class="col-xs-3">
                                            <label class="name">Giá thuê từ</label>
                                            <form:input class="form-control" path="rentPriceFrom"/>
                                        </div>
                                        <div class="col-xs-3">
                                            <label class="name">Giá thuê đến</label>
                                            <form:input class="form-control" path="rentPriceTo"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-4">
                                            <label class="name">Tên quản lý</label>
                                            <form:input class="form-control" path="managerName"/>
                                        </div>
                                        <div class="col-xs-4">
                                            <label class="name">Điện thoại quản lý</label>
                                            <form:input class="form-control" path="managerPhone"/>
                                        </div>
                                        <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                            <div class="col-xs-4">
                                                <label class="name">Chọn nhân viên phụ trách</label>
                                                <form:select class="form-control" path="staffId">
                                                    <form:option value="">---Nhân Viên---</form:option>
                                                    <form:options items="${listStaffs}" />
                                                </form:select>
                                            </div>
                                        </security:authorize>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label class="name">
                                                <form:checkboxes items="${buildingType}" path="typeCode"/>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <form:hidden path="page" id="page"/>
                                <form:hidden path="limit" id="limit"/>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                <i class="ace-icon fa fa-search"></i> Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <div class="pull-right">
                <a href="/admin/building-edit">
                    <button class="btn btn-xs btn-info" title="Thêm tòa nhà">
                        <i class="ace-icon fa fa-plus"></i>
                    </button>
                </a>
                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                    <i class="ace-icon fa fa-trash-o"></i>
                </button>
            </div>

            <table id="tableList" style="margin-top: 20px;" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace" id="checkAll">
                            <span class="lbl"></span>
                        </label>
                    </th>
                    <th>Tên tòa nhà</th>
                    <th>Địa chỉ</th>
                    <th class="hidden-480">Số tầng hầm</th>
                    <th>Tên quản Lý</th>
                    <th class="hidden-480">SĐT quản lý</th>
                    <th>D.Tích Sàn</th>
                    <th>D.Tích Trống</th>
                    <th>D.Tích Thuê</th>
                    <th>Phí MG</th>
                    <th>Thao tác</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${buildingList}">
                    <tr>
                        <td class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>${item.name}</td>
                        <td>${item.address}</td>
                        <td>${item.numberOfBasement}</td>
                        <td>${item.managerName}</td>
                        <td>${item.managerPhone}</td>
                        <td>${item.floorArea}</td>
                        <td>${item.emptyArea}</td>
                        <td>${item.rentArea}</td>
                        <td>${item.brokerageFee}</td>
                        <td>
                            <div class="hidden-sm hidden-xs btn-group">
                                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                    <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assingmentBuillding(${item.id})">
                                        <i class="ace-icon fa fa-check bigger-120"></i>
                                    </button>
                                </security:authorize>

                                <a href="/admin/building-edit-${item.id}">
                                    <button class="btn btn-xs btn-info" title="Sửa tòa nhà">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </button>
                                </a>

                                <security:authorize access="hasAnyAuthority('MANAGER', 'ADMIN')">
                                    <button class="btn btn-xs btn-danger" onclick="deleteBuilding(${item.id})" title="Xóa tòa nhà">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
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
                    <c:if test="${buildingSearchRequest.totalPage > 0}">
                        <ul class="pagination">
                            <c:if test="${buildingSearchRequest.page > 1}">
                                <li>
                                    <a href="#" onclick="loadPage(${buildingSearchRequest.page - 1})">
                                        <i class="ace-icon fa fa-angle-double-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${buildingSearchRequest.totalPage}">
                                <li class="${buildingSearchRequest.page == i ? 'active' : ''}">
                                    <a href="#" onclick="loadPage(${i})">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${buildingSearchRequest.page < buildingSearchRequest.totalPage}">
                                <li>
                                    <a href="#" onclick="loadPage(${buildingSearchRequest.page + 1})">
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

<div class="modal fade" id="assingmentBuilldingModal" role="dialog" style="font-family:'Times New Roman', Times, serif;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <input type="hidden" id="buildingid" name="building">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssingmentBuillding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script>
    // --- 1. XỬ LÝ PHÂN TRANG & TÌM KIẾM (QUAN TRỌNG) ---
    function loadPage(page) {
        $('#page').val(page); // Gán trang muốn đến vào input ẩn
        $('#listForm').submit(); // Gửi form đi
    }

    $('#btnSearchBuilding').click(function(e){
        e.preventDefault();
        $('#page').val(1); // Khi tìm kiếm mới, luôn reset về trang 1
        $('#listForm').submit();
    });

    // --- 2. GIAO TÒA NHÀ ---
    function assingmentBuillding(buildingid) {
        $('#buildingid').val(buildingid);
        loadstaff(buildingid);
        $('#assingmentBuilldingModal').modal();
    }

    function loadstaff(buildingid) {
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingid + '/staffs',
            dataType: "json", // Đảm bảo nhận JSON
            success: function(response) {
                var rows = '';
                // Kiểm tra cấu trúc JSON trả về (response.data hay trực tiếp response)
                var dataList = response.data ? response.data : response;

                $.each(dataList, function(index, item) {
                    var isChecked = item.checked ? 'checked' : '';
                    rows += '<tr>' +
                                '<td class="center"><input type="checkbox" value="' + item.staffId + '" ' + isChecked + '/></td>' +
                                '<td>' + item.fullName + '</td>' +
                            '</tr>';
                });
                $('#staffList tbody').html(rows);
            },
            error: function(respond) {
                console.log("Failed load staff", respond);
                alert("Lỗi tải danh sách nhân viên!");
            }
        });
    }

    $('#btnAssingmentBuillding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingid').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        sendBuildingAssignment(data);
    });

    function sendBuildingAssignment(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/assignments",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(response) {
                alert("Phân công nhân viên thành công!");
                $('#assingmentBuilldingModal').modal('hide');
            },
            error: function(response) {
                console.log("Failed assignment", response);
                alert("Lỗi hệ thống!");
            }
        });
    }

    // --- 3. XÓA TÒA NHÀ ---
    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[name="checkList"]:checked').map(function(){
            return $(this).val();
        }).get();

        if (buildingIds.length === 0) {
            alert("Vui lòng chọn tòa nhà cần xóa!");
            return;
        }
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data){
        if (!confirm("Bạn có chắc chắn muốn xóa tòa nhà này không?")) return;

        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(response) {
                alert("Xóa tòa nhà thành công!");
                window.location.href = "${buildingListURL}?message=delete_success";
            },
            error: function(response) {
                console.log("Failed delete", response);
                alert("Xóa thất bại!");
            }
        });
    }

    // Checkbox All
    $('#checkAll').click(function(){
        $('input:checkbox').not(this).prop('checked', this.checked);
    });

</script>

</body>
</html>