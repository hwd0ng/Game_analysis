-- 3. D1, D7 잔존률 (CTE 버전)
WITH group_stats AS (
	SELECT 
		version,
		count(*) AS total_users,
		SUM(CASE WHEN retention_1 = 'True' THEN 1 ELSE 0 END) AS retained_d1,
		SUM(CASE WHEN retention_7 = 'True' THEN 1 ELSE 0 END) AS retained_d7
	FROM cookie_cats GROUP BY version
)
SELECT
	version,
	total_users,
	retained_d1,
	ROUND(retained_d1 * 100.0 / total_users, 1) AS d1_rate,
	retained_d7,
	ROUND(retained_d7 * 100.0 / total_users, 1) AS d7_rate
FROM group_stats;