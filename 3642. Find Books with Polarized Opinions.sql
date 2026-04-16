create database `3642. Find Books with Polarized Opinions`;
use `3642. Find Books with Polarized Opinions`;

create table books(
    book_id int primary key,
    title varchar(255),
    author varchar(255),
    genre varchar(255),
    pages int
);

create table reading_sessions (
    session_id int primary key,
    book_id int,
    reader_name varchar(255),
    pages_read int,
    session_rating int,
    foreign key (book_id) references books(book_id)
);

INSERT INTO books (book_id, title, author, genre, pages) VALUES
(1, 'The Great Gatsby', 'F. Scott', 'Fiction', 180),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 281),
(3, '1984', 'George Orwell', 'Dystopian', 328),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 432),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 277);

INSERT INTO reading_sessions (session_id, book_id, reader_name, pages_read, session_rating) VALUES
(1, 1, 'Alice', 50, 5),
(2, 1, 'Bob', 60, 1),
(3, 1, 'Carol', 40, 4),
(4, 1, 'David', 30, 2),
(5, 1, 'Emma', 45, 5),
(6, 2, 'Frank', 80, 4),
(7, 2, 'Grace', 70, 4),
(8, 2, 'Henry', 90, 5),
(9, 2, 'Ivy', 60, 4),
(10, 2, 'Jack', 75, 4),
(11, 3, 'Kate', 100, 2),
(12, 3, 'Liam', 120, 1),
(13, 3, 'Mia', 80, 2),
(14, 3, 'Noah', 90, 1),
(15, 3, 'Olivia', 110, 4),
(16, 3, 'Paul', 95, 5),
(17, 4, 'Quinn', 150, 3),
(18, 4, 'Ruby', 140, 3),
(19, 5, 'Sam', 80, 1),
(20, 5, 'Tara', 70, 2);

select a.book_id,
 b.title,
 b.author,
 b.genre,
 b.pages,
 max(a.session_rating)-min(a.session_rating) as rating_spread,
 round(count(case when a.session_rating>=4 or a.session_rating<=2 then 1 end)/count(*),2)
 as polarization_score
 from reading_sessions a join books b on a.book_id=b.book_id
 group by 1,2,3,4,5
 having count( case when a.session_rating>=4 then 1 end)>=1 and
 count( case when a.session_rating<=2 then 1 end)>=1 
 and count(*)>=5
 and polarization_score>=.6
 order by polarization_score desc, title desc
 ;