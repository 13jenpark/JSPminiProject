<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name='fileForm' method="post" enctype='multipart/form-data' action="02-03_photo_server.jsp">
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
</body>
</html>