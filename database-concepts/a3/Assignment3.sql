-- Data for polynomials
DELETE FROM p;
DELETE FROM q;

-- create table p (coefficient bigint, degree bigint);
-- create table q (coefficient bigint, degree bigint);

INSERT INTO p VALUES (2, 2), (-5, 1), (5, 0);
INSERT INTO q VALUES (3, 3), (1, 2), (-1, 1);

-- Data for point
DELETE FROM point;

INSERT INTO POINT VALUES (1, 0, 0);
INSERT INTO POINT VALUES (2, 0, 1);
INSERT INTO POINT VALUES (3, 1, 0);
INSERT INTO POINT VALUES (4, 0, 2);
INSERT INTO POINT VALUES (5, 1, 1);
INSERT INTO POINT VALUES (6, 2, 2);

-- Data for queries
DELETE FROM cites;
DELETE FROM buys;
DELETE FROM major;
DELETE FROM book;
DELETE FROM student;

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
INSERT INTO student VALUES (1021, 'Vince');
INSERT INTO student VALUES (1022, 'Joeri');

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
INSERT INTO book VALUES (2014, 'Topology', 70);

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
INSERT INTO buys VALUES (1020, 2001);
INSERT INTO buys VALUES (1020, 2012);
INSERT INTO buys VALUES (1022, 2014);

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
INSERT INTO major VALUES (1017, 'Anthropology');
INSERT INTO major VALUES (1022, 'CS');

-- DROP FUNCTION check_empty();
-- CREATE FUNCTION check_empty(OUT empty_a_minus_b BOOLEAN, OUT empty_b_minus_a BOOLEAN) AS
-- $$
-- SELECT *
-- FROM
--   (SELECT EXISTS((SELECT *
--                   FROM A) EXCEPT (SELECT *
--                                   FROM B))) AS empty_a_minus_b,
--   (SELECT EXISTS((SELECT *
--                   FROM B) EXCEPT (SELECT *
--                                   FROM A))) AS empty_b_minus_a
-- $$ LANGUAGE SQL;

\echo "Problem 1"
-- (1)
DROP TABLE A;
DROP TABLE B;
DROP TABLE C;

CREATE TABLE A
(
  a INTEGER PRIMARY KEY
);

CREATE TABLE B
(
  b INTEGER PRIMARY KEY
);

CREATE TABLE C
(
  c INTEGER PRIMARY KEY
);

INSERT INTO A VALUES (1);
-- INSERT INTO A VALUES (2);
INSERT INTO A VALUES (3);
INSERT INTO A VALUES (4);
INSERT INTO B VALUES (1);

INSERT INTO B VALUES (3);
INSERT INTO B VALUES (4);
INSERT INTO B VALUES (5);

INSERT INTO C VALUES (1);
INSERT INTO C VALUES (3);
-- A = {1,2,3,4}
-- B = {3,4}
-- C = {1}

\echo "1.a)"
-- (a)
SELECT
  NOT EXISTS((SELECT *
              FROM A) EXCEPT (SELECT *
                              FROM B))    AS empty_a_minus_b,
  NOT EXISTS((SELECT *
              FROM B) EXCEPT (SELECT *
                              FROM A))    AS empty_b_minus_a,
  NOT EXISTS((SELECT *
              FROM B) INTERSECT (SELECT *
                                 FROM A)) AS empty_a_intersect_b;
\echo "1.b)"
-- (1)
-- (b)
SELECT
  NOT EXISTS(SELECT a
             FROM A
             WHERE a NOT IN (SELECT b
                             FROM B)) AS empty_a_minus_b,
  NOT EXISTS(SELECT b
             FROM B
             WHERE b NOT IN (SELECT a
                             FROM A)) AS empty_b_minus_a,
  NOT EXISTS(SELECT a
             FROM A
             WHERE a IN (SELECT b
                         FROM B))     AS empty_a_intersect_b;

\echo "Problem 2"
-- (2)
\echo "2.a"

-- (a) (10 points) Determine whether or not A ∩ B ̸= {}.
SELECT EXISTS(SELECT *
              FROM A INTERSECT SELECT *
                               FROM B) AS answer;
SELECT EXISTS(SELECT a
              FROM A
              WHERE a NOT IN (SELECT b
                              FROM B)) AS answer;

\echo "2.b"
-- (b) (10 points) Determine whether or not A ∩ B = {}.
SELECT NOT EXISTS(SELECT a
                  FROM A INTERSECT SELECT b
                                   FROM B) AS a_intersect_b_is_empty;

SELECT NOT EXISTS(SELECT a
                  FROM A
                  WHERE A IN (SELECT b
                              FROM B)) AS a_intersect_b_is_empty;

\echo "2.c"
-- (c) (10 points) Determine whether or not A ⊆ B.
SELECT NOT EXISTS(SELECT *
                  FROM A EXCEPT SELECT *
                                FROM B) AS a_is_subset_of_b;

