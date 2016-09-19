<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>
</head>
<body>
	<a href="Ex02_Main.jsp">Intro</a>&nbsp;&nbsp;&nbsp;||
 	<a href="Ex02_Login.jsp">Login</a>&nbsp;&nbsp;&nbsp;||
 	<a href="Ex02_JDBC_JOINForm.jsp">NewMember</a>&nbsp;&nbsp;&nbsp;||
 	<a href="#">After</a>&nbsp;&nbsp;&nbsp;||
 	<a href="#">After</a>||
 	<%
 		if(session.getAttribute("userid") != null){
 			out.print("<b>[" + session.getAttribute("userid") + "]</b>님 로그인 상태"); 
 			out.print("<a href='Ex02_logout.jsp'>[[로그아웃하기]]</a>");
 		}else{
 			out.print("<b>[로그인하지 않으셨네요]</b>");
 			out.print("<a href='Ex02_Login.jsp'>[[로그인하기]]</a>");
 		}
 	%>
</body>
</html>