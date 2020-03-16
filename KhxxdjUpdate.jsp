<%@page import="sqlBean.dbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
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
 	PreparedStatement  pstmt = null;
  
  	String sqdbh=request.getParameter("sqdbh");
	String gzl=request.getParameter("gzl");
	String wtdw=request.getParameter("wtdw");
	String slry=request.getParameter("slry");
	String slzt=request.getParameter("slzt");
	String jylb=request.getParameter("jylb");
	String jymd=request.getParameter("jymd");
	String pjbz=request.getParameter("pjbz");


	String sql="update kh set gzl=?,wtdw=?,slry=?,slzt=?,jylb=?,jymd=? pjbz=? where sqdbh=?";
	
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, gzl);
	pstmt.setString(2, wtdw);
	pstmt.setString(3,slry);
	pstmt.setString(4,slzt);
	pstmt.setString(5,jylb);
	pstmt.setString(6,jymd);
	pstmt.setString(7,pjbz);

	pstmt.setString(8,sqdbh);
	pstmt.execute();

	response.sendRedirect("Khxxdj.jsp");
%>

</body>
</html>
