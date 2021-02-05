<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
   h2{
      text-align: center;
      }
   table{
      width: 100%;
      }
   #outter{
      display: block;
      width: 60%;
      margin:auto;
       }
   </style>
   
<body>
   <br>
   <br>
   <div id="outter">
    <form name="swrite" method="post" action="SangpumInsert" enctype="multipart/form-data">
          <div>
          <select class="custom-select" name="sb" style="width:110px;height:40px;">
      <option value="팝니다">팝니다</option>
      <option value="삽니다">삽니다</option>
      </select>
      </div>
      <br>
      <div>
      제목<input name="title" id="title" size="80" placeholder="글 제목 입력" class="form-control-plaintext">
      </div>
      <br>
        <div style="width:950px">내용<textarea name="content" id="content" rows="8" cols="80" placeholder="글 내용 입력" class="form-control-plaintext"></textarea></div>
        <input type="hidden" name="id" value="${sessionScope.userId }">
        <div style="width:950px; text-align:center;">        
        <div class ="inputArea">
        <label for="gdsImg">이미지</label>
        <input type="file" id="gdsImg" name="file"/>
        <div class="select_img"><img src=""/>
              <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
        </div>
        

</div>
        
        </div>
            <input type="submit" value="확인" class="btn btn-primary">
           </form>
        </div>
       
</body>
</html>