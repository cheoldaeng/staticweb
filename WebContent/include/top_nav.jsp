<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인 상태유지 쿠키정보 가져오기
	Cookie[] cookies = request.getCookies();
	// name이 "id"인 쿠키객체 찾기
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				String id = cookie.getValue();
				
				// 로그인 인증(세션에 id값 추가)
				session.setAttribute("id", id);
			}
		}
	}
%>
<%
	//세션값 가져오기
	
	String id = (String) session.getAttribute("id");

	//세션값 잇으면 ..님 반가워요~ logout
	//세션값 없으면 login join
%>
    
			<nav id="menu">
				<ul class="links">
				<div>
	        	<%
	        	if (id != null) {
	        		%>
	        		<li><%=id %>님 반가워요~ <a href="/member/logout.jsp">로그아웃</a></li>
	        		<%
	        	} else {
	        		%>
		        	<a href="/member/loginForm.jsp">로그인</a>
		        	 | <a href="/member/joinForm.jsp">회원가입</a><br>
		        	<%
	        	}
	        	%>
	        	</div>
					<li><a href="/index.jsp">Home</a></li>
					<li><a href="/board/board.jsp">게시판</a></li>
					<li><a href="/board/fileBoard.jsp">업로드 게시판</a></li>
					<li><a href="/generic.jsp">Generic</a></li>
					<li><a href="/elements.jsp">Elements</a></li>
					<%
					if(id != null && id.equalsIgnoreCase("admin")){//관리자 아이디 체크
						%>
						<li><a href ="/member/list.jsp">전체 회원목록</a></li>
						<%
						}
					%>
					<%
	        		if (id != null) {
	        		%>
	        		<li><a href="/member/update.jsp">회원수정</a></li>
	        		<%
	        		}
		        	%>
				</ul>
			</nav>