--a
select avg(speed) from pc;
--b
select avg(speed) from laptop where price > 2500;
--c subquery
select avg(price) from pc where model in 
    (select model from product where maker like 'A');
--c no subquery
select avg(price) from pc, product where pc.model = product.model and product.maker like 'A';
--d
select avg(x.price) from(select price from pc, product where pc.model = product.model and product.maker like 'D'
union all
select price from laptop, product where laptop.model = product.model and product.maker like 'D') x;
--e
select speed, avg(price) from pc group by speed;
--f
select maker, avg(screen) from laptop, product where laptop.model = product.model group by maker;
--g
select maker from product group by maker having count(model) > 2;
--h
select maker, max(price) from pc, product where product.model = pc.model group by maker;
--i
select speed, avg(price) from pc group by speed having speed > 900;
--j
select maker, avg(hd) from pc, product where pc.model = product.model and
product.maker in (select maker from product, printer where product.model = printer.model) group by maker;