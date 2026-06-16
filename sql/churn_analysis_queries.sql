
-- Customer Churn Analysis BI
-- SQL queries for business analysis

-- 1. Overall churn rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate
FROM customer_churn;


-- 2. Churn rate by contract type
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;


-- 3. Churn rate by tenure group
SELECT 
    Tenure_Group,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Tenure_Group
ORDER BY churn_rate DESC;


-- 4. Churn rate by monthly charge group
SELECT 
    Monthly_Charge_Group,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customer_churn
GROUP BY Monthly_Charge_Group
ORDER BY churn_rate DESC;


-- 5. Churn rate by payment method
SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- 6. Churn rate by internet service
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;


-- 7. Churn risk level summary
SELECT 
    Churn_Risk_Level,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(AVG(Churn_Flag) * 100, 2) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customer_churn
GROUP BY Churn_Risk_Level
ORDER BY churn_rate DESC;


-- 8. High-risk customers list
SELECT 
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    TotalCharges,
    PaymentMethod,
    InternetService,
    Churn_Risk_Level
FROM customer_churn
WHERE Churn_Risk_Level = 'High Risk'
ORDER BY MonthlyCharges DESC;
