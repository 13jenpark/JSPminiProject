<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ����������</title>
<script>
function loginchk() {
    var regx = /^[a-zA-Z0-9]*$/;
    
    var id = document.getElementById("mem_id").value;
    var pw = document.getElementById("mem_pass").value;
    var name = document.getElementById("mem_name").value;
    
    if(id.length == 0 || id == null) {
       alert("���̵� �Է����ּ���.");
       return false;
    }
    if(pw.length == 0 || pw == null) {
       alert("��й�ȣ�� �Է����ּ���.");
       return false;
    }
    if(name.length == 0 || name == null) {
        alert("�̸��� �Է����ּ���.");
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
	<form method="post" action="Update_Server.jsp" onsubmit="return loginchk()">
		<h1>ȸ����������</h1>
		<p> <%
		String mem_id = (String) session.getAttribute("mem_id");
		out.println(mem_id + "�� ȸ������ ����");
		%>
		<p> ���� ��й�ȣ : <input class="input_login" type="text" name="mem_pw">
		<p> ���� �� ��й�ȣ : <input class="input_login" type="text" name="mem_pw_d">
		<p> NAME : <input class="input_login" type="text" name="mem_name">
		<p> <input id="submit_login" type="submit" value="����">
	</form>
</div>
</body>
</html>