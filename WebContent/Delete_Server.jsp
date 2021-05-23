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
	String mem_id = (String) session.getAttribute("mem_id");
	String mem_pw = request.getParameter("mem_pw");

	ResultSet rs = null;
	Statement stmt = conn.createStatement();  // 쿼리 명령문
	// DELETE FROM member WHERE mem_id='bbb';
	
	String mem_pw2 ="";
	String sql = "SELECT mem_pw FROM member WHERE mem_id='";
	sql += mem_id +"'";
	rs=stmt.executeQuery(sql);
	
	//DB에서 비밀번호 가져오기
	while(rs.next()){
		mem_pw2 = rs.getString("mem_pw");
	}
	//입력한 비밀번호와 DB에서 가져온 비밀번호가 같은지 확인
	if(mem_pw2.equals(mem_pw)){
		sql = "DELETE FROM MEMBER WHERE mem_id='" + mem_id +"'";
		stmt.executeUpdate(sql);
	}
	else{
		out.println("비밀번호가 다릅니다.");
%>
		<button onclick='history.back()'>이전으로 돌아가기</button>
<%		
		return;
	}
	stmt.close();
	conn.close();
%>
<form form method="post" action="Login_Client.jsp">
	<h1> 회원탈퇴 완료<br>이제까지 사용해주셔서 감사합니다.</h1>
	<p> <input type='submit' value='메인화면으로'></p>
</form>
</body>
</html>