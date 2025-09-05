-- ========================================
-- DATABASE E-COMMERCE SEDERHANA UNTUK STUDENT
-- Hanya 5 Tabel Utama untuk Praktek JOIN
-- ===============================
-- ========================================
-- TABEL 1: CUSTOMERS (Pelanggan)
-- ========================================
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    City NVARCHAR(50)
);

-- ========================================
-- TABEL 2: CATEGORIES (Kategori Produk)
-- ========================================
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200)
);

-- ========================================
-- TABEL 3: PRODUCTS (Produk)
-- ========================================
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ========================================
-- TABEL 4: ORDERS (Pesanan)
-- ========================================
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ========================================
-- TABEL 5: ORDER_ITEMS (Detail Pesanan)
-- ========================================
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) DEFAULT 'Customer', -- Admin, Seller, Customer
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Addresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AddressLine NVARCHAR(200) NOT NULL,
    City NVARCHAR(100),
    Province NVARCHAR(100),
    PostalCode NVARCHAR(10),
    Country NVARCHAR(50) DEFAULT 'Indonesia',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod NVARCHAR(50), -- Transfer, COD, Credit Card, E-Wallet
    Status NVARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Shipments (
    ShipmentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    Courier NVARCHAR(50), -- JNE, TIKI, SiCepat, dll
    TrackingNumber NVARCHAR(100),
    ShippedDate DATETIME,
    DeliveryDate DATETIME,
    Status NVARCHAR(20) DEFAULT 'On Process',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Shipments (
    ShipmentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    Courier NVARCHAR(50), -- JNE, TIKI, SiCepat, dll
    TrackingNumber NVARCHAR(100),
    ShippedDate DATETIME,
    DeliveryDate DATETIME,
    Status NVARCHAR(20) DEFAULT 'On Process',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),
    ReviewDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE ShoppingCart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    AddedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ========================================
-- INSERT SAMPLE DATA
-- ========================================

-- Insert Customers
INSERT INTO Customers (CustomerName, Email, Phone, City) VALUES 
('John Doe', 'john@email.com', '081234567890', 'Jakarta'),
('Jane Smith', 'jane@email.com', '081234567891', 'Bandung'),
('Bob Wilson', 'bob@email.com', '081234567892', 'Surabaya'),
('Alice Brown', 'alice@email.com', '081234567893', 'Medan');

-- Insert Categories
INSERT INTO Categories (CategoryName, Description) VALUES 
('Electronics', 'Peralatan elektronik'),
('Fashion', 'Pakaian dan aksesoris'),
('Books', 'Buku dan majalah'),
('Sports', 'Peralatan olahraga');

-- Insert Products
INSERT INTO Products (ProductName, CategoryID, Price, Stock) VALUES 
('iPhone 14', 1, 15000000, 10),
('Samsung Galaxy', 1, 12000000, 15),
('Nike Shoes', 4, 1500000, 20),
('Java Programming Book', 3, 150000, 50),
('T-Shirt', 2, 75000, 100),
('Laptop Gaming', 1, 20000000, 5),
('Novel Romance', 3, 85000, 30);
-- Sengaja tidak ada kategori untuk produk 'Mystery Product' (untuk demo FULL JOIN)

-- Insert Orders (beberapa customer ada order, beberapa tidak)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES 
(1, '2024-01-15', 15000000, 'Delivered'),
(1, '2024-02-20', 1500000, 'Delivered'),
(2, '2024-01-25', 225000, 'Processing'),
(3, '2024-02-10', 12000000, 'Shipped');
-- Alice (CustomerID=4) tidak ada order

-- Insert Order Items
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 1, 15000000),  -- John beli iPhone
(2, 3, 1, 1500000),   -- John beli Nike Shoes
(3, 4, 1, 150000),    -- Jane beli Java Book
(3, 5, 1, 75000),     -- Jane beli T-Shirt
(4, 2, 1, 12000000);  -- Bob beli Samsung

-- ========================================
-- 1. INNER JOIN - Hanya data yang ada di KEDUA tabel
-- ========================================
PRINT '=== 1. INNER JOIN ===';
PRINT 'Menampilkan produk yang PUNYA kategori';
PRINT '';

SELECT 
    p.ProductName,
    c.CategoryName,
    p.Price,
    p.Stock
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

PRINT '';
PRINT 'Menampilkan customer yang PERNAH order';
SELECT 
    c.CustomerName,
    c.City,
    o.OrderDate,
    o.TotalAmount,
    o.Status
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate;

-- ========================================
-- 2. LEFT JOIN - SEMUA data tabel KIRI + yang cocok dari tabel kanan
-- ========================================
PRINT '';
PRINT '=== 2. LEFT JOIN ===';
PRINT 'Menampilkan SEMUA customer (termasuk yang belum pernah order)';
PRINT '';

SELECT 
    c.CustomerName,
    c.City,
    c.Email,
    COUNT(o.OrderID) AS TotalOrders,
    ISNULL(SUM(o.TotalAmount), 0) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.City, c.Email
ORDER BY TotalSpent DESC;

PRINT '';
PRINT 'Menampilkan SEMUA kategori (termasuk yang belum ada produk)';
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS TotalProducts,
    ISNULL(AVG(p.Price), 0) AS AvgPrice
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalProducts DESC;

-- ========================================
-- 3. RIGHT JOIN - SEMUA data tabel KANAN + yang cocok dari tabel kiri  
-- ========================================
PRINT '';
PRINT '=== 3. RIGHT JOIN ===';
PRINT 'Menampilkan SEMUA orders (termasuk yang mungkin tidak ada customer - jika ada)';
PRINT '';

SELECT 
    c.CustomerName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate;

