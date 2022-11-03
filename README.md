
<br>

# <b>팀 프로젝트 - 개인 기여 부분</b>
- <b>개발 목적</b> : 다이어트 관리 웹 기반 애플리케이션 구현
- <b>기술 스택</b> : Spring Framework, Java, JSP, Ajax, Javascript, 외부라이브러리(jQuery), DBMS(Oracle), CSS
- <b>개발 환경</b> : Eclipse, JDK 11.0.15, Apache Tomcat 9.0, Maven
- <b>참여 인원</b> : 6명 <b>(팀장)</b>
- <b>개발 기간</b> : 2022.10.02 ~ 2022.10.26
<br>

## <b>맡은 역할</b>
- 로그인, 아이디/비밀번호 찾기, 회원가입
- 고객센터 게시판 - CRUD (원글/답글), 댓글/대댓글, 검색, 페이징
- 그 외 (파일 첨부 및 다운로드, 좋아요/싫어요, 조회수)
<br>

## <b>구현 화면</b>

### 고객센터
- 자주하는 질문 ( 관리자 게시판 )
- 공개 건의함 ( 관리자&회원 게시판 )
<br>
<img width="700" alt="고객센터 - 메인" src="https://user-images.githubusercontent.com/93369732/199642818-d233017d-7eb6-499e-9306-d4cc4e471828.gif">
<br>
<br>

### 고객센터 - 공개 건의함
- 관리자&회원 게시판
- 게시판 CRUD / 답글, 댓글/대댓글, 페이징, 검색
- 그 외 (좋아요/싫어요, 조회수, 파일 첨부 및 다운로드, 최신/조회수/좋아요순 나열)

##### 페이징, 검색

<img width="700" src="https://user-images.githubusercontent.com/93369732/199644221-63d2c597-363f-49d5-b2d0-47d7b6686185.gif">

##### 좋아요, 파일 다운로드

<img width="700" src="https://user-images.githubusercontent.com/93369732/199644229-11d957e7-c277-4b55-a953-6b3d62762b46.gif">

##### 댓글, 대댓글

<img width="700" src="https://user-images.githubusercontent.com/93369732/199644230-a1adc88c-a069-471e-97b2-20c062f9a343.gif">

##### 게시물 CRUD, 답글

<img width="700" src="https://user-images.githubusercontent.com/93369732/199644238-d5e5ed0f-db34-4dff-8b6b-8676125aa391.gif">

<br>
<br>

### 고객센터 - 공개 건의함 [내가 작성한 글]
- 내가 작성한 글 관리/삭제
- 그 외 (검색, 페이징, 최신/조회수/좋아요순 나열)
<br>

<img width="700" alt="고객센터 - 공개 건의함 - 내가 작성한 글" src="https://user-images.githubusercontent.com/93369732/199644245-ad1408bd-070a-48be-b26e-4473132e63a7.gif">
<br>
<br>

### 고객센터 - 자주하는 질문
- 관리자 게시판
- 게시판 CRUD, 페이징, 검색

##### 페이징, 검색

<img width="700" src="https://user-images.githubusercontent.com/93369732/199643381-3d705be7-1154-43a1-895e-c4c3995fb7f5.gif">

##### 게시판 CRUD

<img width="700" src="https://user-images.githubusercontent.com/93369732/199643385-45916fed-2458-40e9-9a92-92aba66089d5.gif">

##### 좋아요, 파일 다운로드

<img width="700" src="https://user-images.githubusercontent.com/93369732/199643541-5b276fa3-c039-4316-9e36-7e486d18e559.gif">
<br>
<br>


### 로그인
- 로그인/로그아웃
- 회원가입, 아이디/비밀번호 찾기 페이지로 이동 가능
<br>
<img width="700" src="https://user-images.githubusercontent.com/93369732/199641704-1218fb62-2541-4e0b-b319-3572dfa97bff.gif">
<br>
<br>

### 회원가입
- 회원 가입 할 수 있는 페이지 - 필수 값, 필수가 아닌 값

  - 필수 값 : 아이디, 비밀번호, 닉네임, 이메일, 전화번호, 본인의 키
  - 필수가 아닌 값 : 이름, 생년월일, 성별, 프로필사진(기본 프로필)
- 유효성 검사

  - 에러 표시 : 통과 안될시 빨간줄의 에러, 회원가입 버튼 클릭 시 에러 메시지.
  - 검사 : 서버/클라이언트 동시에 유효성 검사, 아이디/닉네임 중복 체크

##### 아이디, 닉네임 중복 확인. 프로필 이미지 추가

<img width="700" src="https://user-images.githubusercontent.com/93369732/199642238-25ce0a7e-b599-4723-805e-60f9855b5230.gif">

##### 필수 값 만으로 회원가입

<img width="700" src="https://user-images.githubusercontent.com/93369732/199642245-1233a814-ef92-42a1-9f60-e0f8d4912ba5.gif">
<br>
<br>

### 아이디/비밀번호 찾기
##### 아이디 찾기
<img width="700" alt="아이디 찾기" src="https://user-images.githubusercontent.com/93369732/199641939-b2951956-3f31-4597-b63a-e5736a6d31f0.gif">


##### 비밀번호 찾기

<img width="700" src="https://user-images.githubusercontent.com/93369732/199642026-0a4862b5-2b0b-4e48-bf63-58e3588d6d05.gif">
<br>

<br>
<br>

## <b>ERD</b>
- 회원정보 : 회원의 기본적인 정보가 담김. 회원 번호로 테이블 구분.
- 고객센터 게시판

  - <b>대표 게시물</b> : 게시물의 기본적인 정보. 게시물 번호, 회원번호(글쓴이)로 테이블 구분.
  
  - <b>조회수</b> : 게시물의 조회수 체크. 회원이나 비회원당 1씩 증가. 게시물 번호, 회원번호로 구분.
  
  - <b>좋아요, 싫어요</b> : 게시물의 좋아요/싫어요 체크. (자신의 게시물이 아닐 경우 1 증가) 게시물 번호, 회원번호로 구분.
  
  - <b>댓글</b> : 게시물의 댓글(원글 번호)/대댓글(고유 번호로 우선순위 체크), 대댓글 원글 닉네임. 게시물번호, 회원번호로 구분.
  
  - <b>첨부파일</b> : 파일의 정보. 게시물 번호로 구분. 총 5개의 파일 첨부 가능(첨부 수 제한)
<br>
<img width="700" alt="고객센터 - 상세보기 댓글" src="https://user-images.githubusercontent.com/93369732/199427855-b7cbf0b8-9042-439a-addb-587c178a6c09.png">

<br>
<br>

## 팀 깃허브 
- https://github.com/yimenbin0126/zeloKalory-final
- 커밋 기록 확인용 (기록 아이디 : yimenbin, yimenbin0126)
- 팀 프로젝트 깃허브 주소(팀 전체 공유)
