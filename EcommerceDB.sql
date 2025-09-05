-- ================================
-- DATABASE E-COMMERCE DESIGN
-- SQL Server Implementation
-- ================================

-- Buat database baru
CREATE DATABASE ECommerceDB;
GO

USE ECommerceDB;
GO

-- ================================
-- 1. TABEL USERS (Pelanggan & Admin)
-- ================================
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20),
    DateOfBirth DATE,
    Gender NCHAR(1) CHECK (Gender IN ('M', 'F')),
    UserType NVARCHAR(20) DEFAULT 'Customer' CHECK (UserType IN ('Customer', 'Admin', 'Vendor')),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

-- ================================
-- 2. TABEL ALAMAT PENGGUNA
-- ================================
CREATE TABLE UserAddresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    AddressType NVARCHAR(20) DEFAULT 'Shipping' CHECK (AddressType IN ('Shipping', 'Billing')),
    AddressLine1 NVARCHAR(100) NOT NULL,
    AddressLine2 NVARCHAR(100),
    City NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    PostalCode NVARCHAR(10) NOT NULL,
    Country NVARCHAR(50) DEFAULT 'Indonesia',
    IsDefault BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- ================================
-- 3. TABEL KATEGORI PRODUK
-- ================================
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    ParentCategoryID INT NULL,
    ImageURL NVARCHAR(255),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

-- ================================
-- 4. TABEL BRAND/MEREK
-- ================================
CREATE TABLE Brands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500),
    LogoURL NVARCHAR(255),
    Website NVARCHAR(255),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- ================================
-- 5. TABEL PRODUK UTAMA
-- ================================
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    CategoryID INT NOT NULL,
    BrandID INT,
    SKU NVARCHAR(50) UNIQUE NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CompareAtPrice DECIMAL(10,2), -- Harga coret
    Cost DECIMAL(10,2), -- Harga modal
    Weight DECIMAL(8,2), -- Dalam gram
    Dimensions NVARCHAR(50), -- Panjang x Lebar x Tinggi
    IsActive BIT DEFAULT 1,
    IsFeatured BIT DEFAULT 0,
    MetaTitle NVARCHAR(200),
    MetaDescription NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);

-- ================================
-- 6. TABEL VARIAN PRODUK
-- ================================
CREATE TABLE ProductVariants (
    VariantID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    VariantName NVARCHAR(100) NOT NULL, -- Contoh: "Merah-XL", "64GB-Hitam"
    SKU NVARCHAR(50) UNIQUE NOT NULL,
    Price DECIMAL(10,2),
    Stock INT DEFAULT 0,
    Weight DECIMAL(8,2),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- ================================
-- 7. TABEL ATRIBUT PRODUK (Warna, Ukuran, dll)
-- ================================
CREATE TABLE ProductAttributes (
    AttributeID INT IDENTITY(1,1) PRIMARY KEY,
    AttributeName NVARCHAR(50) NOT NULL, -- Color, Size, Storage, dll
    IsRequired BIT DEFAULT 0,
    SortOrder INT DEFAULT 0
);

CREATE TABLE ProductAttributeValues (
    ValueID INT IDENTITY(1,1) PRIMARY KEY,
    AttributeID INT NOT NULL,
    Value NVARCHAR(100) NOT NULL,
    ColorCode NVARCHAR(7), -- Untuk warna dalam hex code
    SortOrder INT DEFAULT 0,
    FOREIGN KEY (AttributeID) REFERENCES ProductAttributes(AttributeID) ON DELETE CASCADE
);

CREATE TABLE ProductVariantAttributes (
    ProductVariantAttributeID INT IDENTITY(1,1) PRIMARY KEY,
    VariantID INT NOT NULL,
    AttributeID INT NOT NULL,
    ValueID INT NOT NULL,
    FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID) ON DELETE CASCADE,
    FOREIGN KEY (AttributeID) REFERENCES ProductAttributes(AttributeID),
    FOREIGN KEY (ValueID) REFERENCES ProductAttributeValues(ValueID),
    UNIQUE(VariantID, AttributeID)
);

-- ================================
-- 8. TABEL GAMBAR PRODUK
-- ================================
CREATE TABLE ProductImages (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    VariantID INT NULL, -- Null jika gambar untuk produk utama
    ImageURL NVARCHAR(255) NOT NULL,
    AltText NVARCHAR(200),
    SortOrder INT DEFAULT 0,
    IsPrimary BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID) ON DELETE CASCADE
);

