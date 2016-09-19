<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="java.io.IOException"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<!--  
	회원목록을 출력하는 페이지
	1.관리자만 접근 가능 (관리자 : 로그인한 id > admin)
	2.로그인한 회원 또는 비회원은 이 페이지에 접근 불가  > 로그인 페이지로
    3.select id, ip from koreamember (Table 형태로 출력하세요)
    
   

-->
<%
	//회원목록(관리자 접근 가능)
	//로그인한 ID > admin
	//String AdminID=null;
if(session.getAttribute("userid")==null
||!session.getAttribute("userid").equals("admin")) {
	//강제로 다른 페이지 이동
	//코드가 모든페이지에서 반복되면 include를 통해 sessionCheck.jsp 하는 것이 좋다
	out.print("<script>location.href='Ex02_Login.jsp'</script>");
}
%>


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
						<!-- UI 구성하는 곳 -->
						<%
							//관리자라면
							//목록 출력
							//select id , ip from koreamember;
							Connection conn=null;
							PreparedStatement pstmt=null;
							ResultSet rs=null;
							try {
								conn=SingletonHelper.getConnection("oracle");
								String sql="select id, ip from koreamember";
								pstmt=conn.prepareStatement(sql);
								rs=pstmt.executeQuery();
						%>
					
							<table border="1" >
								<tr><th colspan="4">회원리스트</th></tr>
								<% while(rs.next()) { %>
									<tr>
										<td width="100px">
											<a href="Ex03_MemberInfo.jsp?id=<%= rs.getString(1) %>"><%= rs.getString(1) %></a>											
										</td>
										<td width="100px">
											<%= rs.getString(2) %>
										</td>
										<td width="100px">
											<!-- 삭제 -->
											<a href="Ex03_MemberDelete.jsp?id=<%= rs.getString(1) %>">삭제하기</a>
										</td>
										<td width="100px">
											<!-- 수정 -->
											<a href="Ex03_MemberEdit.jsp?id=<%= rs.getString(1) %>">수정하기</a>
										</td>
									</tr>
								<% } %>
								
						</table>
						<hr>
						<form action="Ex03_MemberSearch.jsp" method="post">
							회원명 : <input type="text" name="search">
								   <input type="submit" value="회원검색">
						</form>
						<%	 	
							} catch(Exception e) {
								
							} finally {
								ConnectionHelper.close(pstmt);
								ConnectionHelper.close(rs);
							}
						%> 
				   	 
				<!-- UI 구성하는 곳 -->
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/Common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>