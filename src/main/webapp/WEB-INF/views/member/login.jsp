<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function validate() {
		var userId = document.loginForm.userId;
		var userPw = document.loginForm.userPw;
		if (userId.value == '') {
			alert('아이디를 입력하세요');
			userId.focus();
			return false;
		}
		if (userPw.value == '') {
			alert('비밀번호를 입력하세요');
			userPw.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<br><br>
	<div class="row">
		<div class="col-sm-5" style="text-align:center; margin-top:auto; margin-left: auto; margin-right: auto;">
			<h1>로그인</h1>
			<hr>
			<br><br>
			<form name="loginForm" action="${path}/member/loginChk.do" method="post" onsubmit="return validate()">
				<table class="table" style="margin-left: auto; margin-right: auto;">
					<tr>			
						<td>아이디</td>
						<td><input type="text" id="userId" name="userId" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPw" name="userPw" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn btn-primary" id="btnLogin" value="로그인"/> 
							<input type="reset" class="btn btn-secondary"  value="취소" />
						</td>
					</tr>
				</table>
			</form>
			아직 회원이 아니신가요?<a href="${path}/member/join.do">회원가입</a><br>
			<a href="${path}/member/find1.do">아이디찾기</a>/<a href="${path}/member/find2.do">비밀번호찾기</a>
		</div>
	</div>
	<c:if test="${msg=='failure'}">
		<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다")
		</script>
	</c:if>
	<c:if test="${msg=='verify failure'}">
		<script>
			alert("이메일 인증이 완료되지 않은 계정입니다.\n이메일 인증 완료 후 로그인해주세요.")
		</script>
	</c:if>
</body>
</html>