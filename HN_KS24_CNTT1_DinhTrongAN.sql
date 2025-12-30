
use miniproject;
drop table borrow;
drop table book;
drop table reader;
CREATE TABLE reader (
  reader_id INT PRIMARY KEY AUTO_INCREMENT,
  reader_name VARCHAR(100) NOT NULL,
  phone VARCHAR(15) UNIQUE,
  register_date DATE
);

CREATE TABLE book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  book_title VARCHAR(150) NOT NULL,
  author VARCHAR(150),
  publish_year INT CHECK (publish_year >= 1900)
);

CREATE TABLE borrow (
  reader_id INT,
  book_id INT,
  borrow_date DATE,
  return_date DATE NULL,
  PRIMARY KEY (reader_id, book_id),
  FOREIGN KEY (reader_id) REFERENCES reader(reader_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

alter table reader
add email varchar(100) unique;
alter table book
modify author varchar(150);
alter table borrow
modify return_date date;
alter table borrow
add CHECK (return_date IS NULL OR return_date >= borrow_date);
insert into reader(reader_name,phone,email,register_date)
values
("Nguyễn Văn An","0901234567","an.nguyen@gmail.com","2024-09-01"),
("Trần Thị Bình","0912345678","binh.tran@gmail.com","2024-09-05"),
("Lê Minh Châu","0923456789","chau.le@gmail.com","2024-09-10");
select * from reader;
INSERT INTO Book (book_id, book_title, author, publish_year)
VALUES
(101, 'Lập trình C căn bản', 'Nguyễn Văn A', 2018),
(102, 'Cơ sở dữ liệu', 'Trần Thị B', 2020),
(103, 'Lập trình Java', 'Lê Minh C', 2019),
(104, 'Hệ quản trị MySQL', 'Phạm Văn D', 2021);
select * from book;
INSERT INTO Borrow (reader_id, book_id, borrow_date, return_date)
VALUES
(1, 101, '2024-09-15', NULL),
(1, 102, '2024-09-15', '2024-09-25'),
(2, 103, '2024-09-18', NULL);
select * from borrow;
UPDATE borrow
SET return_date = '2024-10-01'
WHERE reader_id = 1;
UPDATE book
SET publish_year = 2023
WHERE publish_year >= 2021
  AND book_id > 0;
DELETE FROM borrow
WHERE borrow_date < '2024-09-18' and book_id>0;
select * from borrow