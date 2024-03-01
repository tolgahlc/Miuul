--1. Yıllara ve Aylara Göre Toplam Satışları Bulacağınız Sorguyu Yazınız.
SELECT year(OrderDate) as Yıl,MONTH(OrderDate) as AY, COUNT(OrderDate) as Kaçtane FROM ORDERS GROUP BY YEAR(OrderDate),MONTH(OrderDate) ORDER BY 1,2

--2. En Yüksek Sipariş Veren İlk 5 Müşteriyi Bulacağınız Sorguyu Yazınız.

SELECT TOP 5 Orders.CustomerID,SUM([Order Details].[UnitPrice]*[Order Details].[Quantity]) AS KAÇ_PARA from Orders LEFT JOIN [Order Details]
ON ORDERS.OrderID=[Order Details].OrderID GROUP BY Orders.CustomerID ORDER BY 2 DESC

--3. Her Ürün İçin Ortalama Satış Fiyatını Bulacağınız Sorguyu Yazınız.

select productID,AVG(UnitPrice) as OrtalamaFiyat from [Order Details] GROUP BY ProductID ORDER BY ProductID 

--4. Her Kategorideki Toplam Ürün Sayısını Bulacağınız Sorguyu Yazınız.

select categoryID,COUNT(*) AS Urun_Sayisi from Products GROUP BY CategoryID order BY CategoryID

--5. Her Çalışanın Aldığı Toplam Sipariş Sayısını Bulacağınız Sorguyu Yazınız.

SELECT EmployeeID,COUNT(*) as KaçSipariş from Orders GROUP BY EmployeeID ORDER BY EmployeeID

--6. En Çok Sipariş Edilen Ürünleri Bulacağınız Sorguyu Yazınız.

SELECT PRODUCTID, SUM(QUANTITY) AS ADET FROM [Order Details] GROUP BY ProductID ORDER BY 2 DESC

--7. Her Müşteri İçin Toplam Harcama ve Ortalama Sipariş Değerini Bulacağınız Sorguyu Yazınız.

SELECT Customers.CustomerID,SUM([Order Details].UnitPrice*[Order Details].Quantity) as ToplamHarcama, AVG([Order Details].UnitPrice*[Order Details].Quantity) AS BasketSize
from Customers LEFT JOIN ORDERS ON Customers.CustomerID=Orders.CustomerID LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY Customers.CustomerID

--8. Her Ülkenin Müşteri Sayısını Bulacağınız Sorguyu Yazınız.

select country,COUNT(*) as MüşteriSayisi from Customers GROUP BY Country

--9. Stoktaki Her Ürün İçin Toplam Değerini Bulacağınız Sorguyu Yazınız.

SELECT ProductID,(UnitPrice*UnitsInStock)  From Products

--10. Her Çalışanın Yönettiği Müşteri Sayısını Bulacağınız Sorguyu Yazınız.

SELECT Employees.EmployeeID,COUNT(distinct Orders.CustomerID) AS KAÇMÜŞTERİ FROM Employees LEFT JOIN Orders ON Employees.EmployeeID=Orders.EmployeeID GROUP by Employees.EmployeeID

--11. Her Kategorideki En Pahalı Ürünü Bulacağınız Sorguyu Yazınız.

SELECT CategoryID,MAX(UnitPrice) AS EnPahali   FROM Products GROUP BY CategoryID

--12. Her Müşterinin İlk ve Son Sipariş Tarihlerini Bulacağınız Sorguyu Yazınız.

SELECT CustomerID,Min(OrderDate) as İlkSiparis,MAX(OrderDate) as SonSiparis  from Orders GROUP BY CustomerID

--13. Her Yıl İçin Toplam Satış Miktarını ve Ortalama Satış Değerini Bulacağınız Sorguyu Yazınız.

SELECT YEAR(Orders.OrderDate) as YIL, SUM([Order Details].Quantity) as ToplamSatış, AVG([Order Details].Quantity*[Order Details].UnitPrice) as OrtalamaSatış
from Orders LEFT JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY YEAR(Orders.OrderDate) ORDER BY 1 

--14. Her Ürün İçin Son Sipariş Tarihini Bulacağınız Sorguyu Yazınız.

SELECT [Order Details].ProductID, MAX(Orders.OrderDate) as SonSiparis from Orders INNER JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY [Order Details].ProductID ORDER BY 1

--15. Her Müşteri İçin En Çok Satın Alınan Ürünü Bulacağınız Sorguyu Yazınız.

SELECT Orders.CustomerID, [Order Details].ProductID ,MAX([Order Details].Quantity) as Adet from Orders INNER JOIN [Order Details] on Orders.OrderID=[Order Details].OrderID GROUP BY orders.CustomerID,[Order Details].ProductID









