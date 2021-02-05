<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%
	String user_id = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" 
	  href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css"
	  integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn"
	  crossorigin="anonymous">
<title>구매 책 목록</title>
<style>
.pagination {
   justify-content: center;
   
}
table{
text-align: center;
		width: 100%;
	table-layout:fixed;
	
	 word-break:break-all; 
		}
	#buylist{
		display: block;
		width: 60%;
		margin:auto;
		 }
		 table img{width:70px; height:70px;
		 }
		
</style>
</head>
<body>

<jsp:include page="../include/header.jsp" />
	<br>
	<br>
<h2 align="center">구매목록</h2>
	<div id="buylist" align="center" >
	 <table border ="1">
		<tr>
			<th>구매제품</th>
			<th>책 명</th>
			<th>구매 수량</th>
			<th>구매 날짜</th>
		</tr>
	 <c:forEach items = "${pvo}" var = "purchase">
		<tr>
			<td><img src ="<spring:url value='/resources/img/${purchase.book_picture}'/>"></td>
			<td>${purchase.book_name}</td>
			<td>${purchase.book_amount}</td>
			<td>${purchase.purchase_date}</td>
		</tr>
	 </c:forEach>
	 </table>
	</div>

<br><br>
	
	   <!-- 페이지 처리 -->
<div>
 <ul class = "pagination" >
    <c:if test="${pageMaker.prev}">
      <li class = "page-item">
         <a class="page-link" href="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(pageMaker.startPage-1)}">
            <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;">이전 </font></font >
         </a>
     </c:if>
    <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
       <li class = "page-item <c:out value ="${pageMaker.supPaging.page == idx ? 'active' : ''}"/>">
             <a class = "page-link" href="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(idx)}">
                ${idx}
             </a>
       </li>
   </c:forEach>
      <c:if test="${pageMaker.next && pageMaker.endPage >0}">
         <li class = "page-item">
            <a class="page-link" href ="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(pageMaker.endPage+1)}">
               <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"> 다음 </font></font>
            </a>
         </li>
      </c:if>
 </ul>
</div>
</body>
</html>