select * from pc where price > 1600 and hd = 10 union select * from pc where price > 1600 and hd = 20; --1

select * from pc where price > 1600;

select distinct maker from product; --3

select * from laptop where price > 2000 and screen > 14 union select * from laptop where ram >= 64; --4

select laptop.speed, product.model
from laptop, product
where laptop.hd > 1 and laptop.model = product.model; --5

select pc.* from pc, pc a where pc.speed>a.speed and a.model = 1001; --6

select product.model, product.type, pc.price from product, pc where product.maker like 'A' and product.model = pc.model
union
select product.model, product.type, laptop.price from product, laptop where product.maker like 'A' and product.model = laptop.model
union
select product.model, product.type, printer.price from product, printer where product.maker like 'A' and product.model = printer.model; --7

select model, speed, price from laptop where price > 2000 and speed > 100
union
select model, speed, price from pc where price > 2000 and speed > 100; --8

select maker from product, pc where price > 2000 and speed > 100 and product.model = pc.model
intersect
select maker from product, laptop where price > 2000 and speed > 100 and product.model = laptop.model; --9

select maker from product, laptop where product.model = laptop.model 
minus
select maker from product, pc where product.model = pc.model; --11

select unique(a.hd) from pc a, pc b where a.model !=  b.model and a.hd = b.hd; -- 12

select unique(a.model) from pc a, pc b where a.model !=  b.model and a.speed = b.speed and a.ram = b.ram; --13

