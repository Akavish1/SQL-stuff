--NO SUBQUERY
--1
select ordid, orderdate from ord, customer where ord.custid = customer.custid and name like 'VOLLYRITE'; 
--2
select customer.name from customer, ord, product, item 
where ord.custid = customer.custid and ord.ordid = item.ordid and item.prodid = product.prodid 
and descrip like 'ACE TENNIS NET';
--3
--no can do
--4
select customer.name, address, ordid from customer, ord where orderdate like '11-JAN-87' order by ordid, customer.name;
--YES SUBQUERY
--1
select ordid, orderdate from ord where 
ord.custid = (select custid from customer where name like 'VOLLYRITE');
--2
select name from customer where custid in 
    (select custid from ord where ordid in
        (select ordid from item where prodid in
            (select prodid from product where descrip like 'ACE TENNIS NET')
        )
    );    
--3
update item set actualprice = actualprice + 100 where ordid in 
    (select ordid from ord where custid = 101 and shipdate like to_date('08-JAN-87'));
--4
--pointless