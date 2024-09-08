#part 1
#world
SELECT name FROM country where Continent = "South America";
SELECT Population from country where Name = "Germany";
SELECT Name FROM `city` WHERE CountryCode = "JPN";
SELECT name, Population FROM country WHERE Region = "Central Africa" ORDER BY Population DESC LIMIT 3;
SELECT name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;
select name from country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";
#chinook
SELECT FirstName, LastName, Email FROM Customer WHERE country = "Brazil";
SELECT * FROM `Playlist`;
SELECT Track.Name from Track JOIN Genre ON Track.GenreId WHERE Genre.Name = "Rock";
SELECT FirstName, LastName FROM Employee WHERE Employee.ReportsTo = (SELECT Employee.EmployeeId FROM Employee WHERE Employee.FirstName = "Nancy" AND Employee.LastName = "Edwards");
SELECT CustomerId, SUM(total) AS total_sales FROM Invoice GROUP BY CustomerId;
#creating my own database
CREATE TABLE Customers ( customer_id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), phone VARCHAR(15) );
CREATE TABLE Products ( product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2), stock_quantity INT ); 
CREATE TABLE Orders ( order_id INT AUTO_INCREMENT PRIMARY KEY, customer_id INT, order_date DATE, total_amount DECIMAL(10, 2), FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ); 
INSERT INTO Customers (first_name, last_name, phone)
VALUES
    ('Emily', 'Zhou', '555-555-1234'),
    ('Link', 'Fu', '555-555-5678'),
    ('Nathan', 'Cabrera', '555-555-8765'),
    ('Brandon', 'Nesbit', '555-555-4321'),
    ('Camyla', 'Gonzalez', '555-555-6789');

INSERT INTO Products (product_name, price, stock_quantity)
VALUES
    ('Greek Yogurt', 3.99, 50),
    ('Celery', 4.99, 20),
    ('Carrot', 2.99, 100),
    ('Apple', 3.99, 30),
    ('Pizza', 19.99, 15);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
    (1, '2024-09-01', 32.99),
    (2, '2024-09-02', 49.99),
    (3, '2024-09-03', 9.99),
    (4, '2024-09-04', 2.99),
    (5, '2024-09-05', 88.99);
#finding products with low stock
SELECT product_name, price, stock_quantity FROM Products WHERE stock_quantity < 20;
#finding products with more than a certain $
SELECT product_id, product_name, price, stock_quantity FROM Products WHERE price > 5;
#finds how much each customer has spent
SELECT c.customer_id, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id;


