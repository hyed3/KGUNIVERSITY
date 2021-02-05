<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

<link href='<c:url value="/resources/css/bootstrap.css" />' rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet">

<meta charset="UTF-8">
<title>공지사항 - ${noticeContent.content}</title>

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
		height:2500px;
		float:left;
	}
	#section1{
		width:80%;
		height:2500px;
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
						<input type="button" value="목록" onclick="location.href='Notice_List.do'"
								class="btn btn-primary" style="font-size: 18px; font-weight:bold;">
					</td>
					<td width="90" style="text-align: right;">
						<input type="button" value="글쓰기" onclick="loginCheck('write');"
								class="btn btn-primary" style="font-size: 18px; font-weight:bold;">
					</td>
					<td width="70" style="text-align: right;">
						<input type="button" value="수정" onclick="loginCheck('update');"
								class="btn btn-secondary" style="font-size: 18px; font-weight:bold;">
					</td>
					<td width="70" style="text-align: right;">
						<input type="button" value="삭제" onclick="loginCheck('delete');"
								class="btn btn-danger" style="font-size: 18px; font-weight:bold;">
					</td>
				</tr>
			</table>		
			<hr width="90%" style="border: solid 1px;">
			
			<table border="0" width="90%">
				<tr>
					<td colspan="5" style="text-align: left;">
						<font size="4" style="font-weight: bold;">
							<c:choose>
								<c:when test="${noticeContent.type eq 'haksa'}">
									[학사] ${noticeContent.title}
								</c:when>
								<c:when test="${noticeContent.type eq 'daily'}">
									[일상] ${noticeContent.title}
								</c:when>
								<c:when test="${noticeContent.type eq 'discuss'}">
									[토론] ${noticeContent.title}
								</c:when>
								<c:otherwise>
									[일반] ${noticeContent.title}
								</c:otherwise>
							</c:choose>
						</font>
					</td>
				</tr>
				<tr style="text-align: left;">
					<td><font style="font-weight: bold;">글번호</font> ${noticeContent.NTN_seq}</td>
					<td width="400" style="text-align: right; padding-right: 20px;">
						<font style="font-weight: bold;">등록일</font> ${noticeContent.regDate}
						<c:if test="${not empty noticeContent.modifyDate}">
							&nbsp;&nbsp;<font style="font-weight: bold;">수정일</font> ${noticeContent.modifyDate}
						</c:if>
					</td>
					<td width="80"><font style="font-weight: bold;">조회수</font> ${noticeContent.hit}</td>
					<td width="150"><font style="font-weight: bold;">글쓴이</font> ${noticeContent.userNickname}</td>
					<td width="80" style="text-align: right;"><font style="font-weight: bold;">댓글</font> ${noticeContent.commentCnt}개</td>
				</tr>
			</table>
			<hr width="90%" style="border: solid 1px;">
			
			<div style="width: 90%; text-align: left; padding-left: 5%;">
				<c:if test="${not empty noticeContent.imgName}">
					<img src ="<spring:url value='/resources/boardImg/${noticeContent.imgName}'/>"><br>
					<br><br>
				</c:if>
				<pre><c:out value="${noticeContent.content}" /></pre>
			</div>
			<br><br>
			
			<table width="90%">
				<tr><td style="text-align: left; font-weight: bold;">댓글 ${noticeContent.commentCnt}개</td></tr>
			</table>
			<hr width="90%" style="border-bottom-style: solid; border-color: blue;">
			
			<table border="0" width="90%">
				<thead>
					<tr>
						<th width="150" style="text-align: left;">닉네임</th>
						<th>댓글</th>
						<th width="200" style="text-align: right;">등록일</th>
					</tr>
				</thead>
			</table>
			<hr width="90%" style="border: solid 1px;"><br>
			<div style="width: 90%; margin-left: 5%;">
			<table class="table table-hover">
				<c:forEach var="noticeComment" items="${noticeComment}" begin="${(boardCommentPagingVO.pageNum-1)*boardCommentPagingVO.perPageCnt}"
																end="${boardCommentPagingVO.pageNum*boardCommentPagingVO.perPageCnt-1}">
					<tr>
						<td width="150" height="30" style="text-align: left;"><c:out value="${noticeComment.userNickname}" /></td>
						<td style="text-align: left;"><pre><c:out value="${noticeComment.boardComment}" /></pre></td>
						<td width="200" style="text-align: right;"><c:out value="${noticeComment.regDate}" /></td>
						
						<td width="10" style="text-align: right;">
							<button id="${'comment'+=noticeComment.NTC_seq}" value="${noticeComment.boardComment}"
							class="badge badge-secondary" style="font-size: 11pt; padding: 3px;"
							onclick="commentUpdateCheck('${noticeComment.NTC_seq}', '${noticeComment.userID}')">수정</button>
						</td>
						
						<td width="10" style="text-align: right;">
							<button type="button" class="badge badge-danger" style="font-size: 11pt; padding: 3px 6px;"
							onclick="commentDelete('${noticeComment.NTC_seq}', '${noticeComment.userID}')">X</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			<br>
			
			<!-- 댓글수정시 수정창 생성위치 -->
			<table border="0" width="90%" id="commentUD"></table>
			
			<br>
			
			<!-- 댓글페이징부 -->
			<c:if test="${boardCommentPagingVO.pageNum ne 1}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="Notice_Content.do?cPage=1&cNum=${noticeContent.NTN_seq}">처음</a>
				</font>
			</c:if>
			<c:if test="${boardCommentPagingVO.prev}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="Notice_Content.do?cPage=${(boardCommentPagingVO.pageBlock-2) * boardCommentPagingVO.displayPageNum + 1}&cNum=${noticeContent.NTN_seq}">이전</a>
				</font>
			</c:if>
			&nbsp;
			<c:forEach var="cPage" begin="${boardCommentPagingVO.startPage}" end="${boardCommentPagingVO.endPage}">
				<c:choose>
					<c:when test="${boardCommentPagingVO.pageNum eq cPage}">
						<font style="font-size: 13pt; font-weight: bold;">
							<a href="Notice_Content.do?cPage=${cPage}&cNum=${noticeContent.NTN_seq}">${cPage}</a>
						</font>
					</c:when>
					<c:otherwise>
						<font style="font-size: 13pt;">
							<a href="Notice_Content.do?cPage=${cPage}&cNum=${noticeContent.NTN_seq}">${cPage}</a>
						</font>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			&nbsp;
			<c:if test="${boardCommentPagingVO.next}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="Notice_Content.do?cPage=${boardCommentPagingVO.pageBlock * boardCommentPagingVO.displayPageNum + 1}&cNum=${noticeContent.NTN_seq}">다음</a>
				</font>
			</c:if>
			<c:if test="${boardCommentPagingVO.pageNum < boardCommentPagingVO.lastPage}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="Notice_Content.do?cPage=${boardCommentPagingVO.lastPage}&cNum=${noticeContent.NTN_seq}">마지막</a>
				</font>
			</c:if>
			<!-- 댓글페이징부-end -->
			
			<!-- 댓글등록 -->			
			<hr width="90%" style="border: solid 1px;">
			<br>
			<form action="Notice_Content_CommentUpload.do">
			<input type="hidden" name="cPage" value="${boardCommentPagingVO.lastPage}">
			<input type="hidden" name="cNum" value="${noticeContent.NTN_seq}">
