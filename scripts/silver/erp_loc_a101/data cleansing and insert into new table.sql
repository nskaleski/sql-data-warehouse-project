INSERT INTO silver.erp_loc_a101
(cid, cntry)
SELECT
REPLACE(cid, '-', '') cid,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END cntry
FROM bronze.erp_loc_a101


-- Data Standardization & Consistency
SELECt DISTINCT
cntry as old_cntry,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END cntry
FROM bronze.erp_loc_a101
ORDER BY cntry

SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

SELECT *
FROM silver.erp_loc_a101