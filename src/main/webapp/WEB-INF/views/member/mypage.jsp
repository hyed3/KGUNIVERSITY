<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<div class="col-sm-6" style="text-align:center; margin-top:auto; margin-left: auto; margin-right: auto;">
	<h2>마이페이지</h2>
	<br>
	<table class="table table-hover">
		<tr>
			<td>아이디</td>
			<td>${vo.userId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${vo.userName}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${vo.email}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${vo.nickname}</td>
		</tr>
		<tr>
			<td>가입일</td>
			<c:set var="now" value="${vo.joinDate}"></c:set>
			<td><fmt:formatDate value="${now}" type="date"/></td>
		</tr>
		<tr>
			<td>책구매내역</td>
			<td><a href="${path}/book/userPurchase.do?user_id=${vo.userId}">구매내역보기</a></td>
		</tr>
		<tr>
			<td>내가쓴글</td>
			<td><%-- <a href="${path}/MyWrite_List.do?userId=${vo.userId}">내가쓴글보기</a> --%>
				<a href="${path}/Notice_List.do?searchType=myWrite&searchKeyword=${vo.userId}">공지게시판</a><br>
				<a href="${path}/FreeBoard_List.do?searchType=myWrite&searchKeyword=${vo.userId}">자유게시판</a><br>
				<a href="${path}/InfoBoard_List.do?searchType=myWrite&searchKeyword=${vo.userId}">정보게시판</a><br>
				<a href="${path}/ClubBoard_List.do?searchType=myWrite&searchKeyword=${vo.userId}">동아리게시판</a><br>
				<a href="${path}/boardList?searchType=i&Keyword=${vo.userId}">학생장터</a>
			</td>
		</tr>
	</table>
	<a href="${path}/member/update.do?userId=${vo.userId}">
		<input type="button" class="btn btn-primary" value="회원정보수정">
	</a>
	<a href="${path}/member/pw.do">
		<input type="button" class="btn btn-secondary" value="비밀번호수정">
	</a>
	<a href="${path}/member/delete.do">
		<input type="button" class="btn btn-danger" value="회원탈퇴">
	</a>
	</div>
</body>
</html>