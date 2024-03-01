--1
Select * from FLO
--2
select distinct count(master_id) as Kac_müsteri from FLO
--3
SELECT sum(order_num_total_ever_online)+sum(order_num_total_ever_offline) as Alisveris_Sayisi, SUM(customer_value_total_ever_offline) + SUM(customer_value_total_ever_online) as Toplam_ciro
from FLO
--4 
SELECT (SUM(customer_value_total_ever_offline) + SUM(customer_value_total_ever_online))/(sum(order_num_total_ever_online)+sum(order_num_total_ever_offline)) as Basketsize from FLO
--5
SELECT SUM(order_num_total_ever_offline) as TopAlisverisAdediOffline, SUM(customer_value_total_ever_offline) AS TopCiroOffline FROM FLO WHERE last_order_channel='Offline' 
SELECT SUM(order_num_total_ever_online) as TopAlisverisAdediOnline, SUM(customer_value_total_ever_online) AS TopCiroOnline FROM FLO WHERE NOT last_order_channel='Offline'
--6
SELECT YEAR(first_order_date) as YIL , (SUM(order_num_total_ever_offline)+SUM(order_num_total_ever_online)) AS ToplamAlisveris  from FLO GROUP BY YEAR(first_order_date) ORDER BY YEAR(first_order_date)

--7
SELECT last_order_channel, cast((SUM(customer_value_total_ever_offline) + SUM(customer_value_total_ever_online))/(sum(order_num_total_ever_online)+sum(order_num_total_ever_offline)) as int) as BasketSize 
from FLO  GROUP BY last_order_channel

--8
SELECT SUM(customer_value_total_ever_offline) as OFFLINE_TOPLAM_CİRO, SUM(customer_value_total_ever_online) AS ONLINE_TOPLAM_CİRO from FLO

--9
SELECT master_id,order_channel from FLO

--10
SELECT * from flo where not last_order_channel='Offline'

--11
SELECT * from FLO WHERE NOT last_order_channel='Offline' AND customer_value_total_ever_online > 1000
SELECT master_id,SUM(customer_value_total_ever_online) AS BuyukBin FROM FLO WHERE NOT last_order_channel='Offline' GROUP BY master_id HAVING SUM(customer_value_total_ever_online)>1000

--12

SELECT SUM(customer_value_total_ever_offline) + SUM(customer_value_total_ever_online) as Toplam_Ciro from FLO WHERE order_channel='Mobile' 

--13

SELECT interested_in_categories_12 FROM FLO
WHERE interested_in_categories_12 LIKE '%SPOR%'

--14
select customer_value_total_ever_offline from FLO  Where (customer_value_total_ever_offline < 10000)

--15

SELECT order_channel,interested_in_categories_12, SUM(order_num_total_ever_online) AS TOPLAM_ALİSVERİS_SAYİSİ, COUNT(order_num_total_ever_online) AS KAC_TANE
from FLO GROUP BY order_channel,interested_in_categories_12 ORDER BY TOPLAM_ALİSVERİS_SAYİSİ ASC

--16
SELECT last_order_channel,interested_in_categories_12, SUM(order_num_total_ever_online) AS TOPLAM_ALİSVERİS_SAYİSİ, COUNT(order_num_total_ever_online) AS KAC_TANE
from FLO GROUP BY last_order_channel,interested_in_categories_12 ORDER BY TOPLAM_ALİSVERİS_SAYİSİ desc

--17

SELECT TOP 50 master_id, (SUM(order_num_total_ever_offline)+SUM(order_num_total_ever_online)) AS TOPLAM  from FLO GROUP BY master_id ORDER BY 2 DESC

--18

SELECT YEAR(first_order_date) as YİL, COUNT(master_id) as Müsteri from FLO GROUP BY YEAR(first_order_date) ORDER BY YEAR(first_order_date) DESC

--19

SELECT YEAR(last_order_date) AS YİL,COUNT(master_id) AS KAC  from FLO GROUP BY YEAR(last_order_date)

--20

SELECT master_id,interested_in_categories_12,order_channel from FLO where interested_in_categories_12='[AKTIFSPOR]'

--21

SELECT master_id,interested_in_categories_12,order_channel from FLO where interested_in_categories_12 like '%AKTIFSPOR%'

--22

SELECT MONTH(first_order_date) as AY,YEAR(first_order_date) as YIL,COUNT(*) as Sayi  from FLO 
WHERE YEAR(first_order_date) BETWEEN 2018 and 2019 
GROUP BY YEAR(first_order_date), MONTH(first_order_date)
ORDER BY YEAR(first_order_date), MONTH(first_order_date)

--23

SELECT *  from FLO where order_channel='Mobile' or order_channel='Desktop'

--24 Order_channel'da mobile veya desktop siparişlerinde interested_in_categories_12 de 'AKTIFSPOR' olmayan kayıtları getiren sorguyu yazınız.

SELECT *  from FLO WHERE [interested_in_categories_12] not like '%AKTIFSPOR%' AND (order_channel='Mobile' or order_channel='Desktop')

--25 Onlinedaki en çok siparişin olduğu ayı ve bu aydaki toplam siparişi(ciro) getiren sorguyu yazınız.

SELECT TOP 1 MONTH(first_order_date) as Ay,YEAR(first_order_date) as Yil, (SUM(customer_value_total_ever_offline)+SUM(customer_value_total_ever_online)) as TOPLAM, SUM(customer_value_total_ever_online) as Online_Toplam from FLO 
GROUP BY MONTH(first_order_date),YEAR(first_order_date)
ORDER BY SUM(customer_value_total_ever_online) DESC

--- NORTHWIND DATABASE ---

--26 

SELECT * from Customers
SELECT * from Orders

SELECT * from Customers INNER JOIN Orders ON customers.CustomerID=orders.CustomerID

--27

SELECT * from Customers LEFT JOIN Orders ON customers.CustomerID=orders.CustomerID

--28

SELECT * from Customers RIGHT JOIN Orders ON customers.CustomerID=orders.CustomerID




















