-- Identify Out-of-Range Dates

SELECT DISTINCT
bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1900-01-01' OR bdate > GETDATE()


-- Data Standardization & Consistency
SELECT Distinct
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	 ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12


SELECT *
FROM silver.erp_cust_az12