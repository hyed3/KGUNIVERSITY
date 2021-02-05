 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br><br>
	<div class="col-sm-7" style="text-align:center;">
	<h2>회원등록폼</h2>
	<form action="${path}/member/insertUser.do" onsubmit="return validate()" method="post">
		<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" class="input" id="userId" name="userId" required/>
				<div id="idChkMsg"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="userPw" name="userPw" onblur="pwChk()" required/>
				<div id="pwValMsg"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td>
				<input type="password" id="userPw2" name="userPw2" onblur="pwChk()" disabled required/>
				<div id="pwChkMsg"></div>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="userName" name="userName" required/>
				<div id="nameValMsg"></div>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				입력한 이메일계정으로 발송된 인증메일에서 인증하기를 클릭해야 인증과정이 완료됩니다.<br>
				인증 후 로그인이 가능하오니 정확한 이메일을 작성해 주세요.<br>
				<input type="text" id="email" name="email" required/><br>
				<div id="emailChkMsg"></div>
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" id="nickname" name="nickname" required/>
				<div id="nickChkMsg"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" id="joinSubmit" class="btn btn-primary" name="joinSubmit" value="가입">
		<a href="${path}/member/login.do"><input type="button" class="btn btn-secondary" value="취소"></a>
			</td>
		</tr>
			
		</table>
	</form>
</div>


<script type="text/javascript">
	//아이디,비밀번호,이름,이메일,닉네임 각각이 조건에 부합하면true / 그렇지 못하면 false
	//배열의 모든 요소가 true여야 회원가입가능
	var ckval = new Array(5).fill(false);
	
//아이디 중복체크,유효성검사 함수
	$('#userId').blur(function(){
		var userId = $("#userId").val();
		//아이디정규식
		var idRE = /^[a-z0-9]{4,12}$/;	//영어나소문자, 4~12자리
		
		$.ajax({
			type: 'GET',
			url: '${path}/member/idChk.do?userId='+userId,
			success: function(result) {
				if(result == 1){
					ckval[0] = false;
					$("#userId").css('border','3px solid red');
					$('#idChkMsg').text('이미 사용중인 아이디입니다.');
					$('#idChkMsg').css('color','red');
				}else{
					if(idRE.test(userId)){
						ckval[0] = true;
						$("#userId").css('border','3px solid green');
						$('#idChkMsg').text('');
						$('#idChkMsg').css('color','green');
					}else{
						ckval[0] = false;
						$("#userId").css('border','3px solid red');
						$('#idChkMsg').text('아이디는 숫자/알파벳소문자로 이루어진 4~12자여야 합니다.');
						$('#idChkMsg').css('color','red');
					}
					
					
				}
			} 
		})
	})
	
//비밀번호 유효성검사 함수	
	$('#userPw').blur(function(){ 
		var userPw1 = $('#userPw').val();
		//비밀번호 정규식
		var pwRE =/^[a-zA-Z0-9]{4,12}$/;	//알파벳대소문자/숫자 4-12자리 
		
		if(pwRE.test(userPw1)){
			ckval[1] = true;
			$('#pwValMsg').text('');
			$("#userPw").css('border','3px solid green');
			$('#userPw2').attr("disabled",false);
		}else{
			ckval[1] = false;
			$("#userPw").css('border','3px solid red');
			$('#pwValMsg').text('비밀번호는 알파벳 대소문자/숫자로 구성된 4-12자리여야 합니다.');
			$('#pwValMsg').css('color','red');
			$('#userPw2').attr("disabled",true);
		}
	})

//비밀번호와 비밀번호확인이 일치하는지검사 함수
	function pwChk(){
		var userPw1 = $('#userPw').val();
		var userPw2 = $('#userPw2').val();
		if(userPw1 != userPw2){
			ckval[1] = false;
			$("#userPw2").css('border','3px solid red');
			$('#pwChkMsg').text('비밀번호가 서로 일치하지 않습니다.');
			$('#pwChkMsg').css('color','red');
		} else{
			ckval[1] = true;
			$("#userPw2").css('border','3px solid green');
			$('#pwChkMsg').text('');
		}
	}

//이름 유효성검사 함수
$('#userName').blur(function(){
	var name = $('#userName').val();
	//이름 정규식
	var nameRE = /^[가-힣]{2,6}$/;
	
	if(nameRE.test(name)){
		ckval[2] = true;
		$("#userName").css('border','3px solid green');
		$('#nameValMsg').text('');
	}else{
		ckval[2] = false;
		$("#userName").css('border','3px solid red');
		$('#nameValMsg').text('이름을 확인해주세요');
		$('#nameValMsg').css('color','red');
	}
})

//이메일 중복검사, 유효성검사 함수
$('#email').blur(function(){
	var email = $('#email').val();
	//이메일 정규식 ID는 숫자영대소문자-_허용 @ 영대소문자 . 영대소문자(2-3글자)
	var emailRE = /^[0-9a-zA-Z_-]+@[a-zA-Z]+.[a-zA-Z]{2,3}$/;
	
	$.ajax({
		type: 'GET',
		url: '${path}/member/emailChk.do?email='+email,
		success: function(result) {
			if(result == 1){
				ckval[3] = false;
				$("#email").css('border','3px solid red');
				$('#emailChkMsg').text('이미 사용중인 이메일입니다.');
				$('#emailChkMsg').css('color','red');
			}else{
				if(emailRE.test(email)){
					ckval[3] = true;
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

//닉네임 중복체크, 유효성검사 함수
$('#nickname').blur(function(){
		var nickname = $("#nickname").val();
		$.ajax({
			type: 'GET',
			url: '${path}/member/nickChk.do?nickname='+nickname,
			success: function(result) {
				if(result == 1){
					ckval[4] = false;
					$("#nickname").css('border','3px solid red');
					$('#nickChkMsg').text('이미 사용중인 닉네임입니다.');
					$('#nickChkMsg').css('color','red');
				}else{
					if(nickname.length>=3 && nickname.length<=8){
						ckval[4] = true;
						$("#nickname").css('border','3px solid green');
						$('#nickChkMsg').text('');
						$('#nickChkMsg').css('color','green');
					}else{
						ckval[4] = false;
						$("#nickname").css('border','3px solid red');
						$('#nickChkMsg').text('닉네임은 3~8자리여야 합니다.');
						$('#nickChkMsg').css('color','red');
					}
					
				}
			} 
		})
	})

//제출버튼 눌렀을때 전체 유효성 검사
	function validate(){
		for(var i=0; i<ckval.length; i++){
			if(ckval[i]==false){
				alert('입력 내용을 다시 확인하세요');
				switch(i){
					case 0: $("#userId").focus(); break;
					case 1: $("#userPw").focus(); break;
					case 2: $("#userName").focus(); break;
					case 3: $("#email").focus(); break;
					case 4: $("#nickname").focus(); break;
				}
				return false;
			}
		}
		alert('입력하신 이메일로 인증메일이 전송되었습니다.\n인증완료후 로그인이 가능합니다.');
		return true;
	}
	
</script>
</body>
</html>