<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ó��</title>
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
		<h1>����ó��</h1>
		<h6><a href='Delete_Client.jsp'>ȸ��Ż��</a>
			<a href='Update_Client.jsp'>ȸ������ ����</a>
			<a href='LogOut.jsp'>�α׾ƿ�</a>
		</h4>
		<%
		String mem_id = (String) session.getAttribute("mem_id");
		out.println(mem_id + "�� ȯ���մϴ�.");
		%>
		<p> <select name="algo">
			<option value=""> ---select number---</option>
			<option value="1"> ����ó��</option>
			<option value="2"> ����ϱ�</option>
			<option value="3"> ��Ӱ��ϱ�</option>
			<option value="4"> x,y�� �̵��ϱ�</option>
			<option value="5"> Ȯ���ϱ�</option>
			<option value="6"> ����ϱ�</option>
			<option value="7"> ȸ���ϱ�</option>
			<option value="8"> ������</option>
			<option value="9"> ����</option>
		</select>
		<p> �Ķ���� : <input type="text" value="0" name="para">
		<p> ���� : <input type='file' name='fileName'>
		<p> <input type="submit" value="ó���ϱ�">
	</form>
</div>
</body>
</html>