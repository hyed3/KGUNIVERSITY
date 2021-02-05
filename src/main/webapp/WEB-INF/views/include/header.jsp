<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<meta name="viewport" content = "width-device-width", initail-scale="1">
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

<%
	String user_id = null;
	if(session.getAttribute("userId") != null) {
		user_id = (String) session.getAttribute("userId");
	}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="${path}/">KGUNIVERSITY</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${path}/">Home
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/Notice_List.do">공지사항</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${path}/FreeBoard_List.do">자유게시판</a>
          <a class="dropdown-item" href="${path}/InfoBoard_List.do">정보게시판</a>
          <a class="dropdown-item" href="${path}/ClubBoard_List.do">동아리</a>
          
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/book/bookAll.do?user_id=<%=user_id%>">학생서점</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/boardList">학생장터</a>
      </li>

         <%if(user_id==null) { %>
      	<li class="nav-item">
        	<a class="nav-link" href="${path}/member/login.do">로그인</a>
      	</li>
      
      <% } else if (!user_id.equals("bookadmin")) { %>
      <%-- 	<li class="nav-item">
      		<a class = "nav-link" href = "${path}/book/userPurchase.do?user_id=<%=user_id%>">구매 목록</a>
      	</li> --%>
      	<li class="nav-item">
      		<a class="nav-link" href="/www/member/mypage.do?userId=<%=user_id%>">마이페이지</a>
      	</li>
      	
      	<li class="nav-item">
        	<a class="nav-link" href="${path}/member/logout.do">로그아웃</a>
      	</li>
      	<li class="nav-item">
      			<%=user_id%>님이 로그인중입니다.
      	</li>
      <% } else { %>
      	<li class="nav-item">
      		<a class = "nav-link" href = "${path}/book/bookInsertForm.do?user_id=<%=user_id%>">책 등록</a>
      	</li>
      	<li class="nav-item">
      		<a class = "nav-link" href = "${path}/book/purchaseList.do?user_id=<%=user_id%>">판매목록</a>
      	</li>
      	<li class="nav-item">
        	<a class="nav-link" href="${path}/member/logout.do">로그아웃</a>
      	</li>
      	<li class="nav-item">
      			<%=user_id%>님이 로그인중입니다.
      	</li>
      <% } %>
	</ul>
  </div>
</nav>
</body>
</html>