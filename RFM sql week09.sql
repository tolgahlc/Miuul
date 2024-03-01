CREATE TABLE RFM_TOLGA(
ID int IDENTITY(1,1) not null primary key,
Customer_ID SMALLINT,
Tenure smallint,
Monetary int,
Basket_Size INT,
Frequance SMALLINT,
Recency SMALLINT   
)
DECLARE @Bugun DATETIME
SET @Bugun = '2012-01-01'

INSERT INTO RFM_TOLGA (Customer_ID, Tenure, Monetary, Recency, Frequance)
SELECT 
    A.Customer_ID,
    DATEDIFF(DAY, MIN(A.Invoicedate), @Bugun) AS Tenure,
    SUM(A.Quantity * A.Price) AS Monetary,
    DATEDIFF(DAY, MAX(A.InvoiceDate), @Bugun) AS Recency,
    B.Frekans AS Frequance
FROM Retail1011A A
LEFT JOIN (
    SELECT 
        Customer_ID,
        COUNT(Customer_ID) AS Frekans 
    FROM (
        SELECT 
            Customer_ID,
            ROW_NUMBER() OVER (PARTITION BY Invoice ORDER BY Invoice) AS RN 
        FROM Retail1011A
    ) SubQuery
    WHERE RN = 1
    GROUP BY Customer_ID
) B ON A.Customer_ID = B.Customer_ID
GROUP BY A.Customer_ID, B.Frekans;

UPDATE RFM_TOLGA SET Basket_Size = RFM_TOLGA.Monetary/RFM_TOLGA.Frequance





select * from RFM_TOLGA

TRUNCATE table RFM_TOLGA

DROP table RFM_TOLGA




select * from Retail1011A




