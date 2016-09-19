<!--  
	1. 권한검사(session)
	2. id 값 확인하기
	3. DB연결 (select id,pwd,name,age,gender,email 
	          from koreamember where id=""
	4. 결과 UI 구성(Table , div)          
	

-->
<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//권한 처리 코드
	String id=null;
		id=(String)session.getAttribute("userid");
		if(id.equals("admin")){
			//어드민이면 처리하도록
		} else {
			out.print("<script>location.href='Ex02_Login.jsp'</script>");
		}
	//select id, pwd , name , age ,gender , email from koreamember
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String iid=request.getParameter("id");
	try {
		conn=SingletonHelper.getConnection("oracle");
		String sql="select * from koreamember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, iid);
		rs=pstmt.executeQuery();
		rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 상세 페이지</title>
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
				<table border="1">
					<tr>
						<td width="100px">아이디</td>
						<td width="200px"><%= rs.getString(1) %></td>
					</tr>
					<tr>
						<td>비번</td>
						<td><%= rs.getString(2) %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%= rs.getString(3) %></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><%= rs.getInt(4) %></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><%= rs.getString(5) %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%= rs.getString(6) %></td>
					</tr>
					<tr>
						<td colspan="2"><a href='Ex03_MemberList.jsp'>리스트이동</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/Common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	<%

	} catch(Exception e) {
		
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(rs);
	}
	%>
</body>
</html>
<%
	
%>
