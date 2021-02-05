<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<jsp:include page="./include/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" 
	  href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css"
	  integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn"
	  crossorigin="anonymous">
<title>KG_University</title>
<style>

 table#content{
 width: 250px;
 position : absolute;
 }
 
 table#content2{
 width: 250px;
 position : absolute;
 top : 600px;
 }
 table {
width: 900px;
 margin: auto;
 }
 th,td{
 padding: 10px;
   
 }

</style>
</head>
<body>
<br><br>
<h1 align="center"><p class="text-muted">KG University</p></h1>
<br><br>
<table  border="0">
	<tr>
	 <td>
	  <table id="content" border="1" class="table table-hover">
	  	<tr>
			<th class = "table-primary">자유게시판</th>
		</tr>
		 <c:forEach items="${free}" var = "free" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/FreeBoard_Content.do?cNum=${free.FBN_seq}">
				 <c:choose>
					<c:when test = "${fn:length(free.title) > 10}">
					 <c:out value="${fn:substring(free.title,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${free.title}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		 </c:forEach>
	   </table>
	  </td>
	  <td>
	   <table id="content" border="1" class="table table-hover">
	  	<tr>
			<th class = "table-primary">공지사항</th>
		</tr>
		 <c:forEach items="${notice}" var = "notice" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/Notice_Content.do?cNum=${notice.NTN_seq}">
				<c:choose>
					<c:when test = "${fn:length(notice.title) > 10}">
					 <c:out value="${fn:substring(notice.title,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${notice.title}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		 </c:forEach>
		</table>
	   </td>
	     <td>
	    <table id="content" border="1" class="table table-hover">
	     <tr>
			<th class = "table-primary">동아리</th>
		 </tr>
		  <c:forEach items="${club}" var = "club" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/ClubBoard_Content.do?cNum=${club.CBN_seq}">
				<c:choose>
					<c:when test = "${fn:length(club.title) > 10}">
					 <c:out value="${fn:substring(club.title,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${club.title}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		  </c:forEach>
	    </table>
	   </td>
	   </tr>
	   <tr>
	   <td>
	    <table id="content2" border="1" class="table table-hover">
	     <tr>
			<th class = "table-primary">정보게시판</th>
		 </tr>
		  <c:forEach items="${info}" var = "info" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/InfoBoard_Content.do?cNum=${info.IBN_seq}">
				<c:choose>
					<c:when test = "${fn:length(info.title) > 10}">
					 <c:out value="${fn:substring(info.title,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${info.title}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		  </c:forEach>
	    </table>
	   </td>
	   <td>
	  <table id="content2" border="1" class="table table-hover">
		<tr>
			<th class = "table-primary">서점</th>
		</tr>
		 <c:forEach items="${book}" var = "book" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/book/getBookInfo.do?book_name=${book.book_name}">
				<c:choose>
					<c:when test = "${fn:length(book.book_name) > 10}">
					 <c:out value="${fn:substring(book.book_name,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${book.book_name}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		 </c:forEach>
	  </table>
	   </td>
	   <td>
	    <table id="content2" border="1" class="table table-hover">
	     <tr>
			<th class = "table-primary">학생장터</th>
		 </tr>
		  <c:forEach items="${sangpum}" var = "sangpum" begin="0" end="4">
			<tr>
		 	 <td>
				<a href="${path}/detail?bno=${sangpum.bno}">
				 <c:choose>
					<c:when test = "${fn:length(sangpum.title) > 10}">
					 <c:out value="${fn:substring(sangpum.title,0,9)}"/>...
					</c:when>
					<c:otherwise>
					 <c:out value="${sangpum.title}"></c:out>
					</c:otherwise>
				</c:choose>
				</a>
		 	 </td>
			</tr>
		  </c:forEach>
	    </table>
	   </td>
	  </tr>
</table><!--전체 테이블 end  -->
</body>
</html>