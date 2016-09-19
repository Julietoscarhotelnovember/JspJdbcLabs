<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			}else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			}else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			}else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}
			
		});
	});
</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->

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
				<form action="Ex02_JoinOK.jsp" method="post" name="joinForm"
					id="joinForm">
					<center>
						<h3>회원가입</h3>
						<div>
							<table>
								<tr>
									<th>ID:</th>
									<td><input type="text" name="id" id="id"></td>
								</tr>
								<tr>
									<th>PWD:</th>
									<td><input type="password" name="pwd" id="pwd"></td>
								</tr>
								<tr>
									<th>Name:</th>
									<td><input type="text" name="mname" id="mname"></td>
								</tr>
								<tr>
									<th>age:</th>
									<td><input type="text" name="age" id="age" maxlength="3"></td>
								</tr>
								<tr>
									<th>Gender:</th>
									<td><input type="radio" name="gender" id="gender"
										value="여" checked>여자 <input type="radio" name="gender"
										id="gender" value="남">남자</td>
								</tr>
								<tr>
									<th>Email:</th>
									<td><input type="text" name="email" id="email"></td>
								</tr>
								<tr>
									<td colspan="2">
										<!-- <a href="javascript:joinForm.submit();">회원가입하기</a>
										|| <a href="javascript:joinForm.reset();">다시 작성하기</a> --> 
										<input type="submit" value="회원가입">
										<input type="reset" value="취소">
									</td>
								</tr>
							</table>
					</center>
					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/Common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>