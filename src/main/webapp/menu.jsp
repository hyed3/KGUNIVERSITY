<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="/www/mainScreen.jsp"><input type="button" value="홈"></a>
<c:choose>
	<c:when test="${sessionScope.userId==null}">
		<a href="/www/member/login.do"><input type="button" value="로그인"></a>
	</c:when>
	<c:otherwise>
		<a href="/www/member/mypage.do?userId=${sessionScope.userId}"><input type="button" value="마이페이지"></a>
		${sessionScope.userId}님이 로그인중입니다.
		<a href="/www/member/logout.do"><input type="button" value="로그아웃"></a>
	</c:otherwise>
	
</c:choose>