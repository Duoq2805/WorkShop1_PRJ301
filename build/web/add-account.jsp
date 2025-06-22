<%-- 
    Document   : add-account
    Created on : Jun 21, 2025, 4:02:23 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm tài khoản<</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
        <h1 class="mt-5 text-center">Thêm tài khoản mới</h1>
        <form action="AddAccountServlet" method="post" class="w-50 mx-auto">
            <div class="mb-3">
                <label class="form-label">Tài khoản:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Họ:</label>
                <input type="text" name="lastName" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Tên:</label>
                <input type="text" name="firstName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày sinh:</label>
                <input type="date" name="birthday" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Giới tính:</label>
                <div>
                    <input type="radio" name="gender" value="true" checked> Nam
                    <input type="radio" name="gender" value="false"> Nữ
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Số điện thoại:</label>
                <input type="text" name="phone" class="form-control" pattern="0[3|5|7|8|9][0-9]{8}">
            </div>
            <div class="mb-3">
                <label class="form-label">Vai trò:</label>
                <input type="number" name="role" class="form-control" value="0">
            </div>
            <button type="submit" class="btn btn-primary">Thêm tài khoản</button>
        </form>
    </body>
</html>
