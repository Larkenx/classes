DROP TABLE Buys;
DROP TABLE Major;
DROP TABLE Cites;
DROP TABLE Book;
DROP TABLE Student;

CREATE TABLE Student (
  Sid   INTEGER,
  Sname VARCHAR(15),
  PRIMARY KEY (Sid)
);

CREATE TABLE Major (
  Sid   INTEGER REFERENCES Student (Sid),
  Major VARCHAR(15)
);

CREATE TABLE Book (
  Bid   INTEGER,
  Title VARCHAR(30),
  Price INTEGER,
  PRIMARY KEY (Bid)
);

CREATE TABLE Cites (
  Bid      INTEGER REFERENCES Book (Bid),
  CitedBid INTEGER REFERENCES Book (Bid)
);

CREATE TABLE Buys (
  Sid INTEGER REFERENCES Student (Sid),
  Bid INTEGER REFERENCES Book (Bid)
);

-- Data for the student relation.

INSERT INTO student VALUES (1001, 'Jean');
INSERT INTO student VALUES (1002, 'Maria');
INSERT INTO student VALUES (1003, 'Anna');
INSERT INTO student VALUES (1004, 'Chin');
INSERT INTO student VALUES (1005, 'John');
INSERT INTO student VALUES (1006, 'Ryan');
INSERT INTO student VALUES (1007, 'Catherine');
INSERT INTO student VALUES (1008, 'Emma');
INSERT INTO student VALUES (1009, 'Jan');
INSERT INTO student VALUES (1010, 'Linda');
INSERT INTO student VALUES (1011, 'Nick');
INSERT INTO student VALUES (1012, 'Eric');
INSERT INTO student VALUES (1013, 'Lisa');
INSERT INTO student VALUES (1014, 'Filip');
INSERT INTO student VALUES (1015, 'Dirk');
INSERT INTO student VALUES (1016, 'Mary');
INSERT INTO student VALUES (1017, 'Ellen');
INSERT INTO student VALUES (1020, 'Ahmed');

-- Data for the book relation.

INSERT INTO book VALUES (2001, 'Databases', 40);
INSERT INTO book VALUES (2002, 'OperatingSystems', 25);
INSERT INTO book VALUES (2003, 'Networks', 20);
INSERT INTO book VALUES (2004, 'AI', 45);
INSERT INTO book VALUES (2005, 'DiscreteMathematics', 20);
INSERT INTO book VALUES (2006, 'SQL', 25);
INSERT INTO book VALUES (2007, 'ProgrammingLanguages', 15);
INSERT INTO book VALUES (2008, 'DataScience', 50);
INSERT INTO book VALUES (2009, 'Calculus', 10);
INSERT INTO book VALUES (2010, 'Philosophy', 25);
INSERT INTO book VALUES (2012, 'Geometry', 80);
INSERT INTO book VALUES (2013, 'RealAnalysis', 35);
INSERT INTO book VALUES (2011, 'Anthropology', 50);

-- Data for the buys relation.

