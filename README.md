# 게임 데이터 분석 포트폴리오

**기술 스택**
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=flat&logo=tableau&logoColor=white)
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=flat&logo=snowflake&logoColor=white)

| 섹션 | 주요 내용 | 데이터 |
|------|----------|--------|
| 1_SQL | 퍼널 분석 · CTE · Window 함수 · Snowflake 활용 | Cookie Cats |
| 2_Python | 게임 데이터 탐색 · 퍼널 시각화 | Steam |
| 3_Statistics | A/B 테스트 카이제곱 검정 | Cookie Cats |
| 4_ML | 이탈 예측 로지스틱 회귀 | Cookie Cats |
| 5_Project | 게임 유저 이탈 분석 (메인) | Online Gaming |

---

<h2>1_SQL [ 퍼널 분석 · CTE · Window 함수 ]</h2>

- 목적: Cookie Cats A/B 테스트 데이터로 게이트 버전(30 vs 40)에 따른
        D1/D7 잔존률 차이 분석
- 데이터: kaggle.com/datasets/mursideyarkin/mobile-games-ab-testing-cookie-cats

**(1) D1, D7 잔존률 서브쿼리 → CTE 리팩터링**
- D1: 플레이어가 설치 후 1일째에 다시 게임을 플레이했는지 여부
- D7: 플레이어가 설치 후 7일째에 다시 게임을 플레이했는지 여부<br>
<img width="844" height="125" alt="image" src="https://github.com/user-attachments/assets/7db1981a-046f-4cd5-b04f-3d7c920229d0" />
<br><br>

**(2) 라운드 구간별 이탈률 퍼널 쿼리 작성**<br><br>
<img width="467" height="195" alt="image" src="https://github.com/user-attachments/assets/12d2831f-9631-4689-b6e2-71f02b178764" />

**(3) 게이트 버전별 라운드 수 상위 10% 유저 찾기**
- 게이트 30버전
<img width="715" height="280" alt="image" src="https://github.com/user-attachments/assets/e5658405-24f8-4b55-819a-25b912ffc46b" />
<br><br>

- 게이트 40버전
<img width="707" height="280" alt="image" src="https://github.com/user-attachments/assets/52b5e75a-492a-4ba9-ba9b-0b4e15ca4f1b" />
<br><br>

**(4) Snowflake CSV 적재 + 쿼리 실습** <br><br>
<img width="1367" height="563" alt="image" src="https://github.com/user-attachments/assets/74f93fd8-1750-47ca-990c-bf323e6b5d38" />

---

<h2>2_Python [ 게임 데이터 탐색 · 퍼널 시각화 ]</h2>

- 목적: Steam 게임 데이터로 구매→플레이 전환율 및
        플레이 시간 구간별 유저 분포 분석
- 데이터: kaggle.com/datasets/tamber/steam-video-games

**(1) 구매→플레이 퍼널 분석**<br><br>
<img width="186" height="57" alt="image" src="https://github.com/user-attachments/assets/eb15e152-dd02-44f8-9285-93b16428f39a" />
<br><br>

**(2) 게임별 평균 플레이 시간 TOP 10**<br><br>
<img width="325" height="310" alt="image" src="https://github.com/user-attachments/assets/c1fbb852-d9c2-4b9c-9d90-df76c9b76bc4" />
<br><br>

**(3) 플레이 시간 구간별 세그먼트**<br><br>
<img width="285" height="108" alt="image" src="https://github.com/user-attachments/assets/575ee185-73f2-4e36-ab3a-4bfa296a732f" />
<br><br>

**(4) 플레이 시간 구간별 유저 분포 시각화**<br><br>
![steam funnel](2_python/steam_funnel.png)

---

<h2>3_Statistics [ A/B 테스트 유의성 검정 ]</h2>

- 목적: Cookie Cats A/B 테스트 통계적 유의성 검정
- 데이터: Cookie Cats (SQL 실습과 동일)

**(1) D1 잔존률 카이제곱 검정**<br><br>
<img width="493" height="172" alt="image" src="https://github.com/user-attachments/assets/55b54cd3-57d6-4a49-84dc-f28c4f55c09e" />

**(2) D7 잔존률 카이제곱 검정**<br><br>
<img width="451" height="173" alt="image" src="https://github.com/user-attachments/assets/94c65359-72c0-46ed-8cef-a847201db0c9" />

**(3) 결론 및 인사이트**<br><br>
<img width="322" height="92" alt="image" src="https://github.com/user-attachments/assets/2196616e-14b7-4ba8-849c-139cccb77d92" />

<img width="406" height="73" alt="image" src="https://github.com/user-attachments/assets/d52d52ef-a0e4-4b3e-85de-565cd9c36010" />

---

<h2>4_ML [ 로지스틱 회귀 - 이탈 예측 모델 ]</h2>

