<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body, html {
            background-color: #1e4d3b !important;
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-register {
            background-color: #35bf76;
            border-radius: 1rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            border: none;
            color: white;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.9) !important;
            border: 1px solid #ced4da;
            color: #333 !important;
            height: 45px;
            border-radius: 5px;
        }

        .form-control:focus {
            background-color: #fff !important;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
            border-color: #fff;
        }

        .btn-register {
            background-color: #fff;
            color: #35bf76;
            border: none;
            padding: 12px;
            font-weight: bold;
            font-size: 16px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-register:hover {
            background-color: #f0f0f0;
            color: #2ea468;
            transform: translateY(-2px);
        }

        .form-label {
            font-weight: 500;
            margin-left: 5px;
            margin-bottom: 2px;
        }

        /* CSS MỚI CHO DÒNG THÔNG BÁO LỖI */
        .error-msg {
            color: #ffcccc; /* Màu đỏ nhạt pha trắng cho dễ nhìn trên nền xanh */
            background-color: rgba(255, 0, 0, 0.1); /* Nền đỏ trong suốt */
            font-size: 13px;
            font-style: italic;
            margin-top: 5px;
            display: none; /* Mặc định ẩn */
            padding: 2px 10px;
            border-radius: 3px;
            text-align: left;
            border-left: 3px solid #ff4d4d;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-12 col-md-10 col-lg-6 col-xl-5">

            <div class="card card-register">
                <div class="card-body p-4 text-center">

                    <h2 class="fw-bold mb-2 text-uppercase">Đăng ký</h2>
                    <p class="text-white-50 mb-4">Nhập thông tin chi tiết của bạn</p>

                    <form id="formRegister">

                        <div class="mb-3 text-start">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" id="fullName" class="form-control" placeholder="Nhập họ và tên" />
                            <p class="error-msg" id="err-fullName">Vui lòng nhập họ và tên!</p>
                        </div>

                        <div class="mb-3 text-start">
                            <label class="form-label">Tên đăng nhập</label>
                            <input type="text" id="userName" class="form-control" placeholder="Nhập tên đăng nhập" />
                            <p class="error-msg" id="err-userName">Vui lòng nhập tên đăng nhập!</p>
                        </div>

                        <div class="mb-3 text-start">
                            <label class="form-label">Số điện thoại</label>
                            <input type="text" id="phone" class="form-control" placeholder="Nhập số điện thoại" />
                            <p class="error-msg" id="err-phone">Vui lòng nhập số điện thoại!</p>
                        </div>

                        <div class="mb-3 text-start">
                            <label class="form-label">Email</label>
                            <input type="email" id="email" class="form-control" placeholder="Nhập địa chỉ email" />
                            <p class="error-msg" id="err-email">Vui lòng nhập email!</p>
                        </div>

                        <div class="mb-3 text-start">
                            <label class="form-label">Mật khẩu</label>
                            <input type="password" id="password" class="form-control" placeholder="Nhập mật khẩu" />
                            <p class="error-msg" id="err-password">Vui lòng nhập mật khẩu!</p>
                        </div>

                        <div class="mb-4 text-start">
                            <label class="form-label">Nhập lại mật khẩu</label>
                            <input type="password" id="rePassword" class="form-control" placeholder="Xác nhận mật khẩu" />
                            <p class="error-msg" id="err-rePassword">Vui lòng nhập lại mật khẩu!</p>
                        </div>

                        <button class="btn btn-register w-100" type="button" id="btnRegister">ĐĂNG KÝ NGAY</button>
                    </form>

                    <div class="mt-3">
                        <p class="mb-0">Đã có tài khoản? <a href="/login" class="text-white fw-bold" style="text-decoration: underline;">Đăng nhập</a></p>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {

        // Hàm hiển thị lỗi
        function showError(fieldId, errorId, message) {
            $(errorId).text(message).show(); // Hiện text và show thẻ p
            $(fieldId).css("border", "2px solid #ff4d4d"); // Viền đỏ ô input
        }

        // Hàm ẩn lỗi
        function hideError(fieldId, errorId) {
            $(errorId).hide();
            $(fieldId).css("border", "1px solid #ced4da"); // Trả lại viền bình thường
        }

        // Tự động ẩn lỗi khi người dùng bắt đầu gõ phím vào ô input
        $('.form-control').on('input', function() {
            var fieldId = "#" + $(this).attr('id');
            var errorId = "#err-" + $(this).attr('id');
            hideError(fieldId, errorId);
        });

        $('#btnRegister').click(function(e) {
            e.preventDefault();

            // 1. Lấy dữ liệu
            var fullName = $('#fullName').val().trim();
            var userName = $('#userName').val().trim();
            var phone = $('#phone').val().trim();
            var email = $('#email').val().trim();
            var password = $('#password').val();
            var rePassword = $('#rePassword').val();

            var isValid = true; // Cờ kiểm tra, mặc định là true

            // 2. Validate từng trường
            if (fullName === "") {
                showError('#fullName', '#err-fullName', "Không được để trống họ tên!");
                isValid = false;
            }

            if (userName === "") {
                showError('#userName', '#err-userName', "Không được để trống tên đăng nhập!");
                isValid = false;
            }

            if (phone === "") {
                showError('#phone', '#err-phone', "Không được để trống số điện thoại!");
                isValid = false;
            }

            if (email === "") {
                showError('#email', '#err-email', "Không được để trống email!");
                isValid = false;
            }

            if (password === "") {
                showError('#password', '#err-password', "Không được để trống mật khẩu!");
                isValid = false;
            }

            if (rePassword === "") {
                showError('#rePassword', '#err-rePassword', "Vui lòng xác nhận lại mật khẩu!");
                isValid = false;
            } else if (password !== "" && password !== rePassword) {
                showError('#rePassword', '#err-rePassword', "Mật khẩu không khớp!");
                isValid = false;
            }

            // Nếu có bất kỳ lỗi nào thì dừng lại, không gọi API
            if (!isValid) {
                return;
            }

            // 3. Nếu mọi thứ OK -> Gửi dữ liệu
            var data = {
                fullName: fullName,
                userName: userName,
                phone: phone,
                email: email,
                password: password
            };

            $.ajax({
                url: '/api/user/register',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function(response) {
                    window.location.href = "/login";
                },
                error: function(xhr) {
                    alert(xhr.responseText);

                }
            });
        });
    });
</script>

</body>
</html>