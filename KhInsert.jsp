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
    
    String xm = request.getParameter("xm");
    String xh = request.getParameter("xh");
    String xb = request.getParameter("xb");
    String xy = request.getParameter("xy");
    String szd = request.getParameter("szd");
    String jbqk = request.getParameter("jbqk");
    String sbrq = request.getParameter("sbrq");
    String lxfs = request.getParameter("lxfs");
    
	String sql = "insert into khxxdj(sqdbh,gzl,wtdw,slry,slzt,jylb,jymd,pjbz) values(?,?,?,?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,xm);
	pstmt.setString(2, xh);
	pstmt.setString(3, xb);
	pstmt.setString(4,xy);
	pstmt.setString(5,szd);
	pstmt.setString(6,jbqk);
	pstmt.setString(7,sbrq);
	pstmt.setString(8,lxfs);
	
	pstmt.execute();

	//6.返回主页面
	response.sendRedirect("AfterInsert.html");
	%>
</body>
</html>