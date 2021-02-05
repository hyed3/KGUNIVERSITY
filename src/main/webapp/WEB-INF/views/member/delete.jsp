<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div class="col-sm-8" style="text-align: center;">
	<h1>회원탈퇴</h1>
	<br>
	
			<p class="lead">
				사용하고 계신 아이디<font color="red">${sessionScope.userId}</font>를 탈퇴하시겠습니까?<br>
				회원탈퇴시 해당 계정의 개인정보는 모두 삭제처리되며,<br> 탈퇴후에는 복구가 불가능합니다.<br>
			</p>
			<br>
	<form action="${path}/member/deleteUser.do" class="form-control" method="post">
			<input type="hidden" id="userId" name="userId" value="${sessionScope.userId}">
				<label>비밀번호</label>&nbsp;&nbsp; 
				<input type="password" id="userPw" name="userPw" required>
		<br><br>
				<div id="pwChkMsg"></div>
				<br><br>
				<input type="submit" class="btn btn-danger" value="회원탈퇴"  id="deleteSubmit" onclick="return confirm('정말 탈퇴하시겠습니까?')" disabled>
				<a href="${path}/member/mypage.do?userId=${sessionScope.userId}"><input type="button" class="btn btn-secondary" value="취소" ></a>
		
	</form> 
	</div>	
<script type="text/javascript">
//비밀번호 확인 
	$('#userPw').blur(function(){
		var userId = $("#userId").val();
		var inputPw = $("#userPw").val();
		$.ajax({
			type:"POST",
			url:"${path}/member/pwChk.do",
			data:{
				userId: userId,
				inputPw: inputPw
			},
			success: function(result) {
				if(result == true){
					$('#pwChkMsg').text('');
					$("#userPw").css('border','3px solid green');
					$('#deleteSubmit').attr("disabled",false);
				}else{
					$('#pwChkMsg').text('비밀번호가 일치하지 않습니다.');
					$("#userPw").css('border','3px solid red');
					$('#pwChkMsg').css('color','red');
					$('#deleteSubmit').attr("disabled",true);
				}
			}
		})
	})
</script>
</body>
</html>