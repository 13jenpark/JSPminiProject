<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% 
	Connection conn =null; //jsp와 db를 연결하는 교량 역할
	
	String url = "jdbc:mysql://localhost:3306/PHOTO_DB";
	String user = "root";
	String password = "1234";
	
	Class.forName("com.mysql.jdbc.Driver"); //mysql~~~.jar file
	
	conn = DriverManager.getConnection(url, user, password);
	
	//out.println("pass~");
%>