<!--  
	1.권한처리 (관리자)
	2.id 값 확인하기
	3.DB연결
	4.select * from koreamember where id=?
	5.화면 UI (회원가입)
	<form action="Ex03_MemberEditok.jsp">
		1.  수정 <input type="" value=
		2.  수정 (x) <td>rs.getString()
	</form> 
	id > input ...
	pwd> rs....
	name> input value ..
	age > input value ..
	email > input value..
	gender > rs...
	
-->
<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
		String sql="select id, pwd, name, age, trim(gender), email from koreamember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, iid);
		rs=pstmt.executeQuery();
		rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기 화면</title>
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
	<!--
	관리자만 
	로직 ....
	 
	사용자 ID 가지고 와서
	기본 정보를 화면 출력
	select id, pwd, name, trim(gender), email from koreamember where id=?
	내용수정 > 수정처리 요청
	
	--요기까지
	
	Ex03_MemberEditOk.jsp?id=kglim&name=홍길동&email=korea;
	update koreamember 
	set name=? , email=?  , age=?....
	where id=? 
	
 -->
	<table style="width: 900px; height: 500px">
		<tr>
			<td colspan="2"><jsp:include page="/Common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/Common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<form action="Ex03_MemberEditok.jsp" method="post">

					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id"
								value="<%= rs.getString(1) %>" readonly></td>
						</tr>
						<tr>
							<td>비번</td>
							<td><%= rs.getString(2) %></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"
								value="<%= rs.getString(3) %>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="text" name="age"
								value="<%= rs.getString(4) %>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
							<input type="radio" name="gender" id="gender" value="여" <%if(rs.getString(5).equals("여")){%> checked <%}%>>여자
							<input type="radio" name="gender" id="gender" value="남" <%if(rs.getString(5).equals("남")){%> checked <%}%>>남자
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email"
								value="<%= rs.getString(6) %>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="수정하기"> <a
								href='Ex03_MemberList.jsp'>리스트이동</a></td>
						</tr>
					</table>

				</form>
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

