<%-- 
    Document   : edit-category
    Created on : Jun 21, 2025, 4:08:40 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa danh mục</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
    <c:set var="c" value="${categoryDAO.getObjectById(param.id)}"/>
    <c:if test="${c != null}">
        <h1 class="mt-5 text-center">Sửa danh mục</h1>
        <form action="EditCategoryServlet" method="post" class="w-50 mx-auto">
            <input type="hidden" name="typeId" value="${c.typeId}">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label>
                <input type="text" name="categoryName" class="form-control" value="${c.categoryName}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ghi chú:</label>
                <textarea name="memo" class="form-control">${c.memo}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
    </c:if>
    <c:if test="${c == null}">
        <p class="text-danger">Danh mục không tồn tại!</p>
    </c:if>
</body>
</html>
