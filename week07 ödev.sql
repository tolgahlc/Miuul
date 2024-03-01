--1. Ortalama "geciken ürünler" kaç gün gecikti.
SELECT AVG(DATEDIFF(DAY,RequiredDate,ShippedDate)) as Gecikme FROM Orders WHERE ShippedDate>RequiredDate
-- 2. Ortalama "erken giden ürünler" kaç gün erken gitti.
SELECT AVG(DATEDIFF(DAY,ShippedDate,RequiredDate)) as Erken FROM Orders WHERE ShippedDate<RequiredDate
-- 3. CustomerID bazında toplam ne kadargelir getirdi.
SELECT Customer_ID,SUM(Quantity*Price) as Monetary    from retail_2010_2011 GROUP BY Customer_ID
-- 4. CustomerID bazında toplam 2011.13.30 tarihine göre - Recency
SELECT Customer_ID,DATEDIFF(DAY,Max(InvoiceDate),'2011.12.30') as Recency from retail_2010_2011 GROUP BY Customer_ID
-- 5. Ülke bazında en fazla satın alınan ürünlerin toplam cirosu.
SELECT
    Country,
    [Description],
    TotalQuantity,
    TotalRevenue
FROM (
    SELECT
       Country,
       [Description],
        SUM(Quantity) as TotalQuantity,
        SUM(Quantity * Price) as TotalRevenue,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Quantity) DESC) as RowNum
    FROM [retail_2010_2011]
    GROUP BY Country, [Description]
) Ranked
WHERE RowNum = 1
ORDER BY 3 DESC



    

