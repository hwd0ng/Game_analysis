<h2>1_SQL [ 퍼널 분석 · CTE · Window 함수 ]</h2>

- 목적: Cookie Cats A/B 테스트 데이터로 게이트 위치(30 vs 40)에 따른
        D1/D7 잔존률 차이 분석
- 데이터: kaggle.com/datasets/mursideyarkin/mobile-games-ab-testing-cookie-cats
- 서브쿼리 → CTE 리팩터링    ( ✅ 완료 )
- 퍼널 쿼리 작성              ( ✅ 완료 )

---

<h2>2_Python [ 게임 데이터 탐색 · 퍼널 시각화 ]</h2>

- 목적: Steam 게임 데이터로 구매→플레이 전환율 및
        플레이 시간 구간별 유저 분포 분석
- 데이터: kaggle.com/datasets/tamber/steam-video-games
- 구매→플레이 퍼널 분석        ( ✅ 완료 )
- 플레이 시간 구간별 세그먼트   ( ✅ 완료 )
- 게임별 평균 플레이 시간 Top 10 ( ✅ 완료 )
- 시각화 및 이미지 저장         ( ✅ 완료 )

### 플레이 시간 구간별 유저 분포
![steam funnel](2_python/steam_funnel.png)

---

<h2>3_Statistics [ A/B 테스트 유의성 검정 ]</h2>

- 목적: Cookie Cats A/B 테스트 통계적 유의성 검정
- 데이터: Cookie Cats (SQL 실습과 동일)
- D1 잔존률 카이제곱 검정   ( ✅ 완료 )
- D7 잔존률 카이제곱 검정   ( ✅ 완료 )
- 결론 및 액션 아이템 도출  ( ✅ 완료 )

---

<h2>4_ML [ 이탈 예측 · Snowflake 환경 실습 ]</h2>

- 목적: D7 이탈 예측 모델 구현 및 Snowflake 환경 실습
- 데이터: Cookie Cats (SQL 실습과 동일)
- D7 이탈 예측 로지스틱 회귀       ( ✅ 완료 )
- 변수 중요도 분석 및 인사이트 도출 ( ✅ 완료 )
- Snowflake CSV 적재 + 쿼리 실습   ( ✅ 완료 )

### D7 이탈 예측 혼동 행렬
![confusion matrix](4_ml/confusion_matrix.png)

---

<h2>5_Tableau [ 시각화 Tableau 대시보드 구축 ]</h2>

- 목적: Cookie Cats A/B 테스트 결과 Tableau 대시보드 시각화
- 데이터: Cookie Cats (SQL 실습과 동일)
- A/B 그룹별 D1·D7 잔존률 막대차트  ( ✅ 완료 )
- 플레이 구간별 유저 분포 퍼널차트   ( ✅ 완료 )
- 버전별 평균 플레이 라운드 막대차트  ( ✅ 완료 )
- Tableau Public 대시보드 게시       ( ✅ 완료 )

🔗 [Tableau 대시보드 보기](https://public.tableau.com/views/cookie_cats_abtest_analysis_17784089744060/CookieCatsAB?:language=ko-KR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

--- 

<h2>5_Project [ 게임 유저 이탈 분석 ]</h2>

- 목적: MMORPG 유저 행동 데이터 기반 이탈 요인 분석 및 세그먼트 도출
- 데이터: Kaggle Online Gaming Behavior Dataset (40,034명)
- 분석 설계서 + 7개 가설 수립    ( ✅ 완료 )
- EDA · 이탈/잔존 비교           ( ✅ 완료 )
- 로지스틱 회귀 이탈 예측 모델   ( ✅ 완료 )
- 이탈 위험 세그먼트 정의        ( ✅ 완료 )
- 액션 아이템 도출               ( ✅ 완료 )

### 변수별 이탈 영향도
![feature importance](5_project/feature_importance.png)

[ 로지스틱 회귀 분석 결과 ]

<img width="524" height="497" alt="image" src="https://github.com/user-attachments/assets/f1a37c5b-b1ba-42f9-ac0f-84b270b066b9" />

아래 네 가지 변수가 통계적으로 유의미 ( p-value < 0.05 )

- x2: SessionsPerWeek            (주당 게임 세션 수)
- x3: AvgSessionDurationMinutes  (각 게임 세션의 평균 지속 시간(분))
- x4: PlayerLevel                (게임 내 플레이어의 현재 레벨)
- x5: AchievementsUnlocked       (플레이어가 달성한 업적의 수)

### 이탈 위험도 구간별 유저 분포
![risk segment](5_project/risk_segment.png)
