<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.zerocalorie.member.dto.e_MemberDTO,com.zerocalorie.svservice.dto.e_ServiceDTO,com.zerocalorie.svservice.service.e_ServiceService,com.zerocalorie.svservice.service.e_ServiceServiceimpl,
	java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="/all/resources/service/css/header.css" rel="stylesheet">
<link href="/all/resources/service/css/question-write.css" rel="stylesheet">
<script src="/all/resources/service/js/question-write.js"></script>
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

				<div class="e_div">
					<!-- 왼쪽 카데고리 -->
					<nav class="e_nav">
						<!-- 문의 전체보기 -->
						<div class="e_nav_all" onclick="location.href='/all/service/allService'">
							문의 전체보기
						</div>
						<!-- 자주하는 질문 -->
						<div class="e_nav_question" onclick="location.href='/all/service/question-member'">
							<div class="e_que_div">자주하는 질문</div>
							<div><img src="/all/resources/service/img/category_click.png"></div>
						</div>
						<!-- 공개 건의함 -->
						<div class="e_nav_onebyone" onclick="location.href='/all/service/question-public'">공개 건의함</div>
					</nav>

					<!-- 오른쪽 내용 -->
					<div class="e_right">
						<!-- 상단 -->
						<div class="e_header">
							<div class="e_hd_top">고객센터 &gt; 자주하는 질문 &gt; 글쓰기[관리자]</div>
							<div class="e_hd_top_title">글쓰기[관리자]</div>
						</div>

						<!-- 카데고리별 -->
						<form name="e_write_form">
							<!-- 유형 선택 -->
							<div class="e_content_choice">
								<input type="hidden" name="e_choice_val" id="e_choice_val">
								<div class="e_select_title">글쓰기 유형 선택</div>
								<select id="e_con_choice">
									<option value="question_member">회원 정보 관리</option>
									<option value="question_guide">사이트 이용 가이드</option>
								</select>
							</div>
						
							<div class="e_content">
								<!-- 글쓰기 제목 -->
								<div class="e_con_title">
									<div class="e_ti_title">제목</div>
									<div class="e_ti_detail">
										<input type="text" name="title"
											id="e_ti_detail_input" placeholder="제목을 입력해 주세요.">
									</div>
								</div>

								<!-- 글쓰기 내용 -->
								<div class="e_con_content">
									<div class="e_cont_title">내용</div>
									<div class="e_cont_detail">
										<textarea placeholder="내용을 입력해 주세요."
										name="description" id="e_cont_detail_input"></textarea>
									</div>
								</div>
								
								<!-- 첨부파일 -->
								<div class="e_con_file">
									<div class="e_file_title">첨부파일</div>
									<div class="e_file_detail">
										<!-- 파일 업로드 -->
										<label class="e_file_btn" for="e_file_detail_input">
											파일 업로드
										</label>
										<input type="file" name="file"
											id="e_file_detail_input" style="display:none" multiple>
									</div>
								</div>
								<!-- 파일 업로드 -->
								<div class="e_con_file_upload">
									<div class="e_file_title"></div>
									<div class="file_group">
									</div>
								</div>
							</div>

							<!-- 글쓰기 버튼 -->
							<div class="e_button">
								<div class="e_btn_write">
									<input type="submit" value="글쓰기" id="e_btn_write_btn">
								</div>
							</div>
						</form>
						
					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>