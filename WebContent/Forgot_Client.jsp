<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
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
	<form method="post" action="Forgot_Server.jsp">
		<h1>아이디 찾기</h1>
		<p> 이름 : <input class="input_login" type="text" name="mem_name">
		<p> <input id="submit_login" type="submit" value="찾기">
	</form>
</div>
</body>
</html>