<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
	String user_id = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta name="viewport" content = "width-device-width", initail-scale="1">
<title>책 판매 목록</title>
<style>
 
.container1 ul li { display:inline-block; margin:10px; }
  div.pic img { width:200px; height:200px; }
  div.book1 { padding:10px 0; text-align:center; }
  div.book1 a { color:#000; }
 
.pagination {
   justify-content: center;
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp" />
	<br>
	<br>
<div align="center">
<!-- 검색 -->
<form action = "search.do" method="get">
<select name = "searchType" class = "custom-select" id = "searchType"  style="width: 120px; height: 34px; font-size:10pt;">
	<option value = "book_name" style=font-size:10pt; <c:out value = "${search.searchType eq 'book_name' ? 'selected' : ''}"/>>책 제목</option>
	<option value = "book_writer" style=font-size:10pt; <c:out value = "${search.searchType eq 'book_writer' ? 'selected' : ''}"/>>글쓴이</option>
</select>
<input type = "keyword" name = 'keyword' value = "${search.keyword}">
<input type = "submit" class="btn btn-primary"  value = "검색" style="height: 34px">
<font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"></font></font>
</form><br>

<!-- 상품목록 -->
<div class="container1" style="width: 1300px; margin: auto;">
<ul>
	<c:forEach items = "${book}" var = "List" >
	<li>
	
	<div class ="pic"><!-- 책 사진 -->
		<img src ="<spring:url value='/resources/img/${List.book_picture}'/>">
		</div>
		<div class="book1"><!-- 책 명 -->
	<a href="${path}/book/getBookInfo.do${pageMaker.makeQuery(pageMaker.supPaging.page)}&book_name=${List.book_name}">${List.book_name}</a>
	</div>
		<div class="book1"><!-- 저자 -->
	${List.book_writer}
	</div>
		<div class="book1"><!-- 가격 -->
	${List.book_price}원
	</div>
	</li>
</c:forEach>
</ul></div>
<br><br>

	<!-- 페이지 -->
  <ul class = "pagination" >
  	<c:if test="${pageMaker.prev}">
    <li class = "page-item">
      <a class="page-link" href="${pageMaker.makeSearch(pageMaker.startPage-1)}"> <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;">이전 </font> </font > </a>
    </li>	</c:if>
     <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
    <li class = "page-item <c:out value ="${pageMaker.supPaging.page == idx ? 'active' : ''}"/>">
      <a class="page-link" href="${path}/book/search.do${pageMaker.makeSearch(idx)}">${idx}<font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;">  </font> </font> </a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0}">
    <li class = "page-item">
      <a class="page-link" href="${path}/book/search.do${pageMaker.makeSearch(pageMaker.endPage+1)}"> <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"> 다음 </font> </font> </a>
    </li>
  </c:if>
  </ul>
</div>
</body>
</html>