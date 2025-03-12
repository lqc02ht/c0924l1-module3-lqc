<%--
  Created by IntelliJ IDEA.
  User: cuong
  Date: 3/12/25
  Time: 6:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<h2>${product != null ? "Chỉnh sửa sản phẩm" : "Thêm sản phẩm mới"}</h2>
<form action="products" method="post">
    <input type="hidden" name="id" value="${product != null ? product.id : 0}">
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" value="${product != null ? product.name : ''}" required><br>

    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" value="${product != null ? product.price : ''}" required><br>

    <label for="description">Mô tả:</label>
    <input type="text" id="description" name="description" value="${product != null ? product.description : ''}"><br>

    <label for="manufacturer">Nhà sản xuất:</label>
    <input type="text" id="manufacturer" name="manufacturer" value="${product != null ? product.manufacturer : ''}"><br>

    <input type="hidden" name="action" value="update">
    <button type="submit">Lưu sản phẩm</button>
</form>
</body>
</html>
