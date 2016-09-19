<!--  
	ui 구성 > Ex03_MemberList.jsp
	select * from koreamember where name like..
	

-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainIntro</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}
 
tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}
 
td {
	border: solid 1px red;
}
</style>
</head>
<%
	//1.검색할 사람의 이름을 받아오자
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("search");
	//out.print(name);
	//2.유효성 체크
	// if (name == null || name.trim().equals("")) {
	//	response.sendRedirect("Ex03_MemberList.jsp");
	//	return;
		
		
 
	//} 
	
 
	//3.db연결하여 select문을 db에 전송
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:XE", "kosta", "1004");
	
	String sql = "select count(*) from koreamember where name like ?";
		
	String sql2 = "select id,name,email from koreamember where name like'%" + name + "%'";
 
	/*  
	
			String sql = "SELECT * FROM dept WHERE dname LIKE ?";
			// SELECT * FROM dept WHERE dname LIKE '%A%'
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + deptName + "%"); //point
	
	*/
	
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, "%" + name + "%");		
	ResultSet rs = ps.executeQuery();
	//4. 그 결과를 받아와서 테이블 형태로 보여주기
	rs.next();
	int count = rs.getInt(1);
%>
<body>
	<table style="width: 900px; height: 500px">
		<tr>
			<td colspan="2"><jsp:include page="/Common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/Common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<div align=center>
 
					<table width=500 border=1>
						<tr bgcolor="gold">
							<th width=30%>아이디</th>
							<th width=30%>이름</th>
							<th width=40%>이메일</th>
						</tr>
						<%
							if (count > 0) {
								ps = con.prepareStatement(sql2);
								rs = ps.executeQuery();
								while (rs.next()) {
									String id = rs.getString(1);
									String mname = rs.getString(2);
									String email = rs.getString(3);
						%>
						<tr>
							<td><%=id%></td>
							<td><%=mname%></td>
							<td><%=email%></td>
 
						</tr>
						<%
							}//end while
								out.println("<tr><td colspan=3>");
								out.println("<b>" + name + "님은 총" + count + "명입니다.</b>");
								out.println("</td></tr>");
 
							} else {
 
								out.println("<tr><td colspan=3>");
								out.println("<b>" + name + "님 정보는 없습니다.</b>");
								out.println("</td></tr>");
 
							}//end if
						%>
					</table>
					<a href="Ex03_MemberList.jsp">회원리스트</a>
				</div> <%
 	//5. 연결된 자원 반납
 	if (rs != null)
 		rs.close();
 	if (ps != null)
 		ps.close();
 	if (con != null)
 		con.close();
 %>
 
			</td>
		</tr>
 
		<tr>
			<td colspan="2"><jsp:include page="/Common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
 
</body>
</html>