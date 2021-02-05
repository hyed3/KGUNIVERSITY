<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div class="col-sm-8" style="text-align: center;">
		<h1>비밀번호 찾기</h1>
		<hr>
		<br>
		<br>
		<form class="form-inline" role="form">
			<div class="form-line form-group" style="margin: auto; text-align: center;">
				<label for="userId" class="col-form-label col-form-label-sm">아이디</label>
				<input type="text" class="form-control form-control-sm" id="userId" name="userId" required />
				&nbsp;
				<label class="col-form-label col-form-label-sm">이메일</label> 
				<input type="text" class="form-control form-control-sm" id="email" name="email" required />
				&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" id="findPwBtn" value="비밀번호찾기">
			</div>
		</form>
		<div id="findResult"></div>
		<br>
		<br> 
		<a href="${path}/member/login.do"><input type="button"  class="btn btn-success" value="로그인"></a> 
		<a href="${path}/member/join.do"><input type="button" class="btn btn-info" value="회원가입"></a>
		<a href="${path}/member/find1.do"><input type="button" class="btn btn-secondary" value="아이디찾기"></a>
	</div>

	<script type="text/javascript">
	$('#findPwBtn').click(function(){
		var userId = $("#userId").val();
		var email = $("#email").val();
		
		if(userId==''){
			$('#findResult').text('아이디를 입력하세요');
			$('#findResult').css('color','red');
			return;
		}
		if(email==''){
			$('#findResult').text('이메일을 입력하세요');
			$('#findResult').css('color','red');
			return;
		}
		
		$.ajax({
			type: 'POST',
			url: '${path}/member/findPw.do',
			data:{
				userId: userId,
				email: email
			},
			success: function(result) {
				if(result==-1){
					$('#findResult').text('회원정보가 존재하지 않습니다.\n 회원가입을 진행해 주세요');
					$('#findResult').css('color','red');
				}
				if(result==1){
						$('#findResult').text('임시비밀번호를 이메일로 전송했습니다. 이메일을 확인해주세요');
						$('#findResult').css('color','blue');	
				}
				if(result==0){
						$('#findResult').text('아이디가 틀렸습니다.\n 아이디를 확인해주세요');
						$('#findResult').css('color','red');
				}
			}
			
		})
	})
	</script>
</body>
</html>