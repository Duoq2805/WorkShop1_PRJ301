<%-- 
    Document   : products
    Created on : Jun 20, 2025, 8:15:08 PM
    Author     : ThaiDuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.dao.ProductDAO, model.Product, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sản phẩm</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="container">
        <h1 class="mt-5">Danh sách sản phẩm</h1>
        <div class="row">
            <c:forEach var="p" items="${productDAO.listAll}">
                <c:set var="discountedPrice" value="${p.price != null && p.discount != null ? p.price * (1 - p.discount / 100.0) : 0}"/>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <img src="${p.productImage}" class="card-img-top" alt="${p.productName}">
                        <div class="card-body">
                            <h5 class="card-title">${p.productName}</h5>
                            <c:choose>
                                <c:when test="${p.brief != null and not empty p.brief}">
                                    <p class="card-text">${p.brief.length() > 100 ? p.brief.substring(0, 100) + '...' : p.brief}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="card-text">Không có mô tả</p>
                                </c:otherwise>
                            </c:choose>
                            <p class="card-text">Giá: <fmt:formatNumber value="${discountedPrice}" type="number"/> VNĐ (Giảm ${p.discount != null ? p.discount : 0}%)</p>
                            <a href="product-detail.jsp?id=${p.productId}" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
    </body>
</html>
