--Soru 1: Müşterilerin En Çok Sipariş Verdiği 5 Ürünü Bulacağınız Sorguyu Yazın.
SELECT TOP 5 Products.ProductName,sum([Order Details].Quantity) as Kaçtane from [Order Details] LEFT JOIN Products on [Order Details].ProductID=Products.ProductID GROUP BY Products.ProductName ORDER BY 2 DESC

--Soru 2: Her Müşteri İçin Toplam Harcama ve Sipariş Sayısını Bulacağınız Sorguyu Yazın.
SELECT Customers.ContactName,sum([Order Details].Quantity*[Order Details].UnitPrice) as ToplamHarcama,COUNT([Order Details].OrderID) as SiparisSayisi from Customers LEFT JOIN [Orders] on Customers.CustomerID=Orders.CustomerID LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY Customers.ContactName

--Soru 3: Her Kategorideki En Yüksek Fiyatlı Ürünü Bulacağınız Sorguyu Yazın.
SELECT 
    CategoryID,
    ProductName,
    TotalPrice
FROM (
    SELECT 
        CategoryID,
        ProductName,
        Max(UnitPrice) as TotalPrice,
        ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY Max(UnitPrice) DESC ) as RowNum
    FROM [Products] 
    GROUP BY CategoryID,ProductName
) a
WHERE RowNum=1
ORDER BY 1 DESC



--Soru 4: Çalışanların Sipariş Başına Ortalama Satış Miktarını Hesaplayacağınız Sorguyu Yazın.
SELECT Orders.EmployeeID,AVG([Order Details].UnitPrice*[Order Details].Quantity) as OrtalamaSatış from Orders LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY Orders.EmployeeID ORDER BY 2

--Soru 5: Her Ülke İçin Müşteri Sayısı ve Toplam Sipariş Miktarını Bulacağınız Sorguyu Yazın.
SELECT Customers.Country,COUNT(*) as MüşteriSayisi, SUM([Order Details].Quantity) as ToplamSiparis from Customers LEFT JOIN Orders on Customers.CustomerID=Orders.CustomerID LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY Customers.Country

--Soru 6: Stok Miktarına Göre Ürünlerin Durumunu Sınıflandırma Yapacağınız Sorguyu Yazın.
SELECT  ProductName,UnitsInStock,CASE WHEN UnitsInStock = 0 THEN 'Stokta Yok' ELSE 'Stokta' END AS StockStatus FROM Products

--Soru 7: Her Çalışanın Son 6 Ay İçinde Yaptığı Toplam Satış Miktarını Bulacağınız Sorguyu Yazın.
SELECT Orders.EmployeeID,sum([Order Details].UnitPrice*[Order Details].Quantity) as ToplamSatış from Orders LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID where Orders.OrderDate>'1997.11.06' GROUP BY Orders.EmployeeID ORDER BY 1


--Soru 8: Her Müşteri İçin İlk ve Son Sipariş Tarihleri Bulacağınız Sorguyu Yazın.
SELECT Customers.ContactName,min(Orders.OrderDate) as İlkSiparis,MAX(Orders.OrderDate) as SonSiparis from Customers LEFT JOIN Orders on Customers.CustomerID=Orders.CustomerID GROUP BY Customers.ContactName

--Soru 9: En Çok Sipariş Verilen 5 Şehri ve Bu Şehirlerdeki Toplam Sipariş Sayısını Bulacağınız Sorguyu Yazın.
SELECT top 5 Orders.ShipCity,COUNT(*) as KacSiparis from Orders LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY Orders.ShipCity ORDER BY 2 DESC

--Soru 10: Ürünlerin Kategorilere Göre Ortalama Fiyatlarını Bulacağınız Sorguyu Yazın.

SELECT CategoryID, AVG(UnitPrice) as OrtalamaFiyat  from Products GROUP BY CategoryID




