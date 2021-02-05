<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<div id="div_root">
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
						<font size="6" style="font-weight: bold;">공지사항</font>
					</td>
					<td style="text-align: right;">
						<button type="button" class="btn btn-primary"
								onclick="return_List();"
								style="font-size: 18px; font-weight:bold;">목록</button>
					</td>
				</tr>
			</table>	
			<hr width="90%" style="border: solid 1px;">
			
			<form action="Notice_Update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cNum" value="${noticeContent.NTN_seq}">
			<input type="hidden" name="fNameOri" value="${noticeContent.imgName}">
			
			<table border="0" width="90%">
				<tr style="margin-top: 10px;">
					<td width="80" height="45" style="text-align: left; font-weight: bold;">
						<font size="5">분류</font>
					</td>
					<td style="text-align: left;">
						<select id="contentType" name="contentType" class="form-control" style="width: 200px;">
							<option value="haksa">학사</option>
							<option value="hang">행정</option>
							<option value="janghak">장학</option>
							<option value="hak">학과</option>
							<option value="ect">기타</option>
						</select>
						<script>
							$(document).ready(function(){
								var type = '${noticeContent.type}';
								
								if(type == "haksa") {
									$("#contentType option:eq(0)").attr('selected', 'selected');
								} else if(type == "hang") {
									$("#contentType option:eq(1)").attr('selected', 'selected');
								} else if(type == "janghak") {
									$("#contentType option:eq(2)").attr('selected', 'selected');
								} else if(type == "hak") {
									$("#contentType option:eq(3)").attr('selected', 'selected');
								} else if(type == "ect") {
									$("#contentType option:eq(4)").attr('selected', 'selected');
								}
							});
						</script>
					</td>
				</tr>
				<tr>
					<td height="45" style="text-align: left; font-weight: bold;">
						<font size="5">제목</font>
					</td>
					<td style="text-align: left;">
						<input type="text" name="contentTitle" maxlength="50"
								value="${noticeContent.title}" class="form-control" id="inputDefault">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="65" style="text-align: left;">
						<input type="file" name="file" accept="image/*">
					</td>
				</tr>
				<tr>
					<td height="15" style="text-align: left;">
						<font size="3">첨부파일</font>
					</td>
					<td style="text-align: left;">
						<c:choose>
							<c:when test="${not empty noticeContent.imgName}">
								<p id="fileName">${noticeContent.imgName}
								<button type="button" onclick="deleteUploadedFile()">X</button>					
							</c:when>
							<c:otherwise>
								첨부파일없음
							</c:otherwise>
						</c:choose>
						<script>
							function deleteUploadedFile(){
								if(confirm("첨부파일을 삭제하시겠습니까?")){
									$("#fileName").text("첨부파일없음");
								}
							};
						</script>
						<input type="hidden" id="fileDeleteCheck" name="deleteCheck" value="1">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="420" style="text-align: left; margin-top: 40px;">
						<textarea name="content" maxlength="1200" class="form-control" id="exampleTextarea"
								style="width: 100%; height: 400px; resize: none; border: solid 2px; ">${noticeContent.content}</textarea>
					</td>
				</tr>
			</table>
			
			<br><hr width="90%" style="border: solid 1px;">
			<input type="submit" value="수정" class="btn btn-primary" style="font-size: 13pt; font-weight: bold;">
			<input type="button" value="취소" onclick="return_List();" class="btn btn-primary" style="font-size: 13pt; font-weight: bold;">
			</form>
			
		</div>
	</div>
	
	<script>
		function return_List(){
			if(confirm("정말로 나가시겠습니까?\n작성중이던 내용은 삭제됩니다")){
				location.href="Notice_List.do"
			}
		};
	</script>
	
</body>
</html>