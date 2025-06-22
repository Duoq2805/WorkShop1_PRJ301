<%-- 
    Document   : product-detail
    Created on : Jun 21, 2025, 3:39:01 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
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
        <c:set var="discountedPrice" value="${p.price * (1 - p.discount / 100.0)}"/>
        <h1 class="mt-5">${p.productName}</h1>
        <div class="row">
            <div class="col-md-6">
                <img src="${p.productImage}" class="img-fluid" alt="${p.productName}">
            </div>
            <div class="col-md-6">
                <p><strong>Mô tả:</strong> ${p.brief}</p>
                <p><strong>Giá:</strong> <fmt:formatNumber value="${discountedPrice}" type="number"/> VNĐ (Gốc: <fmt:formatNumber value="${p.price}" type="number"/> VNĐ)</p>
                <p><strong>Giảm giá:</strong> ${p.discount}%</p>
                <p><strong>Đơn vị:</strong> ${p.unit}</p>
                <p><strong>Ngày đăng:</strong> <fmt:formatDate value="${p.postedDate}" pattern="dd/MM/yyyy"/></p>
                <p><strong>Người đăng:</strong> ${p.account}</p>
            </div>
        </div>
        <a href="products.jsp" class="btn btn-secondary mt-3">Quay lại</a>
    </c:if>
    <c:if test="${p == null}">
        <p class="text-danger">Sản phẩm không tồn tại!</p>
    </c:if>
</body>
</html>
