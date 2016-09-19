<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {width: 400px;}
	table, th , tr , td{border: 1px solid blue; border-collapse: collapse;}
</style>
</head>
<body>
<!--  
	1.JDBC 드라이버 참조(Oracle, Mysql, Ms-sql)
    Web project > WEB-INF > lib > 폴더 붙여넣기
    2.JDBC 드라이버 로딩(class.forname("드라이버 클래스명")
    3.DB연결 (연결문자열 : IP, PORT , 계정, 비번.....)
    
    //JAVA API사용
    4. 연결 객체 생성(Connection)
    5. 명령 객체 생성(insert , update ,delete , select)
    6. 명령 실행(select > ResultSet : DML)
    7. 명령 처리(ResultSet  : 결과 행(DML))
    8. 자원해제(close())
-->
<table>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>급여</th>
		<th>직종</th>
	</tr>
	<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kglim","1004");
		//out.print(conn.isClosed());
		stmt=conn.createStatement();
		String sql="select empno, ename, sal, job from emp";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
	%>
		<tr>
			<td><%= rs.getInt(1) %></td>
			<td><%= rs.getString("ename") %></td>
			<td><%= rs.getInt(3) %></td>
			<td><%= rs.getString("job") %></td>
		</tr>
	<%
		}
		
		if(stmt!=null) try{stmt.close();} catch(Exception e){}
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(conn!=null) try{conn.close();} catch(Exception e){}		
	%>

</table>
 
 
</body>
</html>