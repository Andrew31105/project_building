<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
				<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">
							Username or password incorrect
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">
							You Not authorize
					</div>
				</c:if>
				<c:if test="${param.sessionTimeout != null}">
					<div class="alert alert-danger">
							Session Timeout
					</div>
				</c:if>
				<div class="container-fluid" >
					<section class="gradient-custom">
						<div class="page-wrapper">
							<div class="row d-flex justify-content-center align-items-center">
								<div class="col-12 col-md-8 col-lg-6 col-xl-5">
									<div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
										<div class="card-body p-5">
											<div class="mb-md-5 mt-md-4 pb-5 text-center">
												<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
												<p class="text-white-50 mb-5">Please enter your login and password!</p>
												<form action="j_spring_security_check" id="formLogin" method="post">
												<div class="form-outline form-white mb-4">
													<label class="form-label" for="userName">Username</label>
													<input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập">
												</div>

												<div class="form-outline form-white mb-4">
													<label class="form-label" for="password">Password</label>
													<input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu">
												</div>

												<div class="form-check d-flex justify-content-center mb-5">
													<div><input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" /></div>
													<div><label class="form-check-label">
                                                        Remember Password
                                                    </label></div>
												</div>

												<p class="small mb-2 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>

												<button type="submit" class="btn btn-primary" >Đăng nhập</button>
												</form>
												<div class="d-flex justify-content-center text-center mt-2 pt-1">
													<a href="#!" class="login-extension text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
													<a href="#!" class="login-extension text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
													<a href="#!" class="login-extension text-white"><i class="fab fa-google fa-lg"></i></a>
												</div>
											</div>
											<div class="text-center">
												<p class="mb-0 tex-center account">chưa có tài khoản <a href="/register" class="text-white-50 fw-bold">Sign Up</a></p>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<%--<script src="./assets/dist/js/boostrap-v5/bootstrap.js"></script>--%>
				<%--<script src="./assets/dist/js/fontawsome-v5/all.js"></script>--%>
			</div>
		</div>
	</div>
    <script>
        $.ajaxSetup({
            beforeSend: function (xhr) {
                const token = localStorage.getItem("accessToken");
                if (token) {
                    xhr.setRequestHeader("Authorization", "Bearer " + token);
                }
            }
        });

            $('#formLogin').submit(function (e) {
                // 1. Chặn hành vi submit mặc định của trình duyệt (để không bị reload trang)
                e.preventDefault();

                // 2. Lấy dữ liệu từ input

                var username = $('#userName').val();
                var password = $('#password').val();

                // 3. Gom dữ liệu thành Object
                var data = {
                    username: username,
                    password: password
                };

                // 4. Gọi Ajax
                $.ajax({
                    type: 'POST',
                    url: '/api/login', // Đường dẫn API Login của bạn
                    contentType: 'application/json', // BẮT BUỘC: Báo cho server biết mình gửi JSON
                    data: JSON.stringify(data), // BẮT BUỘC: Chuyển Object JS thành chuỗi JSON
                    dataType: 'json',

                    success: function (response) {
                        // 5. Xử lý khi thành công (Server trả về 200 OK)
                        console.log("Login thành công, Token:", response.token);

                        // LƯU TOKEN (Quan trọng nhất)
                        localStorage.setItem('accessToken', response.token);

                        // Có thể lưu thêm thông tin user nếu server có trả về
                        // localStorage.setItem('username', response.username);

                        var role = response.roles[0];
                        if (role === 'MANAGER') {
                            // Chuyển đến trang admin
                            window.location.href = "/admin/home";
                        } else if (role === 'STAFF') {
                            // Chuyển đến trang staff (nếu có)
                            window.location.href = "/admin/home";
                        } else {
                            // User thường -> trang chủ
                            window.location.href = "/trang-chu";
                        }
                    },

                    error: function (error) {
                        // 6. Xử lý khi thất bại (Server trả về 401/403/500)
                        console.log("Lỗi:", error);
                        if (error.status === 401) {
                            alert("Sai tên đăng nhập hoặc mật khẩu!");
                        } else {
                            alert("Đã có lỗi xảy ra, vui lòng thử lại.");
                        }
                    }
                });
            });
    </script>
</body>
</html>