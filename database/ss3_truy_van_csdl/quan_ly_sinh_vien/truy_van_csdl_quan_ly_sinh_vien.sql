use m3_c0924l1_jv103;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student s WHERE s.name LIKE '% % h%';

-- Hiển thị lớp học có thời gian bắt đầu vào tháng 12
SELECT * FROM student s JOIN class c ON s.class_id = class.id WHERE c.start_date LIKE '%-12-%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * FROM subject sub WHERE sub.credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp class_id
UPDATE student s SET s.class_id = 2 WHERE s.name LIKE '% hieu';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.name, s.sub_name, s.point FROM student s ORDER BY point DESC , name ASC;