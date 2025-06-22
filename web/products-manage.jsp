<%-- 
    Document   : products-manage
    Created on : Jun 21, 2025, 4:13:40 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
    <c:if test="${sessionScope.user == null}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <h1 class="mt-5">Quản lý sản phẩm</h1>
    <a href="add-product.jsp" class="btn btn-primary mb-3">Thêm sản phẩm</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Giảm giá</th>
                <th>Danh mục</th>
                <th>Người đăng</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${productDAO.listAll}">
            <tr>
                <td>${p.productId}</td>
                <td>${p.productName}</td>
                <td>${p.price} VNĐ</td>
                <td>${p.discount}%</td>
                <td>${p.typeId}</td>
                <td>${p.account}</td>
                <td>
                    <a href="edit-product.jsp?id=${p.productId}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="DeleteProductServlet?id=${p.productId}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
