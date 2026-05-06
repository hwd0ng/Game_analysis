-- 목적: Cookie Cats A/B 테스트 데이터로 게이트 위치(30 vs 40)에 따른 D1/D7 잔존률 차이 분석
-- 데이터: kaggle.com/datasets/mursideyarkin/mobile-games-ab-testing-cookie-cats

SELECT * FROM cookie_cats

-- 1. 전체 유저 수와 A/B 그룹 비율확인
SELECT
	version,
	count(userid) AS user_count
FROM cookie_cats
GROUP BY version






		