<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	//ã������������ �̸� ��������
	String mem_name = request.getParameter("mem_name");
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();  // ���� ��ɹ�
	// DELETE FROM member WHERE mem_id='bbb';
	
	String mem_name2 ="";
	String sql = "SELECT * FROM member WHERE mem_name='" + mem_name +"'";
	rs=stmt.executeQuery(sql);
	
	String mem_id="";
	//DB���� �̸� ��������
		while(rs.next()){
			mem_name2 = rs.getString("mem_name");
			mem_id=rs.getString("mem_id");
		}
		//�Է��� ��й�ȣ�� DB���� ������ ��й�ȣ�� ������ Ȯ��
		if(mem_name2.equals(mem_name)){
			// SELECT mem_id FROM MEMEBER WHERE mem_name='mem_name'
			out.println(mem_name + "���� ���̵�� " + mem_id + "�Դϴ�.");
		}
		else{
			out.println("��ϵ��� ���� ȸ���Դϴ�.");
	%>
			<button onclick='history.back()'>�������� ���ư���</button>
	<%		
			return;
		}
		stmt.close();
		conn.close();
	%>
<form form method="post" action="Login_Client.jsp">
	<p> <input type='submit' value='���� ȭ������'></p>
</form>
</body>
</html>