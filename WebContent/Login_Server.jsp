<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session Server</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");

	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT mem_pw FROM member WHERE mem_id='";
	sql += mem_id +"'";
	rs=stmt.executeQuery(sql);

	String mem_pass2 ="";
	while(rs.next()){
		mem_pass2 = rs.getString("mem_pw");
		}
	if(mem_pass2.equals(mem_pass)){
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("mem_pass", mem_pass);
		//(�ع���) �ش� �������� �Ѿ���� �ϴ� �ڵ�
		response.sendRedirect("Photo_Client.jsp");
	}
	else{
		out.println("�������� �ʴ� ���̵�ų� ��й�ȣ�� Ʋ�Ƚ��ϴ�.<br>");
	}
	stmt.close();
	conn.close();
%>
<button onclick="location.href='Login_Client.jsp'">�������� ���ư���</button>
</body>
</html>