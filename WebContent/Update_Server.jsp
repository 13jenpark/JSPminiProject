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
	//���ǿ��� ���̵� �ҷ�����
	String mem_id = (String) session.getAttribute("mem_id");
	
	//�������������� ���� ��й�ȣ�� ������ ��й�ȣ, �̸� ��������
	String mem_pw = request.getParameter("mem_pw");
	String mem_pw_d = request.getParameter("mem_pw_d");
	String mem_name = request.getParameter("mem_name");
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();  // ���� ��ɹ�
	// DELETE FROM member WHERE mem_id='bbb';
	
	String mem_pw2 ="";
	String sql = "SELECT mem_pw FROM member WHERE mem_id='";
	sql += mem_id +"'";
	rs=stmt.executeQuery(sql);
	
	//DB���� ��й�ȣ ��������
		while(rs.next()){
			mem_pw2 = rs.getString("mem_pw");
		}
		//�Է��� ��й�ȣ�� DB���� ������ ��й�ȣ�� ������ Ȯ��
		if(mem_pw2.equals(mem_pw)){
			sql = "UPDATE MEMBER SET mem_name='" + mem_name + "', mem_pw='" + mem_pw_d+ "' WHERE mem_id='" + mem_id + "'";
			stmt.executeUpdate(sql);
		}
		else{
			out.println("��й�ȣ�� �ٸ��ϴ�.");
	%>
			<button onclick='history.back()'>�������� ���ư���</button>
	<%		
			return;
		}
		stmt.close();
		conn.close();
	%>
<form form method="post" action="Photo_Client.jsp">
	<h1> ȸ������ ���� �Ϸ�</h1>
	<p> <input type='submit' value='���� ȭ������'></p>
</form>
</body>
</html>