<%@page import="java.io.IOException"%>
<%@page import="kr.or.kosta.utils.ConnectionHelper"%>
<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!--  
	1.권한검사
	2.id 확인( request.get...)
	3.삭제(DB) ->delete from koreamember where id=""
	4.삭제 정상 (회원목록 이동)

-->    
<%
   //권한처리코드
	String id=null;
		id=(String)session.getAttribute("userid");
		if(id.equals("admin")){
			out.print("<script>alert('해당 사용자가 삭제됩니다')</script>");
		} else {
			out.print("<script>location.href='Ex02_Login.jsp'</script>");
		}
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	String iid=request.getParameter("id");
	try {
		conn=SingletonHelper.getConnection("oracle");
		String sql="delete from koreamember where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, iid);
		pstmt.executeQuery();
		out.print("<script>alert('삭제되었습니다.')</script>");
		out.print("<script>location.href='Ex03_MemberList.jsp'</script>");
	} catch(Exception e) {
		
	} finally {
		ConnectionHelper.close(pstmt);
	}
    
%>
 
 