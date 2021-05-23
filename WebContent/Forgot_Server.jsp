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
	//찾기페이지에서 이름 가져오기
	String mem_name = request.getParameter("mem_name");
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();  // 쿼리 명령문
	// DELETE FROM member WHERE mem_id='bbb';
	
	String mem_name2 ="";
	String sql = "SELECT * FROM member WHERE mem_name='" + mem_name +"'";
	rs=stmt.executeQuery(sql);
	
	String mem_id="";
	//DB에서 이름 가져오기
		while(rs.next()){
			mem_name2 = rs.getString("mem_name");
			mem_id=rs.getString("mem_id");
		}
		//입력한 비밀번호와 DB에서 가져온 비밀번호가 같은지 확인
		if(mem_name2.equals(mem_name)){
			// SELECT mem_id FROM MEMEBER WHERE mem_name='mem_name'
			out.println(mem_name + "님의 아이디는 " + mem_id + "입니다.");
		}
		else{
			out.println("등록되지 않음 회원입니다.");
	%>
			<button onclick='history.back()'>이전으로 돌아가기</button>
	<%		
			return;
		}
		stmt.close();
		conn.close();
	%>
<form form method="post" action="Login_Client.jsp">
	<p> <input type='submit' value='메인 화면으로'></p>
</form>
</body>
</html>