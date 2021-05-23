<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영상처리</title>
<style>
body{
	background-color: #F5F5F5;
}
h1{
	margin-right: auto;
	margin-left: auto;
}
.container{
	width: 350px;
	height: 450px;
	margin-right:auto;
	margin-left:auto;
	display: flex;
	align-content: center;
	background-color:#FFFFFF;
	border: 1px solid #DBDBDB;
	align-self: center;
}
form{
	margin-right:auto;
	margin-left:auto;
}
img.logo_outstagram{
	
	align-self:center;
	width: 190px;
	margin: 35px 0;	
}
.input_login{
	width: 150px;
	height:40px;
	margin-right: 3px auto;
	padding: 0 10px;
	background-color:#fafafa;
	border:1px solid #DBDBDB;
	font-size:14px;
}

#submit_login{
	width: 270px;
	height: 30px;
	margin-left: 10px;
	background-color: #0095f6;
	border: none;
	border-radius: 3px;
	color: white;
	font-size: 14px;
	font-weight: 600;
}
</style>
</head>
<body>
<div class="container">
	<form name='fileForm' method="post" enctype='multipart/form-data' action="Photo_Server.jsp">
		<h1>영상처리</h1>
		<h6><a href='Delete_Client.jsp'>회원탈퇴</a>
			<a href='Update_Client.jsp'>회원정보 수정</a>
			<a href='LogOut.jsp'>로그아웃</a>
		</h4>
		<%
		String mem_id = (String) session.getAttribute("mem_id");
		out.println(mem_id + "님 환영합니다.");
		%>
		<p> <select name="algo">
			<option value=""> ---select number---</option>
			<option value="1"> 반전처리</option>
			<option value="2"> 밝게하기</option>
			<option value="3"> 어둡게하기</option>
			<option value="4"> x,y축 이동하기</option>
			<option value="5"> 확대하기</option>
			<option value="6"> 축소하기</option>
			<option value="7"> 회전하기</option>
			<option value="8"> 엠보싱</option>
			<option value="9"> 블러링</option>
		</select>
		<p> 파라미터 : <input type="text" value="0" name="para">
		<p> 파일 : <input type='file' name='fileName'>
		<p> <input type="submit" value="처리하기">
	</form>
</div>
</body>
</html>