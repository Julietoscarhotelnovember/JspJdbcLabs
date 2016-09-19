<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
데이터 받아서 
DB연결
insert
 
성공하면 > 페이지 이동 > 로그인 페이지 이동 (Ex02_Login.jsp)
실패하면 > 경고창 (가입실패).. 회원가입 이동 
-->
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pwd");
	String name=request.getParameter("mname");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	//out.print(id+pass+name+age+gender+email);
%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn=null;
PreparedStatement pstmt=null;

try {
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kglim","1004");
	String sql="insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);

	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setInt(4, age);
	pstmt.setString(5, gender);
	pstmt.setString(6, email);
	pstmt.setString(7, request.getRemoteAddr());
	
	int result=pstmt.executeUpdate();
	if(result!=0) {
		out.print("<script>");
		out.print("location.href='Ex02_Login.jsp'");
		out.print("</script>");
	} else {
		/* out.print("<script>");
		out.print("alert('가입 실패')");
		out.print("</script>"); */
	}
} catch(Exception e) {
	//int result=pstmt.executeUpdate(); 여기에서 예외가 발생되어 if문을 타지 않기 때문에 여기에 예외처리
	e.printStackTrace();
	out.print("<script>");
	out.print("alert('가입실패');");
	out.print("location.href='Ex02_JDBC_JOINForm.jsp'");
	out.print("</script>");
} finally {
	if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
	if(conn!=null) try{conn.close();} catch(Exception e){}
}

%>
</body>
</html>