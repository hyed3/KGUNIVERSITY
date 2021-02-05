<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href='<c:url value="/resources/css/bootstrap.css" />' rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet">

<meta charset="UTF-8">
<title>KG_University</title>

<style>
	a {text-decoration:none}
	table{
		margin-left:auto;
		margin-right:auto;
	}
	#div_root{
		margin:0 auto;
		width:1500px;
		height:100%;
	}
	#blank{
		width:100%;
		height:100px;
		float:left;
	}
	#nav1{
		width:20%;
		height:1200px;
		float:left;
	}
	#section1{
		width:80%;
		height:1200px;
		float:left;
	}
	#blank, #nav1, #section1{text-align: center;}
</style>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<div id="div_root">
		<div id="header">
			<h2>header</h2>
		</div>
		<div id="blank">
			<h2>　</h2>
		</div>
		<div id="nav1">
			<hr width="70%" style="border: solid 1px;">
			<h1 style="font-weight: bold;">게시판</h1>
			<hr width="70%" style="border: solid 1px;">
			
			<table width="50%" border="0" style="text-align: left;">
				<tr>
					<td width="170" height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="Notice_List.do">공지사항</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="FreeBoard_List.do">자유게시판</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="InfoBoard_List.do">정보게시판</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="ClubBoard_List.do">동아리게시판</a>
						</font>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="section1">
			<br>
			<table border="0" width="90%">
				<tr>
					<td style="text-align: left;">
						<font size="6" style="font-weight: bold;">동아리게시판</font>
					</td>
					<td style="text-align: right;">
						<button type="button" class="btn btn-primary"
								onclick="return_List();"
								style="font-size: 18px; font-weight:bold;">목록</button>
					</td>
				</tr>
			</table>	
			<hr width="90%" style="border: solid 1px;">
			
			<form action="ClubBoard_Upload.do" method="post" enctype="multipart/form-data">
			<table border="0" width="90%">
				<tr style="margin-top: 10px;">
					<td width="130" height="45" style="text-align: left; font-weight: bold;">
						<font size="5">분류</font>
					</td>
					<td style="text-align: left;">
						<select name="contentType" class="form-control" id="exampleSelect1" style="width: 200px;">
							<option value="gongji">공지</option>
							<option value="hongbo">홍보</option>
							<option value="hang">행사</option>
							<option value="ect">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="45" style="text-align: left; font-weight: bold;">
						<font size="5">제목</font>
					</td>
					<td style="text-align: left;">
						<input type="text" name="contentTitle" maxlength="50"
								placeholder="제목(최대 50자)" class="form-control" id="inputDefault">
					</td>
				</tr>
				<tr>
					<td height="45" style="text-align: left; font-weight: bold;">
						<font size="5">비밀번호</font>
					</td>
					<td style="text-align: left;">
						<input type="password" name="contentPW" maxlength="8"
								placeholder="비밀번호(최대 8자)" class="form-control" id="inputDefault">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="65" style="text-align: left;">
						<input type="file" name="file" accept="image/*">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="420" style="text-align: left; margin-top: 40px;">
						<textarea name="content" maxlength="1200"
						class="form-control" id="exampleTextarea" placeholder="내용을 입력해 주세요"
						style="width: 100%; height: 400px; resize: none; border: solid 2px; "></textarea>
					</td>
				</tr>
			</table>
			
			<br><hr width="90%" style="border: solid 1px;">
			<input type="submit" value="작성완료" class="btn btn-primary" style="font-size: 13pt; font-weight: bold;">
			<input type="button" value="취소" class="btn btn-secondary" onclick="return_List();" style="font-size: 13pt; font-weight: bold;">
			
<!-- 세션확인, 닉네임도필요 -->
			<input type="hidden" name="sessionUserID" value="${sessionScope.userId}">
			<input type="hidden" name="sessionNickname" value="${sessionScope.nickname}">
			</form>
			
		</div>
	</div>
	
	<script>
		function return_List(){
			if(confirm("정말로 나가시겠습니까?\n작성중이던 내용은 삭제됩니다")){
				location.href="ClubBoard_List.do"
			}
		}
	</script>
	
</body>
</html>