INSERT INTO buys VALUES (1001, 2002);
INSERT INTO buys VALUES (1001, 2007);
INSERT INTO buys VALUES (1001, 2009);
INSERT INTO buys VALUES (1001, 2011);
INSERT INTO buys VALUES (1001, 2013);
INSERT INTO buys VALUES (1002, 2001);
INSERT INTO buys VALUES (1002, 2002);
INSERT INTO buys VALUES (1002, 2007);
INSERT INTO buys VALUES (1002, 2011);
INSERT INTO buys VALUES (1002, 2012);
INSERT INTO buys VALUES (1002, 2013);
INSERT INTO buys VALUES (1003, 2002);
INSERT INTO buys VALUES (1003, 2007);
INSERT INTO buys VALUES (1003, 2011);
INSERT INTO buys VALUES (1003, 2012);
INSERT INTO buys VALUES (1003, 2013);
INSERT INTO buys VALUES (1004, 2006);
INSERT INTO buys VALUES (1004, 2007);
INSERT INTO buys VALUES (1004, 2008);
INSERT INTO buys VALUES (1004, 2011);
INSERT INTO buys VALUES (1004, 2012);
INSERT INTO buys VALUES (1004, 2013);
INSERT INTO buys VALUES (1005, 2007);
INSERT INTO buys VALUES (1005, 2011);
INSERT INTO buys VALUES (1005, 2012);
INSERT INTO buys VALUES (1005, 2013);
INSERT INTO buys VALUES (1006, 2006);
INSERT INTO buys VALUES (1006, 2007);
INSERT INTO buys VALUES (1006, 2008);
INSERT INTO buys VALUES (1006, 2011);
INSERT INTO buys VALUES (1006, 2012);
INSERT INTO buys VALUES (1006, 2013);
INSERT INTO buys VALUES (1007, 2001);
INSERT INTO buys VALUES (1007, 2002);
INSERT INTO buys VALUES (1007, 2003);
INSERT INTO buys VALUES (1007, 2007);
INSERT INTO buys VALUES (1007, 2008);
INSERT INTO buys VALUES (1007, 2009);
INSERT INTO buys VALUES (1007, 2010);
INSERT INTO buys VALUES (1007, 2011);
INSERT INTO buys VALUES (1007, 2012);
INSERT INTO buys VALUES (1007, 2013);
INSERT INTO buys VALUES (1008, 2007);
INSERT INTO buys VALUES (1008, 2011);
INSERT INTO buys VALUES (1008, 2012);
INSERT INTO buys VALUES (1008, 2013);
INSERT INTO buys VALUES (1009, 2001);
INSERT INTO buys VALUES (1009, 2002);
INSERT INTO buys VALUES (1009, 2011);
INSERT INTO buys VALUES (1009, 2012);
INSERT INTO buys VALUES (1009, 2013);
INSERT INTO buys VALUES (1010, 2001);
INSERT INTO buys VALUES (1010, 2002);
INSERT INTO buys VALUES (1010, 2003);
INSERT INTO buys VALUES (1010, 2011);
INSERT INTO buys VALUES (1010, 2012);
INSERT INTO buys VALUES (1010, 2013);
INSERT INTO buys VALUES (1011, 2002);
INSERT INTO buys VALUES (1011, 2011);
INSERT INTO buys VALUES (1011, 2012);
INSERT INTO buys VALUES (1012, 2011);
INSERT INTO buys VALUES (1012, 2012);
INSERT INTO buys VALUES (1013, 2001);
INSERT INTO buys VALUES (1013, 2011);
INSERT INTO buys VALUES (1013, 2012);
INSERT INTO buys VALUES (1014, 2008);
INSERT INTO buys VALUES (1014, 2011);
INSERT INTO buys VALUES (1014, 2012);
INSERT INTO buys VALUES (1017, 2001);
INSERT INTO buys VALUES (1017, 2002);
INSERT INTO buys VALUES (1017, 2003);
INSERT INTO buys VALUES (1017, 2008);
INSERT INTO buys VALUES (1017, 2012);
INSERT INTO buys VALUES (1020, 2012);

-- Data for the cites relation.
INSERT INTO cites VALUES (2012, 2001);
INSERT INTO cites VALUES (2008, 2011);
INSERT INTO cites VALUES (2008, 2012);
INSERT INTO cites VALUES (2001, 2002);
INSERT INTO cites VALUES (2001, 2007);
INSERT INTO cites VALUES (2002, 2003);
INSERT INTO cites VALUES (2003, 2001);
INSERT INTO cites VALUES (2003, 2004);
INSERT INTO cites VALUES (2003, 2002);

-- Data for the cites relation.

INSERT INTO major VALUES (1001, 'Math');
INSERT INTO major VALUES (1001, 'Physics');
INSERT INTO major VALUES (1002, 'CS');
INSERT INTO major VALUES (1002, 'Math');
INSERT INTO major VALUES (1003, 'Math');
INSERT INTO major VALUES (1004, 'CS');
INSERT INTO major VALUES (1006, 'CS');
INSERT INTO major VALUES (1007, 'CS');
INSERT INTO major VALUES (1007, 'Physics');
INSERT INTO major VALUES (1008, 'Physics');
INSERT INTO major VALUES (1009, 'Biology');
INSERT INTO major VALUES (1010, 'Biology');
INSERT INTO major VALUES (1011, 'CS');
INSERT INTO major VALUES (1011, 'Math');
INSERT INTO major VALUES (1012, 'CS');
INSERT INTO major VALUES (1013, 'CS');
INSERT INTO major VALUES (1013, 'Psychology');
INSERT INTO major VALUES (1014, 'Theater');

-- * Query that gets a student who takes at least two courses. To mimic a count function, do the following:
-- select s.name
-- from student.s, enroll e1, enroll e2
-- where s.sid = e1.sid and s.sid = e2.sid and e1.cno <> e2.cno

-- * To find some constaint between two things (at least 2, at most 3), you must use set difference (EXCEPT)
-- and other set functionality.

-- * TO find the 'next' highest cost book, you do something like ...
-- where attr >= ALL(subquery)
-- then you 'except' the query again with the lowest possible result

-- 1. (10 points) Find the bid and title of each book that costs between $10 and
-- $40 and that was bought by a student who majors in both CS and Math.
SELECT
  Books.Bid,
  Books.Title