PRINT '';
PRINT 'Menampilkan SEMUA produk (termasuk yang belum pernah dibeli)';
SELECT 
    p.ProductName,
    p.Price,
    COUNT(oi.OrderItemID) AS TimesSold,
    ISNULL(SUM(oi.Quantity), 0) AS TotalQuantitySold
FROM OrderItems oi
RIGHT JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, p.Price
ORDER BY TotalQuantitySold DESC;

-- ========================================
-- 4. FULL OUTER JOIN - SEMUA data dari KEDUA tabel
-- ========================================
PRINT '';
PRINT '=== 4. FULL OUTER JOIN ===';
PRINT 'Menampilkan SEMUA customer DAN SEMUA orders';
PRINT '';

SELECT 
    ISNULL(c.CustomerName, 'Unknown Customer') AS CustomerName,
    ISNULL(c.City, 'Unknown City') AS City,
    ISNULL(CAST(o.OrderID AS NVARCHAR), 'No Order') AS OrderInfo,
    ISNULL(o.Status, 'No Order') AS OrderStatus,
    ISNULL(o.TotalAmount, 0) AS Amount
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName, o.OrderDate;

-- ========================================
-- 5. MULTIPLE JOIN - Gabungan beberapa tabel
-- ========================================
PRINT '';
PRINT '=== 5. MULTIPLE JOIN ===';
PRINT 'Laporan lengkap: Customer + Order + Product + Category';
PRINT '';

SELECT 
    c.CustomerName,
    c.City,
    o.OrderDate,
    p.ProductName,
    cat.CategoryName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS Subtotal
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID  
INNER JOIN Products p ON oi.ProductID = p.ProductID
INNER JOIN Categories cat ON p.CategoryID = cat.CategoryID
ORDER BY c.CustomerName, o.OrderDate;

-- ========================================
-- 6. CONTOH BUSINESS QUESTIONS DENGAN JOIN
-- ========================================
PRINT '';
PRINT '=== 6. BUSINESS ANALYSIS ===';
PRINT '';

-- Siapa customer terbaik?
PRINT 'A. Top 3 Customer (berdasarkan total pembelian):';
SELECT TOP 3
    c.CustomerName,
    c.City,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.City
ORDER BY TotalSpent DESC;

PRINT '';
PRINT 'B. Produk terlaris:';
SELECT 
    p.ProductName,
    cat.CategoryName,
    SUM(oi.Quantity) AS TotalSold,
    SUM(oi.Quantity * oi.UnitPrice) AS Revenue
FROM Products p
INNER JOIN OrderItems oi ON p.ProductID = oi.ProductID
INNER JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY p.ProductID, p.ProductName, cat.CategoryName
ORDER BY TotalSold DESC;

PRINT '';
PRINT 'C. Kategori dengan penjualan tertinggi:';
SELECT 
    cat.CategoryName,
    COUNT(oi.OrderItemID) AS ItemsSold,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM Categories cat
INNER JOIN Products p ON cat.CategoryID = p.CategoryID
INNER JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY cat.CategoryID, cat.CategoryName
ORDER BY TotalRevenue DESC;


-- ========================================
-- 6. CONTOH SUBQUERY
-- ========================================
-- Produk yang harganya lebih mahal dari rata-rata harga produk
SELECT 
    ProductName,
    Price,
    Stock
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)
ORDER BY Price DESC;


-- Customer yang belanjanya lebih besar dari total belanja rata-rata semua customer.
SELECT 
    c.CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING SUM(o.TotalAmount) > (
    SELECT AVG(TotalAmount) 
    FROM Orders
);


-- ========================================
-- 6. CONTOH Transaction
-- ========================================

-- Customer baru membuat order dan detail order → kita harus insert ke Orders dan OrderItems. 
-- Kalau salah satu gagal, semua rollback
select * from Orders o
order by OrderID DESC 

SELECT * FROM Products p 

BEGIN TRANSACTION;

BEGIN TRY
    -- 1. Insert ke tabel Orders
    DECLARE @NewOrderID INT;

    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status)
    VALUES (2, GETDATE(), 300000, 'Pending');

    -- Ambil OrderID terakhir yang baru dibuat
    SET @NewOrderID = SCOPE_IDENTITY();

    -- 2. Insert detail order ke OrderItems
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (@NewOrderID, 4, 2, 150000);  -- Jane beli 2 Java Book

    -- 3. Update stok produk
    UPDATE Products
    SET Stock = Stock - 2
    WHERE ProductID = 4;

    -- Kalau semua berhasil, commit
    COMMIT TRANSACTION;
    PRINT 'Transaksi berhasil!';
END TRY
BEGIN CATCH
    -- Kalau ada error, rollback
    ROLLBACK TRANSACTION;
    PRINT 'Terjadi error, transaksi dibatalkan!';
END CATCH;


BEGIN TRANSACTION;

BEGIN TRY
    -- 1. Insert ke Orders
    DECLARE @NewOrderID INT;

    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status)
    VALUES (3, GETDATE(), 500000, 'Pending');

    SET @NewOrderID = SCOPE_IDENTITY();

    -- 2. Insert ke OrderItems dengan ProductID yang salah (9999 tidak ada di Products)
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (@NewOrderID, 9999, 1, 500000);  -- ERROR di sini

    -- 3. Update stok (tidak akan jalan karena step 2 error duluan)
    UPDATE Products
    SET Stock = Stock - 1
    WHERE ProductID = 9999;

    -- Commit kalau semua berhasil
    COMMIT TRANSACTION;
    PRINT 'Transaksi berhasil!';
END TRY
BEGIN CATCH
    -- Rollback kalau ada error
    ROLLBACK TRANSACTION;
    PRINT 'Terjadi error, transaksi dibatalkan!';
    PRINT ERROR_MESSAGE();  -- tampilkan pesan error
END CATCH;


