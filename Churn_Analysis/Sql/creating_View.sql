CREATE OR ALTER VIEW vw_ChurnData AS 
SELECT * FROM db_Churn.dbo.prod_churn 
WHERE Customer_Status IN ('Churned','Stayed')
go 

CREATE OR ALTER VIEW vw_JoinedData AS 
SELECT * FROM db_Churn.dbo.prod_churn 
WHERE Customer_Status = 'Joined'
go