SELECT NOT EXISTS(SELECT a
                  FROM A
                  WHERE a NOT IN (SELECT b
                                  FROM B)) AS a_is_subset_of_b;

\echo "2.d"
-- (d) (10 points) Determine whether or not A ̸⊇ B.

SELECT EXISTS(SELECT b
              FROM B
              EXCEPT SELECT a
                     FROM A) AS b_not_subset_of_a;

SELECT EXISTS(SELECT b -- there's at least something from b not in A
              FROM B
              WHERE b NOT IN (SELECT a
                              FROM A)) AS b_not_subset_of_a;

\echo "2.e"
-- (e) (10 points) Determine whether or not A ̸= B.
SELECT exists(SELECT a -- there's at least one thing in A that's not in B
              FROM A
              WHERE a EXCEPT (SELECT b
                              FROM B)) OR
       exists(SELECT b -- at least one thing that's not in A that is in B
              FROM B
              WHERE b EXCEPT (SELECT a
                              FROM A)) AS not_equal;


SELECT exists(SELECT a -- there's at least one thing in A that's not in B
              FROM A
              WHERE a NOT IN (SELECT b
                              FROM B)) OR
       exists(SELECT b -- at least one thing that's not in A that is in B
              FROM B
              WHERE b NOT IN (SELECT a
                              FROM A)) AS not_equal;

\echo "2.f"
-- (f) (10 points) Determine whether or not |A − B| < 2.

-- determining whether or not |A-B| = 1 or 0
SELECT exists(SELECT a -- all of |A-B| is equal to one of a, so there is exactly one member
              FROM A
              WHERE a = ALL ((SELECT *
                              FROM A) EXCEPT (SELECT *
                                              FROM B)))
       OR NOT exists(SELECT * -- or there are no members at all from A-B
                     FROM A EXCEPT SELECT *
                                   FROM B) AS no_more_than_one;

-- determining whether or not |A-B| = 1 or 0
SELECT exists(SELECT a
              FROM A
              WHERE a = ALL ((SELECT a
                              FROM A
                              WHERE a NOT IN (SELECT *
                                              FROM B)))
                    OR NOT exists(SELECT a
                                  FROM A
                                  WHERE a NOT IN (SELECT *
                                                  FROM B))) AS no_more_than_one;

\echo "2.g"
-- (g) (10 points) Determine whether or not (A ∩ B) ̸⊇ C.
SELECT exists(
           SELECT *
           FROM C
           EXCEPT -- is there a member of c not in A intersect b? if so, not a subset
           ((SELECT *
             FROM A)
            INTERSECT
            (SELECT *
             FROM B))
       ) AS c_is_not_subset_of_a_intersect_b;

SELECT exists(
           SELECT c
           FROM C
           WHERE c NOT IN -- is there a member of c not in A intersect b? if so, not a subset
                 ((SELECT a
                   FROM A
                   WHERE a IN
                         (SELECT *
                          FROM B)))
       ) AS c_is_not_subset_of_a_intersect_b;

\echo "2.h"
-- (10 points) Determine whether or not |A ∩ (B ∪ C)| = 2.
DROP FUNCTION a_intersect_b_union_c();
CREATE FUNCTION a_intersect_b_union_c()
  RETURNS TABLE(result INT) AS $$
SELECT *
FROM A
INTERSECT
(SELECT *
 FROM B
 UNION
 SELECT *
 FROM C)
$$ LANGUAGE SQL;

SELECT a_intersect_b_union_c();

SELECT r1.result
FROM a_intersect_b_union_c() r1
WHERE r1.result < ALL (SELECT a_intersect_b_union_c()) AND
      exists(SELECT r2.result
             FROM a_intersect_b_union_c() r2
             WHERE r2.result <> r1.result AND r2.result > ALL (SELECT));


\echo "3.a"

-- INSERT INTO p VALUES (2, 2), (-5, 1), (5, 0);
-- INSERT INTO q VALUES (3, 3), (1, 2), (-1, 1);

-- 2x^2 -5x + 5
-- 3x^3 + 1x^2 - 1x

-- (a)
SELECT
  coefficient,
  degree
FROM
  (((SELECT * -- give me all p and q coefficients & degrees
     FROM p -- except for those that have a coefficient with same degree in both tables
     WHERE p.degree NOT IN (SELECT degree
                            FROM q))
    UNION
    (SELECT *
     FROM q
     WHERE q.degree NOT IN (SELECT degree
                            FROM p)))
   -- for those with the same degree, we add the coefficients together
   UNION
   SELECT
     p.coefficient + q.coefficient,
     p.degree
   FROM
     p, q
   WHERE p.degree = q.degree) AS result;


\echo "3.b"
-- (b)

select q.degree + (select sum(degree) from p) from q