- 목적: D7 이탈 예측 모델 구현
- 데이터: Cookie Cats

**(1) D7 이탈 예측 로지스틱 회귀**<br>
- 이슈: 어떤 유저가 D7에 이탈할 것인가?
- 타겟 변수(y): D7 이탈 여부 (1=이탈, 0=잔존)
- 독립 변수(X): version(Gate 30/40그룹), sum_gamerounds(플레이 라운드 수), D1 잔존 여부

**(2) 독립 변수 간 다중 공선성 확인**<br><br>
<img width="583" height="503" alt="image" src="https://github.com/user-attachments/assets/683994da-8a9b-485f-8e09-5e60206103bd" />
<br><br>

**(3) 플레이 라운드 수(sum_gamerounds) 분포 확인 및 로그 변환**

<img width="850" height="380" alt="image" src="https://github.com/user-attachments/assets/1f0e1e06-e6e6-4943-ba7b-0c556e50829c" />
<br><br>

**(4) 타겟 변수 y(D7) 클래스 불균형 확인**

<img width="918" height="497" alt="image" src="https://github.com/user-attachments/assets/add557ac-5bc1-44f7-9db1-a779a5161ab9" />
<br><br>

**(5) 변수 중요도 분석 및 인사이트 도출**
- 변수별 계수
<img width="493" height="96" alt="image" src="https://github.com/user-attachments/assets/a1a5e4be-be0f-47d3-9b9a-d5486f0ab876" />

- 통계적 유의성 확인
<img width="540" height="301" alt="image" src="https://github.com/user-attachments/assets/b6d780ae-3ccb-4ba8-a16a-15907c57907c" />
<br><br>

**(6) 분류 리포트, 혼동행렬, ROC 그래프 시각화**<br><br>
<img width="434" height="188" alt="image" src="https://github.com/user-attachments/assets/feaef579-d418-43d4-b826-14ee85ef39ee" />

<img width="1111" height="602" alt="image" src="https://github.com/user-attachments/assets/493ad43f-97bc-429e-b593-d6fb0310761c" />

<img width="615" height="494" alt="image" src="https://github.com/user-attachments/assets/5398eee7-9109-4110-9d5a-06ceb3fc8520" />
<br><br>

**(7) 분석 결론**

### 1. 모델 성능
- 로지스틱 회귀로 D7 이탈 예측 모델 구축 완료
- ROC-AUC 0.7 이상이면 준수한 예측력
- `class_weight="balanced"` 적용으로 이탈 클래스 재현율 향상

### 2. 변수별 해석

**(1) D1 (1일차 이탈 여부)**
- 단변량으로 보면 D1 이탈 → D7 이탈과 강하게 연결되지만, `sum_gamerounds`와 함께 넣으면 효과가 희석됨
- 이유: D1에 이탈한 사람은 플레이 판수도 적어서 두 변수가 겹치는 정보를 담고 있기 때문
- 다중회귀 모델 안에서는 독립적인 기여도가 낮음
- → 단독 지표로는 유용하나, `sum_gamerounds`와 중복 사용 시 해석 주의

**(2) sum_gamerounds_log (플레이 판수, 로그 변환)**
- **가장 강력한 예측 변수** (오즈비 약 0.13 → 이탈 가능성 -87.2%)
- 많이 플레이할수록 D7 이탈 확률이 크게 감소
- D1의 효과까지 흡수할 만큼 지배적인 변수
- → 초반 플레이 판수를 늘리는 것이 리텐션의 핵심

**(3) version_enc (gate_30 vs gate_40)**
- gate_40 버전이 gate_30 대비 **D7 이탈 가능성이 5.1% 높음** (오즈비 1.051)
- 게이트를 40으로 올렸을 때 유저가 더 일찍 이탈하는 경향이 있음
- gate_30 유지가 리텐션 관점에서 유리한 것으로 분석됨

### 3. 비즈니스 액션 아이템
**(1) 초반 플레이 경험 개선이 최우선**
- `sum_gamerounds`가 가장 강력한 이탈 예측 변수
- 설치 후 D1~D3 안에 플레이 판수를 늘릴 수 있도록 튜토리얼 개선, 보상 강화, 난이도 완화가 핵심
- D1 이탈 자체보다 **"왜 D1에 적게 플레이했는가"** 를 파악하는 것이 우선

**(2) gate_30 유지 권장**
- gate_40은 gate_30 대비 D7 이탈 가능성이 통계적으로 5.1% 높게 나타남
- 현재 데이터 기준으로는 **gate_30 유지**가 리텐션에 유리
- 추가 실험이 필요하다면 gate_35 등 중간 지점 테스트 검토

