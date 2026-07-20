-- Q1: List customers from USA or Canada with full name, sorted alphabetically
SELECT CONCAT(FirstName, ' ', LastName) AS full_name, Country
FROM customer
WHERE Country = 'USA' OR Country = 'Canada'
ORDER BY full_name;


-- Q2: Find genres that have more than 100 tracks
SELECT g.Name AS genre_name, COUNT(t.TrackId) AS track_count
FROM genre AS g
LEFT JOIN track AS t ON g.GenreId = t.GenreId
GROUP BY g.Name
HAVING COUNT(t.TrackId) > 100;


-- Q3: List each track with its album and genre (3-table join)
SELECT t.Name AS track_name, al.Title AS album_name, g.Name AS genre_name
FROM track AS t
JOIN album AS al ON t.AlbumId = al.AlbumId
JOIN genre AS g ON t.GenreId = g.GenreId;


-- Q4: Show each employee alongside their manager's name (self-join)
SELECT 
    CONCAT(e1.FirstName, ' ', e1.LastName) AS employee_name,
    CONCAT(e2.FirstName, ' ', e2.LastName) AS manager_name
FROM employee AS e1
LEFT JOIN employee AS e2 ON e1.ReportsTo = e2.EmployeeId;


-- Q5: Top 5 countries by revenue, counting only invoices above $5
SELECT BillingCountry, SUM(Total) AS total_revenue
FROM invoice
WHERE Total > 5
GROUP BY BillingCountry
ORDER BY total_revenue DESC
LIMIT 5;
