package kr.or.kosta.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
//반복되는 코드 (드라이버 로딩 , 연결객체 , 명령객체)
 
//만약에 oracle 또는 mysql 을 둘다 연동하고 싶다면
//전체  APP 연결부분 담당 클래스
 
//개선 (반복코드 줄인다)
//개선 (메모리 어차피 같은 것 ( 하나의 메모리로 : 강제 > singleton)
//함수 > static > overloading > 다형성
public class ConnectionHelper {
     //기능 (함수 : public , static)
	 public static Connection getConnection(String dsn){
		 Connection conn = null;
		 try {
			 	if(dsn.equals("mysql"))
			 	{
			 		Class.forName("com.mysql.jdbc.Driver");
			 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kostadb", "kosta", "1004");
			 	
			 	}else if(dsn.equals("oracle")){
			 		
			 		Class.forName("oracle.jdbc.OracleDriver");
				 	conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kglim", "1004");
			 	}	
			 	
				
		 } catch (Exception e) {
			e.printStackTrace();
		}finally{
			return conn;
		}
		 
	 }
	
	 public static Connection getConnection(String dsn, String uid, String pwd){
		 Connection conn = null;
		 try {
			 	if(dsn.equals("mysql"))
			 	{
			 		Class.forName("com.mysql.jdbc.Driver");
			 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kostadb",uid, pwd);
			 	
			 	}else if(dsn.equals("oracle")){
			 		
			 		Class.forName("oracle.jdbc.OracleDriver");
				 	conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", uid, pwd);
			 	}	
			 	
				
		 } catch (Exception e) {
			e.printStackTrace();
		}finally{
			return conn;
		}
	 }
 
	 //기능(자원 해제)
	 public static void close(Connection conn){
		 if(conn != null){
			 try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		 }
	 }
 
	 public static void close(Statement stmt){
		 if(stmt != null){
			 try {
				 stmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		 }
	 }
	 
	 public static void close(ResultSet rs){
		 if(rs != null){
			 try {
				 rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		 }
	 }
	 public static void close(PreparedStatement pstmt){
		 if(pstmt != null){
			 try {
				 pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		 }
	 }
}
 
 
 
 