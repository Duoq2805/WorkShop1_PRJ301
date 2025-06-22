<%-- 
    Document   : dashboard
    Created on : Jun 21, 2025, 3:58:40 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container text-center">
    <c:set var="user" value="${sessionScope.user}"/>
    <c:if test="${user == null || user.roleInSystem < 1}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <h1 class="mt-5">Dashboard Admin</h1>
    <p>Xin chào, ${user.firstName} ${user.lastName}</p>
    <a href="add-account.jsp" class="btn btn-primary m-2">Thêm tài khoản</a>
    <a href="categories.jsp" class="btn btn-primary m-2">Quản lý danh mục</a>
    <a href="products-manage.jsp" class="btn btn-primary m-2">Quản lý sản phẩm</a>
    <a href="LogoutServlet" class="btn btn-danger m-2">Đăng xuất</a>
</body>
</html>
