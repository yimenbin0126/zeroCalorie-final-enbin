
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
- 고객센터 게시판 - (원글/답글), 댓글/대댓글, 검색, 페이징
- 그 외 (파일 첨부, 좋아요/싫어요, 조회수)
<br>

## <b>구현 화면</b>


### 로그인
- 로그인/로그아웃
- 회원가입, 아이디/비밀번호 찾기 페이지로 이동 가능
<br>
<img width="700" alt="로그인" src="https://user-images.githubusercontent.com/93369732/199425348-96a866e7-df6d-4490-a84e-9a99ce36eb25.png">
<br>
<br>

### 회원가입
- 회원 가입 할 수 있는 페이지 - 필수 값, 필수가 아닌 값

  - 필수 값 : 아이디, 비밀번호, 닉네임, 이메일, 전화번호, 본인의 키
  - 필수가 아닌 값 : 이름, 생년월일, 성별, 프로필사진(기본 프로필)
- 유효성 검사

  - 에러 표시 : 통과 안될시 빨간줄의 에러, 회원가입 버튼 클릭 시 에러 메시지.
  - 검사 : 서버/클라이언트 동시에 유효성 검사, 아이디/닉네임 중복 체크
<br>
<img width="700" alt="회원가입" src="https://user-images.githubusercontent.com/93369732/199425599-56c0e7b2-28e9-47dd-bac4-d6b2bf336b51.png">
<br>
<br>

### 아이디/비밀번호 찾기
- 로그인
<br>
<img width="700" alt="아이디 찾기" src="https://user-images.githubusercontent.com/93369732/199426120-d4ecaa05-6268-45ac-b861-9259b34ec6f0.png">
<br>
<br>

### 고객센터
- 자주하는 질문 ( 관리자 게시판 )
- 공개 건의함 ( 관리자&회원 게시판 )
<br>
<img width="700" alt="고객센터 - 메인" src="https://user-images.githubusercontent.com/93369732/199426355-6d176b09-ed75-4e4a-ae7e-a2fbefccdf23.png">
<br>
<br>

### 고객센터 - 자주하는 질문
- 관리자 게시판
- 게시판 CRUD, 페이징, 검색
<br>
<img width="700" alt="고객센터 - 자주하는 질문" src="https://user-images.githubusercontent.com/93369732/199426728-e98ea113-7f78-4036-9bf9-c126603c033e.png">
<br>
<br>

### 고객센터 - 공개 건의함
- 관리자&회원 게시판
- 게시판 CRUD / 답글, 댓글/대댓글, 페이징, 검색
<br>
<img width="700" alt="고객센터 - 공개 건의함" src="https://user-images.githubusercontent.com/93369732/199427142-0288084c-3849-439b-a670-408d1139db38.png">
<br>

### 고객센터 - 내가 작성한 글
- 내가 작성한 글 관리/삭제
<br>

<img width="700" alt="고객센터 - 공개 건의함 - 내가 작성한 글" src="https://user-images.githubusercontent.com/93369732/199427234-5d211be6-bd21-49e7-972d-359d56ff8541.png">
<br>

### 고객센터 - 공개 건의함 - 글 상세보기
- 답글쓰기, 게시물 수정/삭제
- 댓글/대댓글, 좋아요/싫어요, 첨부파일 다운로드
<br>
<img width="700" alt="고객센터 - 상세보기 댓글" src="https://user-images.githubusercontent.com/93369732/199427691-7ddecdfb-e607-4230-b9fe-910e46e50d3f.png">

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
- 팀 프로젝트 깃허브 주소(팀 전체 공유) https://github.com/yimenbin0126/zeloKalory-final
