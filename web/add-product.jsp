<%-- 
    Document   : add-product
    Created on : Jun 21, 2025, 4:14:51 PM
    Author     : ZhuanZ（无密码）
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
        <h1 class="mt-5 text-center">Thêm sản phẩm mới</h1>
        <form action="AddProductServlet" method="post" class="w-50 mx-auto" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Mã sản phẩm:</label>
                <input type="text" name="productId" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên sản phẩm:</label>
                <input type="text" name="productName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Hình ảnh:</label>
                <input type="file" name="productImage" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả:</label>
                <textarea name="brief" class="form-control" rows="5"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Danh mục:</label>
                <select name="typeId" class="form-control" required>
                    <c:forEach var="c" items="${categoryDAO.listAll}">
                        <option value="${c.typeId}">${c.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Đơn vị:</label>
                <input type="text" name="unit" class="form-control" value="pcs">
            </div>
            <div class="mb-3">
                <label class="form-label">Giá:</label>
                <input type="number" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Giảm giá (%):</label>
                <input type="number" name="discount" class="form-control" min="0" max="100" value="0">
            </div>
            <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
        </form>
    </body>
</html>
