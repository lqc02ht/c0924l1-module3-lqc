<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator for Product</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="result" method="POST">
    <label>Product Description:</label>
    <input type="text" name="description" required/><br><br>
    <label>List Price:</label>
    <input type="number" name="price" required/><br><br>
    <label>Discount Percent:</label>
    <input type="number" name="discountPercent" required/><br><br>
    <input type="submit" value="Calculate"/>
</form>
</body>
</html>