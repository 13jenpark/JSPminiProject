<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Page</title>
<script>
function loginchk() {
    var regx = /^[a-zA-Z0-9]*$/;
    
    var id = document.getElementById("mem_id").value;
    var pw = document.getElementById("mem_pass").value;
    
    if(id.length == 0 || id == null) {
       alert("���̵� �Է����ּ���.");
       return false;
    }
    if(pw.length == 0 || pw == null) {
       alert("��й�ȣ�� �Է����ּ���.");
       return false;
    }
    if (!regx.test(id)){
       alert("���̵�� ����, ���ڸ� �Է°����մϴ�.");
       return false;
    }
    document.form.submit();
 }
 </script>
<style>
body{
	background-color: #F5F5F5;
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
.input_login{
	width: 270px;
	height:40px;
	margin: 3px auto;
	padding: 0 10px;
	display: block;
	background-color:#fafafa;
	border:1px solid #DBDBDB;
	font-size:14px;
}

#submit_login{
	width: 295px;
	height: 30px;
	margin: 13px auto;
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
	<form class="login_frm" method="post" action="Login_Server.jsp" onsubmit="return loginchk()" name="userInfo">
		<h1> �α��� ȭ�� </h1>
		<p> <input  class="input_login" type="text" id="mem_id" name="mem_id" placeholder="ID">
		<p> <input class="input_login" type="password" id="mem_pass" name="mem_pass" placeholder="Password">
		<p> <input id="submit_login" type="submit" value="�α���">
		<p><a href='SignUp_Client.jsp'>ȸ���� �ƴϽŰ���?</a>
		<p><a href='Forgot_Client.jsp'>���̵� �ؾ�����̳���?</a>
	</form>
</div>
</body>
</html>
