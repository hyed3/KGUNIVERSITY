<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br><br>
	<div class="col-sm-6" style="text-align:center;">
	<h2>회원정보 수정</h2>
	<br>
	<form action="${path}/member/updateUser.do" method="post" onsubmit="return validate()">
		<table class="table table-hover">
			<input type="hidden" id="userId" name="userId" value="${vo.userId}">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" id="userName" name="userName" value="${vo.userName}">
					<div id="nameValMsg"></div>
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" id="nickname" name="nickname" value="${vo.nickname}">
					<!-- <input type="button"  class="btn btn-outline-primary btn-sm" value="중복확인" > -->
					<div id="nickChkMsg"></div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" id="email" name="email" value="${vo.email}">
					<!-- <input type="button"  class="btn btn-outline-primary btn-sm" value="중복확인" > -->
					<div id="emailChkMsg"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary" id="updateSubmit" value="수정">
					<a href="${path}/member/mypage.do?userId=${vo.userId}"><input type="button"  class="btn btn-secondary" value="취소" ></a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
<script type="text/javascript">
//아이디,이메일,닉네임 각각이 조건에 부합하면true / 그렇지 못하면 false
//배열의 모든 요소가 true여야 수정가능
var ckval = new Array(3).fill(true);
//이름 유효성검사 함수
$('#userName').blur(function(){
	var name = $('#userName').val();
	//이름 정규식
	var nameRE = /^[가-힣]{2,6}$/;
	
	if(nameRE.test(name)){
		ckval[0] = true;
		$("#userName").css('border','3px solid green');
		$('#nameValMsg').text('');
	}else{
		ckval[0] = false;
		$("#userName").css('border','3px solid red');
		$('#nameValMsg').text('이름을 확인해주세요');
		$('#nameValMsg').css('color','red');
	}
})

//닉네임 중복체크, 유효성검사 함수
$('#nickname').blur(function(){
		var nickname = $("#nickname").val();
		$.ajax({
			type: 'GET',
			url: '${path}/member/nickChk.do?nickname='+nickname,
			success: function(result) {
				if(result == 1){
					ckval[1] = false;
					$("#nickname").css('border','3px solid red');
					$('#nickChkMsg').text('이미 사용중인 닉네임입니다.');
					$('#nickChkMsg').css('color','red');
				}else{
					if(nickname.length>=3 && nickname.length<=8){
						ckval[1] = true;
						$("#nickname").css('border','3px solid green');
						$('#nickChkMsg').text('');
						$('#nickChkMsg').css('color','green');
					}else{
						ckval[1] = false;
						$("#nickname").css('border','3px solid red');
						$('#nickChkMsg').text('닉네임은 3~8자리여야 합니다.');
						$('#nickChkMsg').css('color','red');
					}
					
				}
			} 
		})
	})

//이메일 유효성검사 함수
$('#email').onchange(function(){
	var email = $('#email').val();
	//이메일 정규식 ID는 숫자영대소문자-_허용 @ 영대소문자 . 영대소문자(2-3글자)
	var emailRE = /^[0-9a-zA-Z_-]+@[a-zA-Z]+.[a-zA-Z]{2,3}$/;
	
	$.ajax({
		type: 'GET',
		url: '${path}/member/emailChk.do?email='+email,
		success: function(result) {
			if(result == 1){
				ckval[0] = false;
				$("#email").css('border','3px solid red');
				$('#emailChkMsg').text('이미 사용중인 이메일입니다.');
				$('#emailChkMsg').css('color','red');
			}else{
				if(emailRE.test(email)){
					ckval[0] = true;
					$("#email").css('border','3px solid green');
					$('#emailChkMsg').text('');
					$('#emailChkMsg').css('color','green');
				}else{
					ckval[3] = false;
					$("#email").css('border','3px solid red');
					$('#emailChkMsg').text('이메일은 xxx@xxx.xxx 형식으로 입력해주세요');
					$('#emailChkMsg').css('color','red');
				}
				
			}
		} 
	})
})

//제출버튼 눌렀을때 전체 유효성검사
	function validate(){
		for(var i=0; i<ckval.length; i++){
			if(ckval[i]==false){
				alert('입력 내용을 다시 확인하세요');
				switch(i){
					case 0: $("#userName").focus(); break;
					case 1: $("#nickname").focus(); break;
					case 2: $("#email").focus(); break;
				}
				return false;
			}
		}
		return true;
	}
</script>

</body>
</html>