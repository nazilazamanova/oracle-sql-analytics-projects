---1. Select customer name together with each order the customer made


select c.customerid,c.customername,o.orderid from customers_n c
join orders_n o
on c.customerid=o.customerid;


---2. Select order id together with name of employee who handled the order


select o.orderid,e.firstname from orders_n o
join employees_n e
on o.employeeid=e.employeeid;

---3. Select customers who did not placed any order yet

select c.customerid,c.customername,o.orderid from customers_n c
left join orders_n o
on c.customerid=o.customerid
where orderid is NULL;

---4. Select order id together with the name of products


select o.orderid,productname from orders_n o
join order_details_n od
on o.orderid=od.orderid
join products_n p
on od.productid=p.productid;

---5. Select products that no one bought

select p.productname,p.productid,od.orderid from products_n p
left join order_details_n od
on p.productid=od.productid
where od.orderid is NULL;



---6. Select customer together with the products that he bought

select c.customername,p.productname name from customers_n c
join orders_n o
on c.customerid=o.customerid
join order_details_n od
on o.orderid=od.orderid
join products_n p
on od.productid=p.productid;


---7. Select product names together with the name of corresponding category

select productname,categoryname from products_n p
join categories_n c
on p.categoryid=c.categoryid;

---8. Select orders together with the name of the shipping company

select o.orderid,s.shippername from orders_n o
join shippers_n s
on o.shipperid=s.shipperid;


---9. Select customers with id greater than 50 together with each order they made

select c.customerid,o.orderid from customers_n c
join orders_n o
on c.customerid=o.customerid
where c.customerid>50;


---10. Select employees together with orders with order id greater than 10400

select e.employeeid,e.firstname,e.lastname,o.orderid from employees_n e
join orders_n o
on e.employeeid=o.employeeid
where orderid>10400;


--1. Select the most expensive product

select max(price) from products_n;

select productname,price from products_n
where price=(select max(price) from products_n);

--2. Select the second most expensive product


select productname, price
from products_n
where price = (
    select max(price)
    from products_n
    where price < (select max(price) from products_n)
);



---3. Select name and price of each product, sort the result by price in decreasing order
select productname, price from products_n
order by price desc;


---4. Select 5 most expensive products

select productname, price
from products_n
order by price desc
fetch first 5 rows only;


---5. Select 5 most expensive products without the most expensive (in final 4 products)
select productname, price
from (
    select productname,
           price,
           dense_rank() over (order by price desc) rnk
    from products_n
)
where rnk between 2 and 5;

---6. Select name of the cheapest product (only name) without using LIMIT and OFFSET
select productname 
from (
     select productname,price,
dense_rank() over(order by price) rnk
from products_n
)
where rnk=1;

---7. Select name of the cheapest product (only name) using subquery
select productname 
from (
     select productname,price,
dense_rank() over(order by price) rnk
from products_n
)
where rnk=1;


--8. Select number of employees with LastName that starts with 'D'
select count(*) from employees_n
where lower(lastname) like 'd%';


---9. Select customer name together with the number of orders made by the corresponding customer 
---sort the result by number of orders in decreasing order
select c.customername,count(o.orderid) num_orders
from customers_n c
join orders_n o
on c.customerid=o.customerid
group by c.customername
order by num_orders desc;


---10. Add up the price of all products
select sum(price) from products_n;



---11. Select orderID together with the total price of  that Order, order the result by total price of order in increasing order
select o.orderid,sum(price) total_price
from orders_n o
join order_details_n od
on o.orderid=od.orderid
join products_n p
on od.productid=p.productid 
group by o.orderid
order by total_price;


---12. Select customer who spend the most money
select customername, total_spent
from (
    select c.customername,
           sum(od.quantity * p.price) as total_spent,
           dense_rank() over(order by sum(od.quantity * p.price) desc) rnk
    from customers_n c
    join orders_n o
    on c.customerid = o.customerid
    join order_details_n od
    on o.orderid = od.orderid
    join products_n p
    on od.productid = p.productid
    group by c.customername
)
where rnk = 1;



---13. Select customer who spend the most money and lives in Canada
select customername, total_spent
from (
    select c.customername,
           sum(od.quantity * p.price) as total_spent,
           dense_rank() over(order by sum(od.quantity * p.price) desc) rnk
    from customers_n c
    join orders_n o
    on c.customerid = o.customerid
    join order_details_n od
    on o.orderid = od.orderid
    join products_n p
    on od.productid = p.productid
    where c.country='Canada'
    group by c.customername
)
where rnk = 1;


---14. Select customer who spend the second most money
select customername, total_spent
from (
    select c.customername,
           sum(od.quantity * p.price) as total_spent,
           dense_rank() over(order by sum(od.quantity * p.price) desc) rnk
    from customers_n c
    join orders_n o
    on c.customerid = o.customerid
    join order_details_n od
    on o.orderid = od.orderid
    join products_n p
    on od.productid = p.productid
    group by c.customername
)
where rnk = 2;

---15. Select shipper together with the total price of proceed orders
select shippername,sum(od.quantity * p.price) total_price from shippers_n s
join orders_n o
on s.shipperid=o.shipperid
join  order_details_n od
on o.orderid=od.orderid
join products_n p
on od.productid=p.productid
group by shippername;







