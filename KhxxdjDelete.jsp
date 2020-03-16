<%@page import="sqlBean.dbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = dbConnection.getConn();
		Statement stmt = null;
		stmt = con.createStatement();
	
		String sql="delete from khxxdj  where sqdbh='"+request.getParameter("sqdbh")+"'";
		stmt.executeUpdate(sql);
		
		response.sendRedirect("Khxxdj.jsp");
	%>
</body>
</html>