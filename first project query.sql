-- SELECT * FROM Customer LIMIT 5; 
-- SELECT * FROM 
-- artist as A
-- LEFT JOIN track as T 
-- ON A.Name = T.Name

-- ORDER BY artistid
SHOW TABLES;

-- SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE 
-- FROM INFORMATION_SCHEMA.COLUMNS 
-- WHERE TABLE_SCHEMA = 'chinook'
-- ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- select CONCAT(FirstName," ",Lastname) as full_name,Country from customer
-- where country = 'usa';

-- select Name as proper_name from track
-- order by name asc

-- select Name , UnitPrice from track            
-- where UnitPrice >= 0.99

-- SELECT FirstName FROM customer        -- START WITH A Letter --
-- WHERE FirstName LIKE 'A%';

-- select concat(FirstName,' ',Lastname) as full_name , Country from customer 
-- where Country = 'USA' or Country = 'Canada'
-- order by Country asc

-- SELECT DISTINCT Country FROM customer;



-- Intermediate Level



-- select g.Name , count(t.TrackId) as total_count from 
-- genre as g
-- left join track as t
-- on g.GenreId = t.GenreId
-- group by g.Name

-- SELECT COUNT(*) FROM genre;

select billingcountry,sum(total) as total_revenue from invoice
group by billingcountry
order by total_revenue desc

select country ,sum(total) as total_revenue from
invoice as i
inner join customer as c
on i.CustomerId = c.CustomerId
group by country
order by total_revenue desc


select g.Name,count(t.TrackId) as genre from 
genre as g
left join track as t
on g.GenreId = t.GenreId
group by g.Name
having count(t.TrackId) >100
