SELECT * FROM test WHERE x LIKE '%a%b%c%d%e%1%';
SELECT * FROM test WHERE x LIKE '%b%c%d%e%f%1%';
SELECT * FROM test WHERE x LIKE '%c%d%e%f%g%1%';
SELECT * FROM test WHERE x LIKE '%d%e%f%g%h%1%';
SELECT * FROM test WHERE x LIKE '%e%f%g%h%i%1%';