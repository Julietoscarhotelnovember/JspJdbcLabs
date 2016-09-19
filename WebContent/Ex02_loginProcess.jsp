<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<!-- 
	1.한글처리
	2.데이터받기
	3.DB연동
	4.로직처리
		-ID(0) pwd(0) > Ex02_Main.jsp
		-ID(0) pwd(X) > Ex02_Login.jsp
		-ID(X) > Ex02_JDBC_JOINForm.jsp		
 -->
<%
//1.한글처리
request.setCharacterEncoding("UTF-8");

//2.데이터 받기
String id=request.getParameter("id");
String pwd=request.getParameter("pass");

//3.DB연동
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs=null;

try {

	conn = SingletonHelper.getConnection("oracle");
	String sql = "select id, pwd from koreamember where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	
	//id 있는 경우
	while(rs.next()) {
		if(pwd.equals(rs.getString("pwd"))) {
			session.setAttribute("userid", rs.getString("id"));
			out.print("<script>");
				out.print("location.href='Ex02_Main.jsp'");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("location.href='Ex02_Login.jsp'");
			out.print("</script>");
		}
	}
	
	//id 없는 경우
	out.print("<script>");
	out.print("location.href='Ex02_JDBC_JOINForm.jsp'");
	out.print("</script>");
		
} catch (Exception e) {
	
} finally {
	ConnectionHelper.close(pstmt);
	ConnectionHelper.close(rs);
}

%>
</body>
</html>	






