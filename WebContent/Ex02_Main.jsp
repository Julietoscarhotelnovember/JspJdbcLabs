<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원전용페이지</title>
	
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
				<%
					String id=null;
					id=(String)session.getAttribute("userid");
				if(id!=null){
					out.print(id+"회원님 방가요<br>");
					if(id.equals("admin")) {
						out.print("<a href='Ex03_MemberList.jsp'>회원관리</a>");
					}
				} else {
					//접근불가
					//강제로 다른페이지 이동
					out.print("<script>location.href='Ex02_Login.jsp'</script>");
				}
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