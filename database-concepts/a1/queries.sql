-- 1.
CREATE TABLE sailors (
    sid integer primary key,
    sname varchar(20),
    rating integer,
    age integer
);

CREATE TABLE boats (
    bid integer primary key,
    bname varchar(15),
    color varchar(15)
);

CREATE TABLE reservations (
    sid integer references sailors(sid),
    bid integer references boats(bid),
    day varchar(10)
);


-- 2.

COPY sailors from '/Users/larken/class/database-concepts/a1/sailor.txt';
COPY boats from '/Users/larken/class/database-concepts/a1/boat.txt';
COPY reservations from '/Users/larken/class/database-concepts/a1/reserves.txt';

INSERT into reservations values(57, 57, 'Monday'); -- this fails because foreign keys 57 & 57 don't exist
DELETE from sailors where sid=22; -- this fails because this sailor has a reservation

-- 3.

-- (a)
SELECT
  sid,
  rating
FROM sailors;

-- (b)
SELECT bname
FROM boats
WHERE color = 'red';

-- (c)
SELECT DISTINCT color
FROM boats;

-- (d)
SELECT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color = 'red'
     ) AS reserves;

-- (e)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.age
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.age > 25
     ) AS reserves;

-- (f)
SELECT DISTINCT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color != 'red' AND boats.color != 'green'
     ) AS reserves;

-- (g)
-- Find the name of each boat that was reserved by a sailor who has reserved
-- a blue and a green boat.
SELECT bname
FROM (
       --  build a selection of boats and sailors for boats that are reserved, and are blue/green.
       SELECT boats.bname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE COUNT(reservations.sid) = 2 OR boats.color = 'blue' OR boats.color = 'green'
     ) AS reserves;

SELECT DISTINCT bname
FROM reservations
  INNER JOIN boats ON reservations.bid = boats.bid
WHERE reservations.sid IN (
  SELECT reservations.sid
  FROM reservations
    INNER JOIN boats ON reservations.bid = boats.bid
  WHERE boats.color = 'blue' OR boats.color = 'green'
  GROUP BY
    reservations.sid
  HAVING count(reservations.sid) >= 2
);

-- (h)
SELECT bid
FROM boats
WHERE bid NOT IN (
  SELECT DISTINCT bid
  FROM reservations
);

-- (i)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         reservations.sid,
         sailors.sid
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.sid IN (
         SELECT reservations.sid
         FROM
           reservations
         GROUP BY
           reservations.sid
         HAVING
           COUNT(reservations.sid) >= 2
       )
     ) AS reserves;

-- (j)
SELECT sid
FROM
  reservations
GROUP BY
  sid
HAVING
  COUNT(sid) = 1;

-- testing
SELECT *
FROM reservations;

SELECT
  boats.bname,
  boats.color,
  boats.bid,
  reservations.sid,
  sailors.sid
FROM boats
  INNER JOIN reservations ON reservations.bid = boats.bid
  INNER JOIN sailors ON reservations.sid = sailors.sid
