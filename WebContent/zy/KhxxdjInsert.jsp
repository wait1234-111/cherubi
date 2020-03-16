<%@page import="sqlBean.dbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
		PreparedStatement pstmt = null;

		String sqdbh = request.getParameter("sqdbh");
		String gzl = request.getParameter("gzl");
		String wtdw = request.getParameter("wtdw");
		String slry = request.getParameter("slry");
		String slzt = request.getParameter("slzt");
		String jylb = request.getParameter("jylb");
		String jymd = request.getParameter("jymd");
		String pjbz = request.getParameter("pjbz");

		
		String sql = "insert into  khxxdj(sqdbh,gzl,wtdw,slry,slzt,jylb,jymd,pjbz) values(?,?,?,?,?,?,?,?,?,)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sqdbh);
		pstmt.setString(2, gzl);
		pstmt.setString(3, wtdw);
		pstmt.setString(4, slry);
		pstmt.setString(5, slzt);
		pstmt.setString(6, jylb);
		pstmt.setString(7, jymd);
		pstmt.setString(8, pjbz);

		pstmt.execute();
		
		response.sendRedirect("Khxxdj.jsp");
	%>
</body>
</html>