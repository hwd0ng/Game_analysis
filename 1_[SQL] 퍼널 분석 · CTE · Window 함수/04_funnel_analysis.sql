-- 4. 퍼널 쿼리 - 라운드 구간별 이탈 분석
WITH user_segments AS ( 
	SELECT
		userid, version, sum_gamerounds,
		CASE
			WHEN sum_gamerounds = 0 THEN '0. 설치만 하고 미실행'
			WHEN sum_gamerounds BETWEEN 1 AND 5 THEN '1. 1~5라운드'
			WHEN sum_gamerounds BETWEEN 6 AND 30 THEN '2. 6~30라운드'
			WHEN sum_gamerounds BETWEEN 31 AND 100 THEN '3. 31~100라운드'
			ELSE '4. 100라운드 이상'
		END AS play_segment
	FROM cookie_cats
),
funnel AS (
	SELECT 
		play_segment, count(*) AS user_count
	FROM user_segments
	GROUP BY play_segment
),
total AS (
	SELECT count(*) AS total FROM cookie_cats
)


SELECT 
	f.play_segment,
	f.user_count,
	ROUND(f.user_count * 100.0 / t.total, 1) AS pct
FROM funnel f, total t
ORDER BY f.play_segment;



