--1
select maker, speed from pc, product where not exists(select maker, speed from pc, product where pc.model = product.model and speed <= 1200);
--2
select model, price from printer where price = (select max(price) from printer);
--3 no correlated subquery
select model, price from pc where price < (select min(price) from laptop);
--3 yes correlated subquery
select model, price from pc where price < all(select price from laptop);
--4
SELECT maker
FROM product p1
WHERE NOT EXISTS (SELECT p2.model
FROM product p2, pc
WHERE p2.model = pc.model
AND p2.maker = p1.maker
AND price > 2500
UNION
SELECT p2.model
FROM product p2, laptop l
WHERE p2.model = l.model
AND p2.maker = p1.maker
AND price > 2500
UNION
SELECT p2.model
FROM product p2, printer pr
WHERE p2.model = pr.model
AND p2.maker = p1.maker
AND price > 2500 );
--5
SELECT *
FROM laptop
WHERE speed < ANY (SELECT speed FROM pc);
--6
select max(price) from(select price from pc union all select price from laptop);
--7
select maker, price from product, printer where printer.model = product.model and price = (select min(price) from printer);
--8
SELECT maker
FROM Products pr
WHERE NOT EXISTS (SELECT *
FROM Printer p, product pro2
WHERE p.model=pro2.model AND color ='True'
And pro2.maker=pr.maker)
AND type='PRINTER';
