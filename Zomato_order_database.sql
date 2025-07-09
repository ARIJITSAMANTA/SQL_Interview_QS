--Zomato's order database. Imagine each order's item has been mistakenly swapped with the next—our task is to use Common Table Expressions (CTEs) to realign the order IDs with the correct items.
create database zomato
use zomato
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(255) NOT NULL
);
INSERT INTO orders (order_id, item) VALUES
(1, 'Chow Mein'),
(2, 'Pizza'),
(3, 'Veg Nuggets'),
(4, 'Paneer Butter Masala'),
(5, 'Spring Rolls'),
(6, 'Veg Burger'),
(7, 'Paneer Tikka');
select * from orders
with cte as(
select count(order_id) as total_orders from orders)
#swaping logic

select case 
when order_id % 2!=0 and order_id!=total_orders
then order_id+1
when order_id % 2!=0 and order_id =total_orders
then order_id
else order_id-1
end as corrected_order_id,item
from orders cross join  cte as a order by corrected_order_id
