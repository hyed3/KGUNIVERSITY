<%@page import="javax.mail.Session"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	String user_id = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css"
	integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>책 상세내용</title>
<style>
.container2 ul li { display:inline-block; margin:auto; text-align: left;}
  div.pic img { width:320px; height:320px;
    position: relative;
 top:50px;
            }
            .grid {
 
        width: 500px;
        margin: 0 auto;
        
        text-align: center;
        font-size: 0; 
        position: relative;
        left : 400px;
        top: 30px;
       
}
    
.grid_item {
        width: 100px;
        height: 100px;
        display: inline-block; 
        vertical-align: top;
       
}
     div.book1{
     position: relative;
     left:100px;
     bottom: 50px;
     
    }   
     
.container2{width:1200px;}

.book1 table td { padding:14px 0; font-size: 15px; color:#444; text-align: left;}
.book1 table td.price { font-size: 22px;}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp" />
	<br>
	<br>
<%-- <% if(user_id != null) {%> --%>
<div class="all" align="center">
<div class="container2" >
<div align="center">
<ul>
<li>
			<div class="pic"><!-- 책 사진 -->
				<img src="<spring:url value='/resources/img/${bvo.book_picture}'/>">
			</div>
			</li>
			<li>
		<div class="book1"> <!-- 책 명 -->
			<h2><pre>${bvo.book_name}</pre></h2>
			<hr>
	
		<table>
			<tbody>
				<tr>
					<th>판매가:&nbsp;</th>
					 <td class="price"> ${bvo.book_price}원</td>
				</tr>
				<tr>
					<th>저자:&nbsp;</th>
					<td>${bvo.book_writer}</td>
				</tr>
				<tr>
					<th>수량:&nbsp;</th>
					<td>
					<form action = "kakao.do" method = "GET">
			<input type="hidden" name="user_id" id ="user_id" value="<%=user_id%>">
			<input type="hidden" name="book_num" id ="book_num" value="${bvo.book_num}">
			<input type="hidden" name="book_picture" id ="book_picture" value="${bvo.book_picture}">
			<input type="hidden" name="book_name" id ="book_name" value="${bvo.book_name}">
			<input type="hidden" name="book_inventory" id ="book_inventory" value="${bvo.book_inventory}">
			<input type="hidden" name="book_price" id ="book_price" value="${bvo.book_price}">
			<c:if test="${bvo.book_inventory>=1}">
				<select name="purchase_amount" id = "purchase_amount">
					<c:forEach var="book_amount" begin="1" end="${bvo.book_inventory}" step="1" varStatus="a">
						<option>${book_amount}</option>
					</c:forEach>
				</select>
				<input type="submit" value = "구매"/>
			</c:if>
			<c:if test="${bvo.book_inventory==0}">
				<input type = "button" value = "품절" disabled="disabled">
			</c:if>
		</form>
		</td>
		</tr>
		</tbody>
		</table>
		</div></li></ul></div>
		<br><br>

	<ul class = "nav nav-tabs">
  <li class = "nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 책 소개 </font> </font> </a>
  </li>
  <li class = "nav-item">
    <a class="nav-link" data-toggle="tab" href="#profile"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 목차 </font> </font> </a>
  </li>
  </ul></div>
  <div id = "myTabContent"class = "tab-content">
  <div class = "tab-pane fade active show"id = "home">
    <pre style = "overflow : auto; height : 200px;"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;">${bvo.book_info}
     </font></font></pre>
</div>

  <div class = "tab-pane fade"id = "profile">
    <pre style = "overflow : auto; height : 200px;"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;">${bvo.book_mokcha}</font></font></pre>
</div>
</div>

<%	if(!user_id.equals("bookadmin")) { %>
		<form action="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
			<input type="hidden" name="page" value="${supPaging.page}">
			<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-primary">
			<font style = "vertical-align : inherit;">
			<font style = "vertical-align : inherit;">목록 </font></font></button>
		</form>
	<%} else { %>
		<!-- 관리자 로그인시 보여야할 버튼 -->
		<div class="grid">
		 <div class="grid_item first">
			<form action="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
				<input type="hidden" name="page" value="${supPaging.page}"> 
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
				<button type = "submit"class = "btn btn-primary">
				<font style = "vertical-align : inherit;">
				<font style = "vertical-align : inherit;">목록 </font></font></button>
			</form>
		</div>
		
		<div class="grid_item two">
			<form action="${path}/book/updateBook.do" method="GET">
				<input type="hidden" name="book_name" value="${bvo.book_name}">
				<input type="hidden" name="page" value="${supPaging.page}">
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-info">
			<font style = "vertical-align : inherit;">
			<font style = "vertical-align : inherit;">수정</font></font></button>
			</form>
		</div>
		
		<div class="grid_item third">
			<form action="${path}/book/deleteBook.do" method="POST">
				<input type="hidden" name="book_name" value="${bvo.book_name}">
				<input type="hidden" name="page" value="${supPaging.page}"> 
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-danger"onclick="return confirm('삭제하시겠습니까?')">
				<font style = "vertical-align : inherit;">
				<font style = "vertical-align : inherit;">삭제</font></font> 
			</button>
			</form>
		</div>
 	   </div>
 	  </div>
 	<%} %>
<%-- <%} else { %>
<div class="all" align="center">
<div class="container2" >
<div align="center">
<ul>
<li>
			<div class="pic"><!-- 책 사진 -->
				<img src="<spring:url value='/resources/img/${bvo.book_picture}'/>">
			</div>
			</li>
			<li>
		<div class="book1"> <!-- 책 명 -->
			<h2><pre>${bvo.book_name}</pre></h2>
			<hr>
		<table>
			<tbody>
				<tr>
					<th>판매가:&nbsp;</th>
					 <td class="price"> ${bvo.book_price}원</td>
				</tr>
				<tr>
					<th>글쓴이:&nbsp;</th>
					<td>${bvo.book_writer}</td>
				</tr>
				<tr>
					<th>수량:&nbsp;</th>
					<td>로그인 후 이용해 주세요.</td>
				</tr>
		</tbody>
		</table>
		</div></li></ul></div>
		<br><br>

		<ul class = "nav nav-tabs">
  <li class = "nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 책 소개 </font> </font> </a>
  </li>
  <li class = "nav-item">
    <a class="nav-link" data-toggle="tab" href="#profile"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 목차 </font> </font> </a>
  </li>
  </ul>
 </div>
 
<div id = "myTabContent"class = "tab-content">
	<div class = "tab-pane fade active show"id = "home">
    	<pre style = "overflow : auto; height : 200px;"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;">${bvo.book_info}
     </font></font></pre>
	</div>
	<div class = "tab-pane fade"id = "profile">
    	<pre style = "overflow : auto; height : 200px;"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;">${bvo.book_mokcha}</font></font></pre>
	</div>
</div>
		<form action="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
			<input type="hidden" name="page" value="${supPaging.page}">
			<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-primary">
			<font style = "vertical-align : inherit;">
			<font style = "vertical-align : inherit;">목록 </font></font></button>
		</form>
</div>
	<%}%>
  --%>
</body>
</html>