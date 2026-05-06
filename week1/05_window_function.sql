-- 5. 버전별 라운드 수 상위 10% 유저 찾기
WITH ranked AS ( 
	SELECT 
		userid, version, sum_gamerounds,
		NTILE(10) OVER (PARTITION BY version
						ORDER BY sum_gamerounds DESC) AS decile,
		ROW_NUMBER() OVER (PARTITION BY version
						ORDER BY sum_gamerounds DESC) AS row_num
	FROM cookie_cats
)

SELECT * FROM ranked WHERE row_num <= 10;

