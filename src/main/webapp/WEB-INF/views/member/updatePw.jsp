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
<title>비밀번호변경</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div class="col-sm-8" style="text-align: center;">
	<h1>비밀번호변경</h1>
	<br>
	<div class="row">
	<form action="${path}/member/updatePw.do" onsubmit="return validate()" method="POST" style="margin: auto; text-align: center;">
		<div class="form-group row" >
		<input type="hidden" id="userId" name ="userId" value="${sessionScope.userId}">
		<label>현재비밀번호</label> &nbsp;&nbsp; 
		<input type="password" id="oldPw" required>
		</div>
		<div id="pwChkMsg"></div>
		
		<div class="form-group row" >
		<label>변경할비밀번호</label>&nbsp;&nbsp; 
		<input type="password"  id="userPw" name="userPw" disabled required>
		<div id="newPwChkMsg"></div>
		</div>
		<br><br>
		<input type="submit" class="btn btn-primary" id="updatePwSubmit" value="비밀번호 변경">
		<a href="${path}/member/mypage.do?userId=${sessionScope.userId}"><input type="button" class="btn btn-secondary" value="취소" ></a>
	</form>
	</div>
</div>
<script type="text/javascript">
//현재비밀번호, 새비밀번호 각각이 조건에 부합하면true / 그렇지 못하면 false
//배열의 모든 요소가 true여야 회원가입가능
var ckval = new Array(2).fill(false);

//현재비밀번호 확인 
	$('#oldPw').blur(function(){
		var userId = $("#userId").val();
		var inputPw = $("#oldPw").val();
		$.ajax({
			type:"POST",
			url:"${path}/member/pwChk.do",
			data:{
				userId: userId,
				inputPw: inputPw
			},
			success: function(result) {
				if(result == true){
					ckval[0] = true;
					$('#pwChkMsg').text('');
					$("#oldPw").css('border','3px solid green');
					$('#userPw').attr("disabled",false);
					$('#updatePwSubmit').attr("disabled",false);
				}else{
					ckval[0] = false;
					$('#pwChkMsg').text('비밀번호가 일치하지 않습니다.');
					$("#oldPw").css('border','3px solid red');
					$('#pwChkMsg').css('color','red');
					$('#userPw').attr("disabled",true);
					$('#updatePwSubmit').attr("disabled",true);
				}
			}
		})
	})
	
//새비밀번호 유효성검사
	$('#userPw').blur(function(){
		var oldPw = $("#oldPw").val();
		var newPw = $("#userPw").val();
		//비밀번호 정규식
		var pwRE =/^[a-zA-Z0-9]{4,12}$/;	//알파벳대소문자/숫자 4-12자리 
		
		if(oldPw == newPw){
			ckval[1] = false;
			$('#newPwChkMsg').text('이전 비밀번호와 같습니다.');
			$('#newPwChkMsg').css('color','red');
			$('#updatePwSubmit').attr("disabled",true);
		}else{
			if(pwRE.test(newPw)){
				ckval[1] = true;
				$("#userPw").css('border','3px solid green');
				$('#newPwChkMsg').text('');
				$('#updatePwSubmit').attr("disabled",false);
			}else{
				ckval[1] = false;
				$("#userPw").css('border','3px solid red');
				$('#newPwChkMsg').text('비밀번호는 알파벳 대소문자/숫자로 구성된 4-12자리여야 합니다.');
				$('#newPwChkMsg').css('color','red');
				$('#updatePwSubmit').attr("disabled",true);
			}
		}
	})
	
//제출버튼 눌렀을때 전체 유효성검사
	function validate(){
		for(var i=0; i<ckval.length; i++){
			if(ckval[i]==false){
				alert('입력 내용을 다시 확인하세요');
				switch(i){
					case 0: $("#oldPw").focus(); break;
					case 1: $("#userPw").focus(); break;
				}
				return false;
			}
		}
		return true;
	}
</script>
</body>
</html>