CREATE DATABASE ECommerceDB;

-- create tabl;e
CREATE TABLE Brands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500),
    LogoURL NVARCHAR(255),
    Website NVARCHAR(255),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);

select * from Brands b 

INSERT INTO Brands (BrandName, Description, LogoURL, Website)
VALUES
('TechNova', 'Perusahaan teknologi inovatif di bidang AI.', 'https://example.com/logo/technova.png', 'https://technova.com'),
('GreenLife', 'Brand ramah lingkungan yang fokus pada produk organik.', 'https://example.com/logo/greenlife.png', 'https://greenlife.org'),
('SkyNetics', 'Startup penerbangan dan drone otonom.', 'https://example.com/logo/skynetics.png', 'https://skynetics.ai'),
('MediCareX', 'Brand layanan kesehatan digital modern.', 'https://example.com/logo/medicarex.png', 'https://medicarex.com'),
('EduSmart', 'Platform pendidikan berbasis AI.', 'https://example.com/logo/edusmart.png', 'https://edusmart.io'),
('AutoFlex', 'Produsen mobil listrik dengan teknologi fleksibel.', 'https://example.com/logo/autoflex.png', 'https://autoflex.ev'),
('FoodieBox', 'Layanan pengiriman makanan segar ke rumah.', 'https://example.com/logo/foodiebox.png', 'https://foodiebox.com'),
('TravelMate', 'Aplikasi perjalanan dan booking hotel.', 'https://example.com/logo/travelmate.png', 'https://travelmate.co'),
('FitZone', 'Produk kesehatan & kebugaran modern.', 'https://example.com/logo/fitzone.png', 'https://fitzone.fit'),
('AquaPure', 'Brand penyedia air minum bersih dan sehat.', 'https://example.com/logo/aquapure.png', 'https://aquapure.net'),
('ByteWorks', 'Software house penyedia solusi enterprise.', 'https://example.com/logo/byteworks.png', 'https://byteworks.dev'),
('NeoWear', 'Pakaian pintar dengan sensor IoT.', 'https://example.com/logo/neowear.png', 'https://neowear.tech'),
('FarmFresh', 'Distribusi produk pertanian langsung dari petani.', 'https://example.com/logo/farmfresh.png', 'https://farmfresh.id'),
('GameSphere', 'Developer game VR dan AR.', 'https://example.com/logo/gamesphere.png', 'https://gamesphere.gg'),
('BuildMax', 'Perusahaan konstruksi dengan teknologi modern.', 'https://example.com/logo/buildmax.png', 'https://buildmax.co'),
('StyleHub', 'E-commerce fashion global.', 'https://example.com/logo/stylehub.png', 'https://stylehub.store'),
('Cloudify', 'Penyedia layanan cloud computing.', 'https://example.com/logo/cloudify.png', 'https://cloudify.cloud'),
('SolarGen', 'Energi terbarukan berbasis tenaga surya.', 'https://example.com/logo/solargen.png', 'https://solargen.energy'),
('CarePet', 'Produk dan layanan kesehatan hewan.', 'https://example.com/logo/carepet.png', 'https://carepet.vet'),
('RoboLink', 'Perusahaan robotika untuk industri manufaktur.', 'https://example.com/logo/robolink.png', 'https://robolink.ai');

--select
SELECT BrandID, BrandName, Website
FROM Brands;

--where
SELECT BrandID, BrandName, Website
FROM Brands
WHERE IsActive = 1;

-- filtering & sorting
-- Filtering (menggunakan kondisi)
SELECT BrandID, BrandName, Website
FROM Brands
WHERE BrandName LIKE 'S%';  -- hanya brand yang namanya diawali huruf S

-- Sorting (ORDER BY)Sorting (ORDER BY)
SELECT BrandID, BrandName, CreatedAt
FROM Brands
ORDER BY CreatedAt DESC;

--Aggregate Functions
-- Count
SELECT COUNT(*) AS TotalBrands
FROM Brands;

-- Max Min
-- contoh: hitung rata-rata panjang karakter nama brand
SELECT AVG(LEN(BrandName)) AS RataPanjangNama
FROM Brands;

--GROUP BY dengan COUNTGROUP BY dengan COUNT
SELECT IsActive, COUNT(*) AS JumlahBrand
FROM Brands
GROUP BY IsActive;