-- ================================
-- 9. TABEL KERANJANG BELANJA
-- ================================
CREATE TABLE ShoppingCart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    VariantID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    AddedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID) ON DELETE CASCADE,
    UNIQUE(UserID, VariantID)
);

-- ================================
-- 10. TABEL METODE PEMBAYARAN
-- ================================
CREATE TABLE PaymentMethods (
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,
    MethodName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200),
    IsActive BIT DEFAULT 1,
    ProcessingFee DECIMAL(10,2) DEFAULT 0,
    ProcessingFeePercentage DECIMAL(5,2) DEFAULT 0
);

-- ================================
-- 11. TABEL KURIR/EKSPEDISI
-- ================================
CREATE TABLE ShippingMethods (
    ShippingMethodID INT IDENTITY(1,1) PRIMARY KEY,
    CourierName NVARCHAR(50) NOT NULL,
    ServiceName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(200),
    EstimatedDays NVARCHAR(20),
    IsActive BIT DEFAULT 1
);

-- ================================
-- 12. TABEL ORDERS/PESANAN
-- ================================
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderNumber NVARCHAR(50) UNIQUE NOT NULL,
    UserID INT NOT NULL,
    OrderStatus NVARCHAR(20) DEFAULT 'Pending' CHECK (OrderStatus IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Refunded')),
    PaymentStatus NVARCHAR(20) DEFAULT 'Unpaid' CHECK (PaymentStatus IN ('Unpaid', 'Paid', 'Partial', 'Refunded')),
    
    -- Detail Alamat
    ShippingAddressLine1 NVARCHAR(100) NOT NULL,
    ShippingAddressLine2 NVARCHAR(100),
    ShippingCity NVARCHAR(50) NOT NULL,
    ShippingState NVARCHAR(50) NOT NULL,
    ShippingPostalCode NVARCHAR(10) NOT NULL,
    ShippingCountry NVARCHAR(50) NOT NULL,
    
    -- Detail Pembayaran & Pengiriman
    PaymentMethodID INT,
    ShippingMethodID INT,
    
    -- Detail Biaya
    SubTotal DECIMAL(10,2) NOT NULL,
    ShippingCost DECIMAL(10,2) DEFAULT 0,
    Tax DECIMAL(10,2) DEFAULT 0,
    Discount DECIMAL(10,2) DEFAULT 0,
    TotalAmount DECIMAL(10,2) NOT NULL,
    
    -- Tanggal
    OrderDate DATETIME DEFAULT GETDATE(),
    ShippedDate DATETIME NULL,
    DeliveredDate DATETIME NULL,
    
    -- Catatan
    CustomerNotes NVARCHAR(500),
    AdminNotes NVARCHAR(500),
    
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID),
    FOREIGN KEY (ShippingMethodID) REFERENCES ShippingMethods(ShippingMethodID)
);

-- ================================
-- 13. TABEL DETAIL PESANAN
-- ================================
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    VariantID INT NOT NULL,
    ProductName NVARCHAR(200) NOT NULL,
    VariantName NVARCHAR(100),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
);

-- ================================
-- 14. TABEL PEMBAYARAN
-- ================================
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentMethodID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus NVARCHAR(20) DEFAULT 'Pending' CHECK (PaymentStatus IN ('Pending', 'Success', 'Failed', 'Cancelled')),
    TransactionID NVARCHAR(100),
    PaymentDate DATETIME,
    Notes NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID)
);

