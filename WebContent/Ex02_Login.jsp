<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function loginCheck(){
		   document.loginForm.submit();	
		}
	
	</script>
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
			<td style="width: 700px"><form name="loginForm" id="loginForm"
					action="Ex02_loginProcess.jsp" method="post">
					<center>
						<table border="1">
							<tr>
								<th colspan="2">Login PAGE</th>
							<tr>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" id="id"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pass" id="pass"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" id="btnSubmit"
									value="로그인"> <a href="Ex02_JDBC_JOINForm.jsp">회원가입</a></td>
							</tr>
						</table>
					</center>
				</form></td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/Common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>