<!-- 세션확인, 닉네임도필요 -->
			<input type="hidden" name="sessionUserID" value="${sessionScope.userId}">
			<input type="hidden" name="sessionNickname" value="${sessionScope.nickname}">
			
			<table border="0" width="90%">
				<!-- <tr>
					<td height="40" style="text-align: left;">
						<input type="password" name="ntCommentPW" maxlength="8" placeholder="비밀번호(최대 8자)" style="font-size: 11pt;">
					</td>
				</tr> -->
				<tr>
					<td>
						<c:choose>
							<c:when test="${not empty sessionScope.userId}">
								<textarea name="ntComment" maxlength="500" placeholder="댓글을 입력해주세요"
								class="form-control" id="exampleTextarea"
								style="width: 100%; height: 150px; resize: none; border: solid 2px;"></textarea>
							</c:when>
							<c:otherwise>
								<textarea name="ntComment" maxlength="500" placeholder="로그인이 필요합니다"
								class="form-control" id="exampleTextarea"
								style="width: 100%; height: 150px; resize: none; border: solid 2px;" disabled></textarea>
							</c:otherwise>
						</c:choose>
					
					</td>
				</tr>
				
				<c:if test="${not empty sessionScope.userId}">
				<tr>
					<td colspan="2" style="text-align: right;">
						<input type="submit" value="댓글등록" class="btn btn-primary"
						style="font-size: 16px; font-weight:bold; padding: 5px 10px; border-radius: 5px;">
					</td>
				</tr>	
				</c:if>
			</table>
			</form>
			<br>
			<hr width="90%" style="border: solid 1px;">
			<!-- 댓글등록-end -->
			
		</div>
	</div>
	
	<script>
		function loginCheck(type){
			var sessionUserID = "${sessionScope.userId}";
			
			if(sessionUserID){
				if(type == "write"){
					location.href='Notice_Write.do'
				} else if (type == "update"){
					content_Update();
				} else if (type == "delete"){
					content_Delete();
				}
			} else {
				alert("로그인이 필요합니다");
			}
			
		};
		function content_Delete(){
			var sessionUserID = "${sessionScope.userId}";
			var contentWriterID = "${noticeContent.userID}";
			
			if(sessionUserID){
				if(sessionUserID == contentWriterID){
					if(confirm("정말로 삭제하시겠습니까?")){
						location.href='Notice_Delete.do?cNum=${noticeContent.NTN_seq}&fileName=${noticeContent.imgName}'
					}
				} else {
					alert("삭제할 수 없습니다");
				}
			} else {
				alert("로그인이 필요합니다");
			}
		};
		function content_Update(){
			var sessionUserID = "${sessionScope.userId}";
			var contentWriterID = "${noticeContent.userID}";
			
			if(sessionUserID){
				if(sessionUserID == contentWriterID){
					location.href='Notice_UpdateForm.do?cNum=${noticeContent.NTN_seq}'
				} else {
					alert("수정할 수 없습니다");
				}
			} else {
				alert("로그인이 필요합니다");
			}
		};
		function commentDelete(commentNum, commentWriterID, commentWriterPW){
			var sessionUserID = "${sessionScope.userId}";
			
			if(sessionUserID){
				if(sessionUserID == commentWriterID){
					if(confirm("정말로 삭제하시겠습니까?")){
						location.href='Notice_Content_CommentDelete.do?cNum=${noticeContent.NTN_seq}&commentNum='+commentNum;
					}
				} else {
					alert("삭제할 수 없습니다");
				}
			} else {
				alert("로그인이 필요합니다");
			}
		};
		
		function commentUpdateCheck(commentNum, commentWriterID){
			var sessionUserID = "${sessionScope.userId}";
			
			if(sessionUserID){
				if(sessionUserID == commentWriterID){
					commentUpdate(commentNum);
				} else {
					alert("수정할 수 없습니다");
				}
			} else {
				alert("로그인이 필요합니다");			
			}
		};
		
		function commentUpdate(commentNum){
			var html = '';
			/* var comment = document.getElementById('commentUpdate').value; */
			var contentNum = "${noticeContent.NTN_seq}";
			var comment = document.getElementById('comment'+commentNum).value;
			
			html += '<tr>';
			html += '<td style="text-align: left;">';
			html += '<form action="Notice_Content_CommentUpdate.do">';
			html += '<input type="hidden" name="commentNum" value="';
			html += commentNum;
			html += '">';
			html += '<input type="hidden" name="contentNum" value="';
			html += contentNum;
			html += '">';
			html += '<textarea name="comment" class="form-control" id="exampleTextarea"';
			html += 'style="width: 50%; height: 120px; resize: none; border: solid 2px;">'
			html += comment;
			html += '</textarea><br>';
			html += '<input type="submit" value="댓글수정" class="btn btn-primary"';
			html += 'style="font-size: 16px; padding: 5px 10px; border-radius: 5px;">';
			html += '&nbsp;';
			html += '<button onclick="cUpdateCancel()" class="btn btn-secondary"';
			html += 'style="font-size: 16px; padding: 5px 10px; border-radius: 5px;">수정취소</button>';
			html += '</form>';
			html += '</td>';
			html += '</tr>';
			
			$("#commentUD").empty();
			$("#commentUD").append(html);
						
		};
		function cUpdateCancel(){
			$("#commentUD").empty();
		};
	</script>
	
</body>
</html>