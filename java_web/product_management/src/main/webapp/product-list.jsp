<%--
  Created by IntelliJ IDEA.
  User: cuong
  Date: 3/12/25
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        form { margin-top: 10px; }
    </style>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td>
                <a href="products?action=edit&id=${product.id}">✏️ Sửa</a> |
                <a href="products?action=delete&id=${product.id}" onclick="return confirm('Bạn có chắc muốn xóa?');">🗑️ Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
<h3>Thêm sản phẩm mới</h3>
<form action="products" method="post">
    <input type="hidden" name="id" value="0">
    <input type="text" name="name" placeholder="Tên sản phẩm" required>
    <input type="number" name="price" placeholder="Giá" required>
    <input type="text" name="description" placeholder="Mô tả">
    <input type="text" name="manufacturer" placeholder="Nhà sản xuất">
    <input type="hidden" name="action" value="add">
    <button type="submit">➕ Thêm sản phẩm</button>
</form>
<h3>Tìm kiếm sản phẩm</h3>
<form action="products" method="get">
    <input type="text" name="name" placeholder="Nhập tên sản phẩm">
    <input type="hidden" name="action" value="search">
    <button type="submit">🔍 Tìm kiếm</button>
</form>
</body>
</html>
