<!--  
	1.권한처리
	2.데이터 받기 
	3.DB연결
	4.update koatamember
	  set name=? , age=? , email=?
	  where id=?
	5.완료 되면 Ex03_MemberList.jsp
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

	//한글처리
	request.setCharacterEncoding("UTF-8");

	//권한처리
	String id=null;
		id=(String)session.getAttribute("userid");
		if(id.equals("admin")){
			//어드민이면 처리하도록
		} else {
			out.print("<script>location.href='Ex02_Login.jsp'</script>");
		}

	
	//데이터 받기
	//id , name, age ,email
	String iid=request.getParameter("id");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String email=request.getParameter("email");
	String gender=request.getParameter("gender");
	
	//update koreamember
	//set name = ? , age = ? , email = ?
	//where id =?
	Connection conn=null;
	PreparedStatement pstmt=null;
	try {
		conn=SingletonHelper.getConnection("oracle");
		String sql="update koreamember set name=?, age=?, gender=?, email=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, gender);
		pstmt.setString(4, email);
		pstmt.setString(5, iid);
		pstmt.executeQuery();
		out.print("<script>alert('수정되었습니다.');</script>");
		out.print("<script>location.href='Ex03_MemberList.jsp';</script>");
	} catch(Exception e) {
		
	} finally {
		ConnectionHelper.close(pstmt);
	}
 
%>
 

 
 