<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String mem_name = request.getParameter("mem_name");
	
	Statement stmt = conn.createStatement();  // ���� ��ɹ�
	String sql = "INSERT INTO MEMBER(mem_id, mem_pw, mem_name) VALUES ('" + mem_id + "', '" + mem_pw + "', '" + mem_name + "')";
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	out.println("ȸ������ �Ϸ�");
%>
<form form method="post" action="Login_Client.jsp">
	<p> <input type='submit' value='����ȭ������'></p>
</form>
</html>