**(3) 플레이 판수 기반 유저 세분화**
- 초반 플레이 판수 하위 25% 유저: 튜토리얼 개선, 난이도 조정, 얼리게임 보상 강화로 이탈 방지
- 헤비 유저: 이탈 위험 낮음 → VIP 프로그램, 길드/소셜 기능으로 Lock-in 강화
<br><br>

<h2>Tableau [ 시각화 Tableau 대시보드 구축 ]</h2>

- 목적: Cookie Cats A/B 테스트 결과 Tableau 대시보드 시각화
- 데이터: Cookie Cats (SQL 실습과 동일)
- A/B 그룹별 D1·D7 잔존률 막대차트
- 플레이 구간별 유저 분포 퍼널차트
- 버전별 평균 플레이 라운드 막대차트
- Tableau Public 대시보드 게시

<img width="765" height="554" alt="image" src="https://github.com/user-attachments/assets/c144c0ee-3c35-4f49-8812-29ea3db62efb" />

🔗 [Tableau 대시보드 보기](https://public.tableau.com/views/cookie_cats_abtest_analysis_17784089744060/CookieCatsAB?:language=ko-KR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

--- 

<h2>5_Project [ 게임 유저 이탈 분석 ]</h2>

### 1. 배경 및 문제 정의
- 배경: 신규 유저 유입보다 기존 유저 이탈 방지가 게임 매출에 더 큰 영향을 미침
- 목적: 어떤 유저가 이탈할 가능성이 높은지 사전에 파악하면 타겟 리텐션 캠페인 설계 가능
- 분석 대상: Online Gaming Behavior Dataset (40,034명) [kaggle](https://www.kaggle.com/datasets/rabieelkharoua/predict-online-gaming-behavior-dataset)
- 이탈 정의: EngagementLevel = 'Low' 인 유저 (전체의 약 25.8%)

### 2. 분석 목표
- 이탈 유저와 잔존 유저의 행동 패턴 차이 파악
- 이탈에 영향을 미치는 핵심 변수 도출
- 이탈 위험 유저 세그먼트 정의 및 액션 아이템 제안

### 3. 분석 가설
**(1) 가설 1: 플레이 시간이 짧은 유저일수록 이탈률이 높을 것이다 ( PlayTimeHours )** <br><br>
<img width="803" height="471" alt="image" src="https://github.com/user-attachments/assets/a49a80c8-1cc4-40e0-a682-4d4c7dc5b616" />
<br><br>

**(2) 가설 2: 결제 경험이 없는 유저가 이탈률이 높을 것이다 ( InGamePurchases )** <br><br>
<img width="501" height="440" alt="image" src="https://github.com/user-attachments/assets/4e13649d-ce65-4ac8-ad27-353190b9cd95" />
<br><br>

**(3) 가설 3: 주간 세션 수가 적은 유저일수록 이탈 가능성이 높을 것이다 ( SessionsPerWeek )** <br><br>
<img width="803" height="471" alt="image" src="https://github.com/user-attachments/assets/a3a563f6-a9dc-459c-a276-153d48c77867" />
<br><br>

**(4) 가설 4: 레벨이 낮은 구간에서 이탈이 집중될 것이다 ( PlayerLevel )** <br><br>
<img width="806" height="481" alt="image" src="https://github.com/user-attachments/assets/f42d0ba3-4114-41a5-9f09-61c6d5c507d3" />
<br><br>

**(5) 가설 5: RPG 장르 유저가 타 장르 대비 이탈률이 낮을 것이다 ( GameGenre )** <br><br>
<img width="801" height="493" alt="image" src="https://github.com/user-attachments/assets/7e80b41f-85ee-4f48-8734-fc33bded65e7" />
<br><br>

**(6) 가설 6: 게임 난이도가 높을수록 이탈률이 높을 것이다 ( GameDifficulty )** <br><br>
<img width="807" height="491" alt="image" src="https://github.com/user-attachments/assets/b9d8d587-09ea-43e2-9e67-47683ecf7044" />
<br><br>

**(7) 가설 7: 세션당 플레이 시간이 짧고 접속 빈도도 낮은 유저가 이탈률이 가장 높을 것이다 ( SessionsPerWeek + AvgSessionDurationMinutes )** <br><br>
<img width="906" height="483" alt="image" src="https://github.com/user-attachments/assets/6879633a-5c44-4121-9b51-2c1002c9219e" />
<br><br>

**(8) 가설별 결과 해석** <br><br>
<img width="554" height="255" alt="image" src="https://github.com/user-attachments/assets/f82de01b-8cd7-424a-9c61-4eda64a8968c" />
<br><br>

### 4. Modeling
#### 4-1. 데이터 준비
- 이탈 변수 생성: EngagementLevel 변수가 'Low' 인 유저를 1, 나머지('Medium', 'High')는 0 으로 정의
- 범주형 변수 레이블화: Gender(성별), GameGenre(게임 장르 유형), GameDifficulty(난이도)
- 독립 변수 9개 <br>

| X | 변수 |
|------|------|
| x1 | PlayTimeHours |
| x2 | SessionsPerWeek |
| x3 | AvgSessionDurationMinutes |
| x4 | PlayerLevel |
| x5 | AchievementsUnlocked |
| x6 | Gender_encoded |
| x7 | InGamePurchases |
| x8 | GameGenre_encoded |
| x9 | GameDifficulty_encoded |


#### 4-2. 로지스틱 회귀 모델 학습
- **변수별 중요도(계수) 확인**
<img width="906" height="488" alt="image" src="https://github.com/user-attachments/assets/4ce46477-5c47-4941-80d8-23b6015b61d0" />
<br><br>
<img width="322" height="189" alt="image" src="https://github.com/user-attachments/assets/f5d59a16-9a86-4404-9903-e41d6dcaf903" />
<br><br>

- **통계적 유의성 확인**
<img width="554" height="452" alt="image" src="https://github.com/user-attachments/assets/afb1bbdb-8d5c-4dc5-aefb-37eff493fbe3" />
<br><br>

- **통계적으로 유의미한 변수 (p-value < 0.05)**
  
| X | 변수 | 계수 | 해석 |
|------|------|------|------|
| x2 | SessionsPerWeek | -2.054 | 접속 빈도 높을수록 이탈 감소 |
| x3 | AvgSessionDurationMinutes | -1.378 | 접속시간 길수록 이탈 감소 |
| x4 | PlayerLevel | -0.300 | 레벨 높을수록 이탈 감소 |
| x5 | AchievementsUnlocked | -0.319 | 업적 많을수록 이탈 감소 |

-> EDA에서 도출한 인사이트가 모델에서도 동일하게 확인

#### 4-3. 혼동행렬 시각화
<img width="583" height="555" alt="image" src="https://github.com/user-attachments/assets/a1365de8-8611-4fe9-a3d9-f5ed1f95467a" />
<br><br>

<img width="167" height="120" alt="image" src="https://github.com/user-attachments/assets/a6e85919-c928-43d8-9417-348f3fcbfef1" />
<br><br>

#### 4-4. 이탈 유저 예측 분류
- **테스트 데이터에 예측 확률 추가**
<img width="713" height="454" alt="image" src="https://github.com/user-attachments/assets/755034c9-d86f-4cbc-848e-bbd6535d9097" />
<br><br>

<img width="261" height="115" alt="image" src="https://github.com/user-attachments/assets/286abe19-5030-44c6-b5cb-5559a825b4df" />
<br><br>

### 5. 모델링 결론 및 액션 아이템
#### 5-1. 주간 세션 수 ( 이탈의 핵심 변수 )
- 주 1~2회 접속 유저의 이탈률은 **84.4%** 로 주 7회 이상 접속 유저(10.4%)보다 **8배 높다.** <br>
→ 접속 습관이 형성되지 않은 유저가 이탈 위험군의 핵심

#### 5-2. 레벨 구간별 이탈 허들
- 레벨 1~10 구간 이탈률 **30.4%** 로 가장 높고 레벨이 올라갈수록 이탈률이 꾸준히 감소한다.<br>
→ 초반 온보딩 경험이 장기 잔존률을 결정

<img width="184" height="146" alt="image" src="https://github.com/user-attachments/assets/72fe9896-3a70-40d0-a38d-4b279dadadb9" />
<br><br>

#### 5-3. 액션 아이템
- **단기전략**

**(1) 주간 세션 수 2회 이하 유저 자동 감지** <br>

   → 접속 3일 경과 시 푸시 알림·복귀 보상 자동 발송 <br>
   → 예상 효과: 고위험군 17.4% 중 일부를 중위험으로 전환

**(2) 레벨 1~10 구간 온보딩 강화** <br>

   → 초반 7일 내 보상 증가, 튜토리얼 간소화 <br>
   → 초반 이탈률 30.4% → 목표 25% 이하로 감소
<br><br>

- **중장기 전략**

**(3) 유저 유형별 리텐션 전략 분리** <br>

   → 라이트 유저(63.7%): 접속 유도 중심 캠페인 <br>
   → 헤비 유저(3.1%): 이탈 방지보다 과금 전환 집중

**(4) 헤비 유저 정의 기준 수립** <br>

   → 주 7회 이상 + 세션 60분 이상 유저를 VIP로 분류 <br>
   → 별도 혜택 제공으로 장기 유지
<br><br>

### 6. 이탈 분석 Tableau 대시보드

<img width="957" height="556" alt="image" src="https://github.com/user-attachments/assets/07dee405-025e-4143-a1eb-2d719c28457f" />

🔗 [대시보드 보기](https://public.tableau.com/views/game_user_churn_analysis/sheet4?:language=ko-KR&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

