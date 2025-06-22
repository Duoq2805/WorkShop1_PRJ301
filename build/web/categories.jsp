<%-- 
    Document   : categories
    Created on : Jun 21, 2025, 4:05:05 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
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
    <h1 class="mt-5">Quản lý danh mục</h1>
    <a href="add-category.jsp" class="btn btn-primary mb-3">Thêm danh mục</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Ghi chú</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${categoryDAO.listAll}">
            <tr>
                <td>${c.typeId}</td>
                <td>${c.categoryName}</td>
                <td>${c.memo}</td>
                <td>
                    <a href="edit-category.jsp?id=${c.typeId}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="DeleteCategoryServlet?id=${c.typeId}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
