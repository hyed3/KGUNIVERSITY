<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=651a3d558f53f93f220843e3443db1cf"></script>

<script>



</script>

</head>

<style>
	h2{
		text-align: center;
		}
	table{
		width: 100%;
		}
	.outter{
		display: block;
		width: 60%;
		margin:auto;
		 }
	</style>
<title>중고장터 목록</title>


<body>
	<br>
	<br>

<h2>게시판</h2>
<div class="outter">
	<table class="table table-hover">
<tr>
			<td>제목:[${Detail.sb}] ${Detail.title }</td>
		</tr>
		<tr>
			<td>
				작성자: ${Detail.id }</td>
				<tr>
				<td>
				<span style="float: left;"><fmt:formatDate value="${Detail.wrdate }" pattern="yyyy.MM.dd"/></span>
			</td>
		</tr>
	
		<tr>
		<td>
		<div class="inputArea">
 	<img src="${Detail.IMGNAME}" class="oriImg" onerror="this.style.display='none'"/>
 	</div>
 	</td>
		</tr>
		
		<tr><!-- 카카오맵 들어갈 곳 -->
		<td>
		<div id="map" style ="width:500px;height:400px;">
		
	<script>
		var x = ${Detail.x};
		var y = ${Detail.y};
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(x, y),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(x, y); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
 		</div>
 		</td>
		</tr>

		
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">${Detail.content }</div></td>
		</tr>
	</table>
	<div>
	<input type="button" value="글 목록" class="btn btn-primary" style="float: right;" onclick="location.href='boardList';"> 
	<c:if test="${sessionScope.userId == Detail.id }">
	<input type="button" value="삭제" class="btn btn-primary" onclick="del(${Detail.bno})">
	</c:if>
	</div>

</div>
<br>
<br>
	
	<div class="outter">

			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="bno" value="${Detail.bno }"> <!-- 게시글번호 컨트롤러 전달용/숨겨진폼 -->
				<input type="hidden" id="cid" value="${sessionScope.userId }"> <!-- 에러 방지용 임시아이디/수정예정-->
				<div class="input_area">
					<table>
						<tr>
						<th>
							<textarea name="ctext" id ="ctext" class="form-control" style="width:100%; min-width:300px; height:50px;"></textarea>
						
						</th>
						<td>
							&nbsp;&nbsp;
							<button type="button" id="CommBtn" class="btn btn-primary" >댓글 등록</button>
						</td>
						</tr>
					</table>
				</div>
				
			</form>
		<section class="commList">
	
		
		<ol>
		</ol>		
		<script>
		
		</script>
	

		</section>
	</div>
	
	
<input type="hidden" id="userId" value="${sessionScope.userId }">

</body>										

<script>
commList();
//var userId = $("#userId").val();
var userId = '${sessionScope.userId}';
console.log('userId!!' + userId);


function commList(){
var bno = ${Detail.bno};
$.getJSON("commList" + "?bno=" + bno, function(data){
 var str = "";
 
	$(data).each(function(){
  
	  console.log(data);
	  
	  var cdate = new Date(this.cdate);
	  cdate = cdate.toLocaleString("ko-US")
	  
	  str += "<li data-bno='" + this.bno + "' style='margin-top:15px; margin-bottom:15px;'>";
	  str += "<div class='userInfo'>";
	  str += "<span class='userName'>" + this.cid+"\n" + "</span>";
	  str += "<span class='date'>" + cdate + "</span>&nbsp;&nbsp;";
	  if(userId==this.cid){
		   	str +="<button type='button' id='CommdeleteBtn' class='badge badge-pill badge-secondary'  onclick='commDelete("+ this.cno +")'>삭제</button>";
		  }
	  str += "<br/>"
	  str += "<span class='replyContent'>" + this.ctext + "</span>"
	
	  str += "</div>";
	  //str += "</div>";
	  str += "</li>";    
	  //str += "<br/>";
	});
 
 $("section.commList ol").html(str);
});

}

function del(bno){
	var chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href='delete?bno='+bno;
	}
}

$("#CommBtn").click(function(){

	  var bno = $("#bno").val();
	  var cid = $("#cid").val();
	  var ctext = $("#ctext").val();
	  
	  var data = {
	    bno : bno,
	    ctext : ctext,
	    cid : cid
	    };
	  
	  
	  $.ajax({
	   url : "commInsert",
	   type : "post",
	   data : data,
	   success : function(){
	    commList();
	    $("#ctext").val("");
	    alert("등록되었습니다!");
	   }
	  });
	 });
	 function commDelete(cno){
			//var cno = $("#cno").val();
			console.log(cno);
		  var data = {
		    cno : cno,
		    };
		  
		  
		  $.ajax({
		   url : "commDelete",
		   type : "post",
		   data : data,
		   success : function(){
		    commList();
		    alert("삭제되었습니다!");
		   }
		  });
		}
</script>
</html>