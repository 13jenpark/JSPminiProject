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
		<option value="1"> 반전처리</option>
		<option value="2"> 밝게하기</option>
		<option value="3"> 어둡게하기</option>
		<option value="4"> x,y축 이동하기</option>
		<option value="5"> 확대하기</option>
		<option value="6"> 축소하기</option>
		<option value="7"> 회전하기</option>
		<option value="8"> 엠보싱</option>
		<option value="9"> 블러링</option>
	</select>
	<p> 파라미터 : <input type="text" value="0" name="para">
	<p> 파일 : <input type='file' name='fileName'>
	<p> <input type="submit" value="처리하기">
</form>
</body>
</html>