
DROP TABLE IF EXISTS Customers;

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Annual_Income INT,
    Spending_Score INT,
    Profession VARCHAR(50),
    WorkExperience INT,
    FamilySize INT,
    Age_Group VARCHAR(20)
);

COPY Customers(CustomerID, Gender, Age, Annual_Income, Spending_Score, Profession, WorkExperience, FamilySize, Age_Group)
FROM 'D:\job\Projects\Customer\Final_Customers.csv'
DELIMITER ','
CSV HEADER;


SELECT * FROM Customers;

SELECT age_group, COUNT(*) FROM Customers WHERE age_group IS NULL GROUP BY age_group;

DELETE FROM Customers WHERE age_group IS NULL;

--Which Gender has the highest average spending score with respect to annual income?
SELECT gender, AVG(Spending_Score) AS Average_Spending_Score, AVG(Annual_Income) AS Average_Annual_Income FROM Customers GROUP BY gender;

--Which Profession has the highest average annual income with respect to spending score?
SELECT profession, AVG(Annual_Income) AS Average_Annual_Income, AVG(Spending_Score) AS Average_Spending_Score FROM Customers GROUP BY profession ORDER BY Average_Spending_Score DESC;

--Which AGE GROUP has the highest average spending score with respect to annual income?
SELECT age_group, AVG(Spending_Score) AS Average_Spending_Score, AVG(Annual_Income) AS Average_Annual_Income FROM Customers GROUP BY age_group ORDER BY Average_Spending_Score DESC;

--Which Family Size has the highest average spending score with respect to annual income?
SELECT familysize, AVG(Spending_Score) AS Average_Spending_Score, AVG(Annual_Income) AS Average_Annual_Income FROM Customers GROUP BY familysize ORDER BY Average_Spending_Score DESC;