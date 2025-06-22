<%-- 
    Document   : add-category
    Created on : Jun 21, 2025, 4:06:24 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm danh mục</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
        <h1 class="mt-5 text-center">Thêm danh mục mới</h1>
        <form action="AddCategoryServlet" method="post" class="w-50 mx-auto">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label>
                <input type="text" name="categoryName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ghi chú:</label>
                <textarea name="memo" class="form-control"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Thêm danh mục</button>
        </form>
    </body>
</html>
