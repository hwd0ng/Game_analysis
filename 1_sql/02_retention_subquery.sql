-- 2. D1, D7 잔존률(서브쿼리 버전)
SELECT
	version,
	count(*) AS total_users,
	SUM(CASE WHEN retention_1 = 'True' THEN 1 ELSE 0 END) AS retained_d1,
	ROUND(
		SUM(CASE WHEN retention_1 = 'True' THEN 1.0 ELSE 0 END)
		/ (SELECT COUNT(*) FROM cookie_cats c2
			WHERE c2.version = cookie_cats.version)
		* 100, 1
		) AS d1_rate,
	SUM(CASE WHEN retention_7 = 'True' THEN 1 ELSE 0 END) AS retained_d7,
	ROUND(
		SUM(CASE WHEN retention_7 = 'True' THEN 1.0 ELSE 0 END)
		/ (SELECT COUNT(*) FROM cookie_cats c3
			WHERE c3.version = cookie_cats.version)
		* 100, 1
	) AS d7_rate
FROM cookie_cats
GROUP BY version;