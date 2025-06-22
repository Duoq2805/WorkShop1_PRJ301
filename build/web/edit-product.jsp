<%-- 
    Document   : edit-product
    Created on : Jun 21, 2025, 4:21:23 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa sản phẩm</title>\
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
    <c:set var="p" value="${productDAO.getObjectById(param.id)}"/>
    <c:if test="${p != null}">
        <h1 class="mt-5 text-center">Sửa sản phẩm</h1>
        <form action="EditProductServlet" method="post" class="w-50 mx-auto" enctype="multipart/form-data">
            <input type="hidden" name="productId" value="${p.productId}">
            <div class="mb-3">
                <label class="form-label">Tên sản phẩm:</label>
                <input type="text" name="productName" class="form-control" value="${p.productName}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Hình ảnh hiện tại:</label>
                <img src="${p.productImage}" width="100" alt="Current Image">
                <label class="form-label">Thay ảnh mới:</label>
                <input type="file" name="productImage" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả:</label>
                <textarea name="brief" class="form-control" rows="5">${p.brief}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Danh mục:</label>
                <select name="typeId" class="form-control" required>
                    <c:forEach var="c" items="${categoryDAO.listAll}">
                        <option value="${c.typeId}" ${c.typeId == p.typeId ? 'selected' : ''}>
                            ${c.categoryName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Đơn vị:</label>
                <input type="text" name="unit" class="form-control" value="${p.unit}">
            </div>
            <div class="mb-3">
                <label class="form-label">Giá:</label>
                <input type="number" name="price" class="form-control" value="${p.price}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Giảm giá (%):</label>
                <input type="number" name="discount" class="form-control" value="${p.discount}" min="0" max="100">
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
    </c:if>
    <c:if test="${p == null}">
        <p class="text-danger">Sản phẩm không tồn tại!</p>
    </c:if>
</body>
</html>
