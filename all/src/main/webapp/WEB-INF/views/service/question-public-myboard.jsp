<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.zerocalorie.member.dto.e_MemberDTO,com.zerocalorie.svservice.dto.e_ServiceDTO,com.zerocalorie.svservice.dto.e_SvPagingViewDTO,com.zerocalorie.svservice.service.e_ServiceService,com.zerocalorie.svservice.service.e_ServiceServiceimpl,java.util.List,java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="/all/resources/service/css/header.css" rel="stylesheet">
<link href="/all/resources/service/css/question-public-myboard.css" rel="stylesheet">
<script src="/all/resources/service/js/question-public-myboard.js"></script>
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
							자주하는 질문
						</div>
						<!-- 공개 건의함 -->
						<div class="e_nav_onebyone" onclick="location.href='/all/service/question-public'">
							<div class="e_que_div">공개 건의함</div>
							<div><img src="/all/resources/service/img/category_click.png"></div>
						</div>
					</nav>


					<!-- 오른쪽 내용 -->
					<div class="e_right">
					<%

							// 댓글 갯수
							List<Integer> comment_List = new ArrayList<Integer>();
							// 게시물 리스트 객체 생성
							List<e_ServiceDTO> s_dto_list = new ArrayList<e_ServiceDTO>();
							e_SvPagingViewDTO s_page = new e_SvPagingViewDTO();
							s_page = (e_SvPagingViewDTO)request.getAttribute("s_page");
							System.out.println(s_page.toString());
					%>
						<!-- 상단 -->
						<div class="e_hd_top">고객센터 &gt; 공개 건의함 &gt; 내가 작성한 글</div>
						<div class="e_header">
							<div class="e_hd_top_que">내가 작성한 글</div>
							<div class="e_hd_top_con">
								<span> 내가 작성한 글은 관리자, 회원 등<br>모든 회원이 로그인 한 상태라면<br>
									자신의 게시물을 수정, 삭제할 수 있는 공간입니다.
								</span>
							</div>
							
						</div>

						<!-- 게시물 불러오기 - 회원 정보 관리 -->
						<div class="e_content">
							<!-- 게시물 타입 -->
							<div class="e_content_choice">
								<select id="e_con_choice">
									<c:set var="standard" value="<%=s_page.getStandard()%>" />
									<option value="new" <c:if test="${standard == 'new'}">selected</c:if>>최신순</option>
									<option value="view" <c:if test="${standard == 'view'}">selected</c:if>>조회수순</option>
									<option value="like" <c:if test="${standard == 'like'}">selected</c:if>>좋아요순</option>
								</select>
							</div>
							<!-- 게시물 번호 보내기 - 상세보기 -->
							<form name="e_bno_val_form" id="e_bno_val_form">
								<input type="hidden" name="bno" id="e_bno_val">
							</form>
							<!-- 게시물 목록 시작 -->
							<div class="e_con_mem">
								<ul>
									<li>선택</li>
									<li>번호</li>
									<li>제목</li>
									<li>작성시간</li>
									<li>조회수</li>
									<li>좋아요</li>
								</ul>
								<%
									// 게시물들 불러오기
									if((ArrayList<e_ServiceDTO>)request.getAttribute("s_dto_list")!=null
									&& ((ArrayList<e_ServiceDTO>)request.getAttribute("s_dto_list")).size()!=0
									&& ((ArrayList<Integer>)request.getAttribute("comment_List")).size()!=0){
										s_dto_list = (ArrayList<e_ServiceDTO>)request.getAttribute("s_dto_list");
										comment_List = (ArrayList<Integer>)request.getAttribute("comment_List");
										for(int i=0; i<s_dto_list.size(); i++){
											int com_count = 0;
											// 댓글 0개인지 확인
											if(comment_List == null || comment_List.size()==0){
												com_count = 0;
											} else {
												com_count = comment_List.get(i);
											}
											e_ServiceDTO s_dto = new e_ServiceDTO();
											s_dto = s_dto_list.get(i);
											if (s_dto.getAdmin_type().equals("origin")) {
								%>
								<!-- 원글일 경우 -->
								<ul class="e_boardlist">
									<li value="<%=s_dto.getBno()%>"><input type="checkbox" class="check_list" name="check_list" value="<%=s_dto.getBno()%>"></li>
									<li><%=s_dto.getBno()%></li>
									<li><div class="blist_title"><%=s_dto.getTitle()%></div> <div class="blist_comment" style="color:#1649B0;">[<%=com_count%>]</div></li>
									<li><%=s_dto.getCreate_time()%></li>
									<li><%=s_dto.getView_no()%></li>
									<li><%=s_dto.getLike_check()%></li>
								</ul>
								<%
												} else if (s_dto.getAdmin_type().equals("reply")) {
								%>
								<!-- 답글일 경우 -->
								<ul class="e_boardlist">
									<li value="<%=s_dto.getBno()%>"><input type="checkbox" class="check_list" name="check_list" value="<%=s_dto.getBno()%>"></li>
									<li><%=s_dto.getBno()%></li>
									<li><div style="font-weight:bold;" onclick="location.href='/all/service/question-public-detail?bno=<%=s_dto.getGroup_origin()%>'">[<%=s_dto.getGroup_origin()%> 번의 답글]</div> <div class="blist_title"><%=s_dto.getTitle()%></div> <div class="blist_comment" style="color:#1649B0;">[<%=com_count%>]</div></li>
									<li><%=s_dto.getCreate_time()%></li>
									<li><%=s_dto.getView_no()%></li>
									<li><%=s_dto.getLike_check()%></li>
								</ul>
								<%
												}
										}
									} else {
								%>
								<ul class="e_boardlist">
									<li style="width:100%; text-align:center;
									font-weight:bold; font-size: 13px;
									margin-top:10px; margin-bottom:10px;">존재하는 게시물 없음</li>
								</ul>
								<%
									}
								%>
							</div>
							<!-- 게시물 목록 끝 -->
						</div>
						
						<div class="e_btn_list">
							<!-- 글쓰기 버튼 보이기 (로그인) -->
								<%
										// 게시판 관련 메서드 불러오기
										e_ServiceService s_service = new e_ServiceServiceimpl();
										// 로그인 여부
										if((e_MemberDTO)session.getAttribute("user") !=null){
								%>
									<div class="checkbox_class">
										<input type="checkbox">
										<span>전체 선택</span>
									</div>
									<div class="btn_list_class">
										<div>
											<form name="e_btn_delete_form" id="e_btn_delete_form">
												<input type="hidden" name="e_btn" value="delete_list">
												<input type="button"  value="선택글 삭제" class="e_hd_top_del">								
											</form>
										</div>
										<div>
											<input type="button"  value="글쓰기" class="e_hd_top_write"
											onclick="location.href='/all/service/question-public-write'">
										</div>
									</div>
								<%
	
									}
								%>
						
						</div>
						
						<!-- 페이징 시작 -->
						<div class="e_paging">
							<%
								// 클릭 가능 여부
								if (s_page.isPage_prev()){
							%>
							<div onclick="location.href='/all/service/question-public-myboard?page_NowBno=<%=s_page.getPage_StartBno()-5%>'"
							 class="e_paging_btnleft" id="e_paging_btnleft_yes">&lt;</div>
							<%
								} else {
							%>
							<div onclick="alert('첫 페이지 입니다.');"
							 class="e_paging_btnleft" id="e_paging_btnleft_no">&lt;</div>
							<%
								}
							%>
							<div class="e_paging_num">
							<%
								// 첫 번호, 마지막 번호
								int page_StartBno = s_page.getPage_StartBno();
								int page_EndBno = s_page.getPage_EndBno();
								// 현재 번호
								int page_NowBno = s_page.getPage_NowBno();
								for (int i=page_StartBno; i <= page_EndBno; i++) {
									if(i==page_NowBno){									
							%>
								<div id="page_NowBno"><%=i%></div>
							<%
									} else {
							%>
								<div onclick="location.href='/all/service/question-public-myboard?page_NowBno=<%=i%>&standard=<%=s_page.getStandard()%>'"
								class="page_Bno" id="page_Bno<%=i%>"><%=i%></div>
							<%
									}
								}
							%>
							</div>
							<%
								// 클릭 가능 여부
								if (s_page.isPage_next()){
							%>
							<div onclick="location.href='/all/service/question-public-myboard?page_NowBno=<%=s_page.getPage_EndBno()+1%>'"
							class="e_paging_btnright" id="e_paging_btnright_yes">&gt;</div>
							<%
								} else {
							%>
							<div onclick="alert('마지막 페이지 입니다.');"
							 class="e_paging_btnright" id="e_paging_btnright_no">&gt;</div>
							<%
								}
							%>
						</div>
						<!-- 페이징 끝 -->
						
						<!-- 검색 시작 -->
						<div class="e_search">
							<!-- 기간 -->
							<div class="e_search_time">
								<select name="e_search_time_sel" id="e_search_time_sel">
									<option value="all">전체 기간</option>
									<option value="one_day">1일</option>
									<option value="one_week">1주일</option>
									<option value="one_month">1개월</option>
								</select>
							</div>
							<!-- 타입 -->
							<div class="e_search_type">
								<select name="e_search_type_sel" id="e_search_type_sel">
									<option value="title_content">제목 + 내용</option>
									<option value="title">제목</option>
									<option value="writer">글 작성자</option>
								</select>
							</div>
							<!-- 내용 -->
							<div class="e_search_content">
								<!-- 검색 내용 -->
								<div class="s_content">
									<input type="text" id="s_content_input"
									placeholder="검색어를 입력하세요." onfocus="this.placeholder=''"
									onblur="this.placeholder='검색어를 입력하세요.'">
								</div>
								<!-- 검색 버튼 -->
								<button type="button" id="s_content_btn">
									검색
								</button>
							</div>
						</div>
						<!-- 검색 끝 -->
					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>