use products_management;

insert into customer values	(1, 'Minh Quan', 10),
	(2, 'Ngoc Oanh', 20),
	(3, 'Hong Ha', 50);
insert into `order` values (1, 1, '2006-3-21', null),
    (2, 2, '2006-3-23', null),
    (3, 1, '2006-3-16', null);
insert into product values (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep dien', 2);
insert into order_detail values (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);
    
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, cID, oDate FROM `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT DISTINCT customer.cID customer_id, customer.cName, customer.cAge
FROM customer c JOIN `order` o ON c.cID = o.cID;

SELECT DISTINCT product.pID, product.pName, product.pPrice
FROM product p JOIN order_detail od ON p.pID = od.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT DISTINCT customer.cID, customer.cName, customer.cAge
FROM customer c LEFT JOIN `order` o ON c.cID = o.cID WHERE o.oID IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán 
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT `order`.oID, `order`.oDate, odQTY * pPrice
FROM (`order` JOIN order_detail ON `order`.oID = order_dorderetail.oID)
JOIN product ON order_detail.pID = product.pID;