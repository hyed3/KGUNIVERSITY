<%@page import="com.kgu.www.vo.FreeBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link href='<c:url value="/resources/css/bootstrap.css" />' rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet">

<meta charset="UTF-8">
<title>KG_University - 동아리게시판</title>

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
								onclick="location.href='ClubBoard_Write.do'"
								style="font-size: 18px; font-weight:bold;">글쓰기</button>
					</td>
				</tr>
			</table>	
			<hr width="90%" style="border: solid 1px;">
			<br>
			
			<div style="width: 90%; margin-left: 5%;">
			<table class="table table-hover">
				<thead>
					<tr height="50" class="table-active">
						<th width="70"><font style="font-size: 14pt;">번호</font></th>
						<th width="100"><font style="font-size: 14pt;">분류</font></th>
						<th><font style="font-size: 14pt;">제목</font></th>
						<th width="120"><font style="font-size: 14pt;">작성자</font></th>
						<th width="150"><font style="font-size: 14pt;">작성일</font></th>
						<th width="80"><font style="font-size: 14pt;">조회수</font></th>
					</tr>
				</thead>
				<c:forEach var="cbList" items="${cbList}"	begin="${(boardPagingVO.pageNum-1)*boardPagingVO.perPageCnt}"
															end="${boardPagingVO.pageNum*boardPagingVO.perPageCnt-1}">
					<tr>
						<td width="70" height="25"><c:out value="${cbList.CBN_seq}" /></td>
						<td width="100">
							<c:choose>
								<c:when test="${cbList.type eq 'gongji'}">
									<c:out value="공지" />
								</c:when>
								<c:when test="${cbList.type eq 'hongbo'}">
									<c:out value="홍보" />
								</c:when>
								<c:when test="${cbList.type eq 'hang'}">
									<c:out value="행사" />
								</c:when>
								<c:otherwise>
									<c:out value="기타" />
								</c:otherwise>
							</c:choose>
						</td>
						
						<td style="text-align: left; padding-left: 5px;">
							<a href="ClubBoard_Content.do?cNum=${cbList.CBN_seq}">
								<c:out value="${cbList.title}" />
							</a>
							<c:if test="${cbList.commentCnt > 0}">
								[<c:out value="${cbList.commentCnt}" />]
							</c:if>
						</td>
						<td width="120"><c:out value="${cbList.userNickname}" /></td>
						<td width="150"><c:out value="${cbList.regDate}" /></td>
						<td width="70"><c:out value="${cbList.hit}" /></td>
					</tr>
				</c:forEach>
			</table>
			</div>
			
			<br>
			<hr width="90%" style="border: solid 1px;">
			<br>
			
			<!-- 페이징부 -->
			<font style="font-size: 13pt; font-weight: bold; color: black;">페이지이동</font><br>
			<c:if test="${boardPagingVO.pageNum ne 1}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="ClubBoard_List.do?page=1
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">처음</a>
				</font>
			</c:if>
			<c:if test="${boardPagingVO.prev}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="ClubBoard_List.do?page=${(boardPagingVO.pageBlock-2) * boardPagingVO.displayPageNum + 1}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">이전</a>
				</font>
			</c:if>
			&nbsp;
			<c:forEach var="page" begin="${boardPagingVO.startPage}" end="${boardPagingVO.endPage}">
				<c:choose>
					<c:when test="${boardPagingVO.pageNum eq page}">
						<font style="font-size: 13pt; font-weight: bold;">
							<a href="ClubBoard_List.do?page=${page}
									&searchType=${boardPagingVO.searchType}
									&searchKeyword=${boardPagingVO.searchKeyword}">${page}</a>
						</font>	
					</c:when>
					<c:otherwise>
						<font style="font-size: 13pt;">
							<a href="ClubBoard_List.do?page=${page}
									&searchType=${boardPagingVO.searchType}
									&searchKeyword=${boardPagingVO.searchKeyword}">${page}</a>
						</font>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			&nbsp;
			<c:if test="${boardPagingVO.next}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="ClubBoard_List.do?page=${boardPagingVO.pageBlock * boardPagingVO.displayPageNum + 1}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">다음</a>
				</font>
			</c:if>
			<c:if test="${boardPagingVO.pageNum < boardPagingVO.lastPage}">
				<font style="font-size: 13pt; font-weight: bold;">
					<a href="ClubBoard_List.do?page=${boardPagingVO.lastPage}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">마지막</a>
				</font>
			</c:if>
			
			<!-- 검색부 -->
			<br><br>
			<form action="ClubBoard_List.do">
			<table>
			<tr>
				<td>
					<select name="searchType" class="form-control" id="exampleSelect1" style="width: 120px; margin-right: 13px;">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>	
				</td>
				<td>
					<input type="text" name="searchKeyword" class="form-control" id="inputDefault">
				</td>
				<td>
					<input type="submit" value="검색" class="form-control" id="inputDefault" style="margin-left: 13px;">
				</td>
			</tr>
			</table>
			</form>

		</div>
	</div>
	
</body>
</html>