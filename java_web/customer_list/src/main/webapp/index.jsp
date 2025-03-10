<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            border: 2px solid black;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: lightgray;
        }
        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;">Danh sách khách hàng</h2>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birthdate}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.imageUrl}" alt="ảnh"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>