-- ================================
-- 15. TABEL TRACKING PENGIRIMAN
-- ================================
CREATE TABLE ShippingTracking (
    TrackingID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    TrackingNumber NVARCHAR(100),
    Status NVARCHAR(50),
    Location NVARCHAR(100),
    Notes NVARCHAR(300),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ================================
-- 16. TABEL WISHLIST
-- ================================
CREATE TABLE Wishlist (
    WishlistID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    AddedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    UNIQUE(UserID, ProductID)
);

-- ================================
-- 17. TABEL REVIEW PRODUK
-- ================================
CREATE TABLE ProductReviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    UserID INT NOT NULL,
    OrderID INT NULL, -- Untuk memastikan user sudah membeli
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Title NVARCHAR(200),
    ReviewText NVARCHAR(MAX),
    IsVerified BIT DEFAULT 0,
    IsApproved BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ================================
-- 18. TABEL KUPON DISKON
-- ================================
CREATE TABLE Coupons (
    CouponID INT IDENTITY(1,1) PRIMARY KEY,
    CouponCode NVARCHAR(50) UNIQUE NOT NULL,
    CouponType NVARCHAR(20) CHECK (CouponType IN ('Fixed', 'Percentage')),
    DiscountAmount DECIMAL(10,2) NOT NULL,
    MinOrderAmount DECIMAL(10,2) DEFAULT 0,
    MaxDiscountAmount DECIMAL(10,2), -- Untuk persentase
    UsageLimit INT, -- Null = unlimited
    UsedCount INT DEFAULT 0,
    ValidFrom DATETIME NOT NULL,
    ValidTo DATETIME NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- ================================
-- 19. TABEL PENGGUNAAN KUPON
-- ================================
CREATE TABLE CouponUsage (
    UsageID INT IDENTITY(1,1) PRIMARY KEY,
    CouponID INT NOT NULL,
    UserID INT NOT NULL,
    OrderID INT NOT NULL,
    DiscountAmount DECIMAL(10,2) NOT NULL,
    UsedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CouponID) REFERENCES Coupons(CouponID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ================================
-- 20. TABEL STOK MASUK/KELUAR
-- ================================
CREATE TABLE StockMovements (
    MovementID INT IDENTITY(1,1) PRIMARY KEY,
    VariantID INT NOT NULL,
    MovementType NVARCHAR(20) CHECK (MovementType IN ('In', 'Out', 'Adjustment')),
    Quantity INT NOT NULL,
    Reference NVARCHAR(100), -- Order ID, Purchase ID, dll
    Notes NVARCHAR(300),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (VariantID) REFERENCES ProductVariants(VariantID)
);

-- ================================
-- INDEXES UNTUK PERFORMANCE
-- ================================

-- Indexes untuk pencarian produk
CREATE INDEX IX_Products_CategoryID ON Products(CategoryID);
CREATE INDEX IX_Products_BrandID ON Products(BrandID);
CREATE INDEX IX_Products_IsActive ON Products(IsActive);
CREATE INDEX IX_Products_IsFeatured ON Products(IsFeatured);
CREATE INDEX IX_Products_Price ON Products(Price);

-- Indexes untuk orders
CREATE INDEX IX_Orders_UserID ON Orders(UserID);
CREATE INDEX IX_Orders_OrderStatus ON Orders(OrderStatus);
CREATE INDEX IX_Orders_OrderDate ON Orders(OrderDate);
CREATE INDEX IX_Orders_OrderNumber ON Orders(OrderNumber);

-- Indexes untuk product variants
CREATE INDEX IX_ProductVariants_ProductID ON ProductVariants(ProductID);
CREATE INDEX IX_ProductVariants_Stock ON ProductVariants(Stock);

-- Indexes untuk shopping cart
CREATE INDEX IX_ShoppingCart_UserID ON ShoppingCart(UserID);

-- ================================
-- SAMPLE DATA INSERT
-- ================================

-- Insert Payment Methods
INSERT INTO PaymentMethods (MethodName, Description) VALUES 
('Bank Transfer', 'Transfer bank manual'),
('Credit Card', 'Kartu kredit/debit'),
('E-Wallet', 'Dompet digital (OVO, GoPay, DANA)'),
('COD', 'Bayar di tempat');

-- Insert Shipping Methods
INSERT INTO ShippingMethods (CourierName, ServiceName, Description, EstimatedDays) VALUES 
('JNE', 'REG', 'Layanan reguler JNE', '2-3 hari'),
('JNE', 'OKE', 'Layanan ekonomis JNE', '3-5 hari'),
('J&T', 'REG', 'Layanan reguler J&T', '2-4 hari'),
('SiCepat', 'REG', 'Layanan reguler SiCepat', '2-3 hari'),
('Gosend', 'Same Day', 'Pengiriman hari yang sama', 'Same day');

-- Insert Sample Categories
INSERT INTO Categories (CategoryName, Description) VALUES 
('Electronics', 'Produk elektronik'),
('Fashion', 'Pakaian dan aksesoris'),
('Home & Living', 'Peralatan rumah tangga'),
('Books', 'Buku dan majalah'),
('Sports', 'Olahraga dan rekreasi');

-- Insert Sample Brands
INSERT INTO Brands (BrandName, Description) VALUES 
('Samsung', 'Electronics brand from South Korea'),
('Apple', 'Technology company from USA'),
('Nike', 'Sports and lifestyle brand'),
('Uniqlo', 'Japanese clothing brand'),
('IKEA', 'Swedish furniture brand');

-- Insert Product Attributes
INSERT INTO ProductAttributes (AttributeName, IsRequired) VALUES 
('Color', 1),
('Size', 1),
('Storage', 0),
('Material', 0);

-- Insert Attribute Values untuk Color
INSERT INTO ProductAttributeValues (AttributeID, Value, ColorCode) VALUES 
(1, 'Red', '#FF0000'),
(1, 'Blue', '#0000FF'),
(1, 'Black', '#000000'),
(1, 'White', '#FFFFFF'),
(1, 'Green', '#00FF00');

-- Insert Attribute Values untuk Size
INSERT INTO ProductAttributeValues (AttributeID, Value) VALUES 
(2, 'XS'),
(2, 'S'),
(2, 'M'),
(2, 'L'),
(2, 'XL'),
(2, 'XXL');

-- ================================
-- STORED PROCEDURES
-- ================================

-- Procedure untuk menambah produk ke keranjang
GO
CREATE PROCEDURE sp_AddToCart
    @UserID INT,
    @VariantID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT 1 FROM ShoppingCart WHERE UserID = @UserID AND VariantID = @VariantID)
    BEGIN
        UPDATE ShoppingCart 
        SET Quantity = Quantity + @Quantity,
            UpdatedAt = GETDATE()
        WHERE UserID = @UserID AND VariantID = @VariantID;
    END
    ELSE
    BEGIN
        INSERT INTO ShoppingCart (UserID, VariantID, Quantity)
        VALUES (@UserID, @VariantID, @Quantity);
    END
END
GO

-- Procedure untuk update stok
CREATE PROCEDURE sp_UpdateStock
    @VariantID INT,
    @Quantity INT,
    @MovementType NVARCHAR(20),
    @Reference NVARCHAR(100) = NULL,
    @Notes NVARCHAR(300) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    
    TRY
        -- Update stock
        IF @MovementType = 'In'
            UPDATE ProductVariants SET Stock = Stock + @Quantity WHERE VariantID = @VariantID;
        ELSE IF @MovementType = 'Out'
            UPDATE ProductVariants SET Stock = Stock - @Quantity WHERE VariantID = @VariantID;
        ELSE IF @MovementType = 'Adjustment'
            UPDATE ProductVariants SET Stock = @Quantity WHERE VariantID = @VariantID;
        
        -- Log movement
        INSERT INTO StockMovements (VariantID, MovementType, Quantity, Reference, Notes)
        VALUES (@VariantID, @MovementType, @Quantity, @Reference, @Notes);
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO

-- ================================
-- VIEWS UNTUK REPORTING
-- ================================

-- View untuk laporan penjualan
CREATE VIEW vw_SalesReport AS
SELECT 
    o.OrderID,
    o.OrderNumber,
    o.OrderDate,
    u.FirstName + ' ' + u.LastName AS CustomerName,
    o.OrderStatus,
    o.PaymentStatus,
    o.SubTotal,
    o.ShippingCost,
    o.Tax,
    o.Discount,
    o.TotalAmount,
    pm.MethodName AS PaymentMethod,
    sm.CourierName + ' - ' + sm.ServiceName AS ShippingMethod
FROM Orders o
LEFT JOIN Users u ON o.UserID = u.UserID
LEFT JOIN PaymentMethods pm ON o.PaymentMethodID = pm.PaymentMethodID
LEFT JOIN ShippingMethods sm ON o.ShippingMethodID = sm.ShippingMethodID;
GO

-- View untuk produk dengan stok dan rating
CREATE VIEW vw_ProductCatalog AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Description,
    p.Price,
    p.CompareAtPrice,
    c.CategoryName,
    b.BrandName,
    p.IsActive,
    p.IsFeatured,
    SUM(pv.Stock) AS TotalStock,
    ISNULL(AVG(CAST(pr.Rating AS FLOAT)), 0) AS AverageRating,
    COUNT(pr.ReviewID) AS ReviewCount
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN Brands b ON p.BrandID = b.BrandID
LEFT JOIN ProductVariants pv ON p.ProductID = pv.ProductID
LEFT JOIN ProductReviews pr ON p.ProductID = pr.ProductID AND pr.IsApproved = 1
GROUP BY p.ProductID, p.ProductName, p.Description, p.Price, p.CompareAtPrice, 
         c.CategoryName, b.BrandName, p.IsActive, p.IsFeatured;
GO

PRINT 'Database E-Commerce berhasil dibuat dengan lengkap!';
PRINT 'Includes: 20 Tables, Indexes, Stored Procedures, Views, dan Sample Data';
PRINT 'Siap digunakan untuk aplikasi e-commerce Anda!';