FROM
  -- build a view of students majoring in math and cs
  ((SELECT M.Sid
    FROM Major M
    WHERE M.Major = 'CS')
   INTERSECT
   (SELECT M.Sid
    FROM Major M
    WHERE M.Major = 'Math')) AS S,
  -- build a view of all the books priced between 10 and 40 dollars
  (SELECT
     B.Bid,
     B.Title,
     B.Price
   FROM BOOK B
   WHERE B.Price >= 10 OR B.price <= 40) AS BOOKS,
  -- build a view of all the purchase orders for books by students
  Buys AS B
WHERE
  B.Bid = Books.Bid AND
  B.Sid = S.Sid;

-- 2. (10 points) Find the sid and name of each student who bought a book
-- that is cited by a higher-priced book.
SELECT
  S.Sid,
  S.Sname
FROM
  Student S,
  Buys B
WHERE S.Sid = B.Sid
      AND
      B.Bid IN
      -- books that are cited by a higher priced book
      (SELECT C.Bid
       FROM
         Cites C, Book B1, Book B2
       WHERE C.CitedBid = B1.Bid
             AND
             C.Bid = B2.Bid
             AND B2.Price < B1.Price);

-- 3. (10 points) Find the Bid of each book that cites another book b. Furthermore,
-- b should be a book cited by at least two books.

-- "half" of the books that cite a book which is cited by at least another book
SELECT DISTINCT C1.Bid
FROM Book B, Cites C1, Cites C2
WHERE B.Bid = C1.CitedBid AND B.Bid = C2.CitedBid AND C2.Bid <> C1.Bid;

-- 4. (10 points) Find the bid of each book that was not bought by any student.
-- all possible books
SELECT bid
FROM Book
EXCEPT
--   except ones that have been purchased
SELECT DISTINCT bid
FROM Buys;

-- additional rows to test question 5 (another book that costs more than $50)
-- INSERT INTO book VALUES(9999, 'TEST', 85);
-- INSERT INTO buys VALUES(1002,9999);
-- INSERT INTO buys VALUES(1003,9999);
-- INSERT INTO buys VALUES(1004,9999);
-- INSERT INTO buys VALUES(1005,9999);
-- INSERT INTO buys VALUES(1006,9999);
-- INSERT INTO buys VALUES(1007,9999);
-- INSERT INTO buys VALUES(1008,9999);
-- INSERT INTO buys VALUES(1009,9999);
-- INSERT INTO buys VALUES(1010,9999);
-- INSERT INTO buys VALUES(1011,9999);
-- INSERT INTO buys VALUES(1012,9999);
-- INSERT INTO buys VALUES(1013,9999);
-- INSERT INTO buys VALUES(1014,9999);
-- INSERT INTO buys VALUES(1017,9999);
-- INSERT INTO buys VALUES(1020,9999);

-- 5. (10 points) Find the sid of each student who did not buy all books that
-- cost more than $50.
SELECT DISTINCT Sid
FROM
  -- assume that all of the students bought all of the books costing more than $50
  -- create the cartesian product of all sid's and books costing more than $50
  -- this creates pairs of students, books such that every student bought every book costing more than $50
  ((SELECT
      Student.Sid,
      Book.Bid
    FROM Student, Book
    WHERE Book.Price > 50)
   -- Subtract all of the students who did purchase all books costing more than $50, and you will be left
   -- with all of the students who did not purchase all books costing more than $50
   EXCEPT
   -- all of the students who bought a book that costs more than $50
   (SELECT
      Buys.Sid,
      Buys.Bid
    FROM Buys
    WHERE Buys.Bid IN (-- all of the books purchased that cost more than $50
      SELECT Bid
      FROM Book
      WHERE Price > 50))) AS BSBSBSB;

-- people who didn't buy:
-- 1001, 1015, 1016,


-- 6. (10 points) Find the Bid of each book that was bought by a student
-- who majors in CS but that was not bought by any student who majors in
-- Math.



-- 7. (10 points) Find the sid and name of each student who has at single major
-- and who only bought books that cite other books.

-- 8. (10 points) Find the sid and majors of each student who did not buy any
-- book that cost less than $30.

-- 9. (10 points) Find each (s, b) pair where s is the sid of a student and b is
-- the Bid of a book whose price is the highest among the books bought
-- by that student.

-- 10. (10) Without using the ALL predicate, list the price of the next to most
-- expensive books.

-- 11. (10 points) Find the triples (s,b1,b2,s) where s is the sid of a student
-- who if he or she bought book b1 the here or she also bought book b2.
-- Furthermore, b1 and b2 should be different.
