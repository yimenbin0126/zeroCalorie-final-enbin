<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.zerocalorie.member.dto.e_MemberDTO" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="/all/resources/member/css/header.css" rel="stylesheet">
    <link href="/all/resources/member/css/findpass.css" rel="stylesheet">
    <script src="/all/resources/member/js/findpass.js"></script>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<body>

   <!-- 헤더 시작 -->
    <div id="j_hi">
		<%
       		e_MemberDTO m_dto = new e_MemberDTO();
        		
        	// 로그인 유무
           	if((e_MemberDTO)session.getAttribute("user") !=null){
           		m_dto = (e_MemberDTO)session.getAttribute("user");
        %>
		<ul id="j_list">
            <li class="j_menu5 j_menu" onclick="location.href='/all/main/main'">메인</li>
            <li class="j_menu5 j_menu" onclick="location.href='/all/service/allService'">고객센터</li>
        </ul>
        <div id = e_nav>
        	<div id="e_welcome">
        		<%=m_dto.getNickname()%>님 환영합니다.
        	</div>
        	<form name="e_nav_btn">
	        	<input type ="hidden" name="e_logout" value="Y">                   
        	</form>
        	<!-- null 오류 방지용 시작 -->
        	<input type ='hidden' class = "j_btn1 j_btn" onclick="location.href='/all/member/login'" value="로그인">
            <input type ='hidden' class = "j_btn2 j_btn" onclick="location.href='/all/member/join'" value="회원가입">
            <!-- null 오류 방지용 끝 -->
            <!-- 나타나는 부분 시작 -->
            <input type ='button' class = "e_btn e_btn" onclick="location.href='/all/member/logout'" value="로그아웃">
            <!-- 나타나는 부분 끝 -->
        </div>
        <%
        	} else {
        %>
        <ul id="j_list">
            <li class="j_menu5 j_menu" onclick="location.href='/all/main/main'">메인</li>
            <li class="j_menu5 j_menu" onclick="location.href='/all/service/allService'">고객센터</li>
        </ul>
        <div id = j_nav>
        	<!-- null 오류 방지용 시작 -->
            <input type ='hidden' class = "e_btn e_btn" onclick="location.href='/all/member/logout'" value="로그아웃">
            <!-- null 오류 방지용 끝 -->
            <!-- 나타나는 부분 시작 -->
            <input type ='button' class = "j_btn1 j_btn" onclick="location.href='/all/member/login'" value="로그인">
            <input type ='button' class = "j_btn2 j_btn" onclick="location.href='/all/member/join'" value="회원가입">
            <!-- 나타나는 부분 끝 -->
        </div>
        <%
        	}
        %>
    </div>
    <!-- 헤더 끝 -->

    <section>
		<div id="j_wrap">
			<div id="j_box">
				<!-- 로고 -->
				<div class="e_logo">아이디/비밀번호 찾기</div>

				<!-- 카데고리 선택 -->
				<div class="e_hd_choice">
					<div id="e_choice_id" onclick="location.href='/all/member/findid'">아이디 찾기</div>
					<div id="e_choice_pass">비밀번호 찾기</div>
				</div>
				
				<!-- 내용 -->
				<div class="e_hd_content">
					<!-- 설명 -->
					<div class="e_h_content">
						비밀번호를 찾으려면<br>
						아래 칸에 아이디와 이메일을 입력하세요.
					</div>
					<!-- 입력 -->
					<div class="e_h_input" id="e_h_input_code">
						<div class="input_id">
							<input type="text" id="e_input_id"
								placeholder="아이디를 입력해 주세요." onfocus="this.placeholder=''"
								onblur="this.placeholder='아이디를 입력해 주세요.'">
						</div>
						
						<div class="input_text">
							<input type="email" id="e_input_email"
								placeholder="이메일을 입력해 주세요." onfocus="this.placeholder=''"
								onblur="this.placeholder='이메일을 입력해 주세요.'">
						</div>
						<div class="input_sub" id="input_sub_input">
							<input type="submit" id="e_input_sub" value="전송하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>

</html>