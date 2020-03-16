<%@page import="sqlBean.dbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生疫情上报</title>
</head>
<body>
<%
		Connection con = dbConnection.getConn();
		Statement stmt = null;
		stmt = con.createStatement();
		//5.执行sql语句，返回记录信息
		ResultSet rs = null;
		String sql="";
		
		//求总记录数
		sql = "select count(*) total from kh";
	    rs = stmt.executeQuery(sql);
		rs.next();
		
		
		sql="select * from kh where true";
		String xh = request.getParameter("xh");
		String xm = request.getParameter("xm");
		String xb = request.getParameter("xb");
		String xy = request.getParameter("xy");
		String szd = request.getParameter("szd");
		String jbqk = request.getParameter("jbqk");
		String sbrq = request.getParameter("sbrq");
		String lxfs = request.getParameter("lxfs");
		if(xh!=null&&xh!="")
			sql = sql+" and xh='"+xh+"'";
		if(xm!=null&&xm!="")
			sql = sql+" and xm='"+xm+"'";
		if(xb!=null&&xb!="")
			sql = sql+" and xb='"+xb+"'";
		if(xy!=null&&xy!="")
			sql = sql+" and xy='"+xy+"'";
		if(szd!=null&&szd!="")
			sql = sql+" and szd='"+szd+"'";
		if(jbqk!=null&&jbqk!="")
			sql = sql+" and jbqk='"+jbqk+"'";
		if(sbrq!=null&&sbrq!="")
			sql = sql+" and sbrq='"+sbrq+"'";
		if(lxfs!=null&&lxfs!="")
			sql = sql+" and lxfs='"+lxfs+"'";
		sql = sql+" order by xh";		
		System.out.println(sql);
	
		//遍历rs,在页面中输入结果
		ResultSet rskh = null;
		Statement stmtkh = null;
		stmtkh = con.createStatement();
		sql = "select * from kh";
		rskh = stmtkh.executeQuery(sql); 
%>
<center>
	<table border="0">
		<h3>学生疫情每日上报表</h3>
		<hr width="100%" size="3" color="red">
		<form action="/firstWeb/KhInsertServlet">
			<tr>
				<td>姓名：</td><td><input type="text"  name="xm"></td>
			</tr>
			<tr>
				<td>学号：</td><td><input type="text"  name="xh"></td>
				</tr>
			<tr>
				<td>性别：</td><td><input type="text"  name="xb"></td>
				</tr>
			<tr>
				<td>学院：</td><td><input type="text"  name="xy"></td>
			</tr>
			
			<tr>
			    <td>所在地：</td><td><input type="text"  name="szd"></td>
			</tr>
			<tr>
				<td>本人疾病情况:</td><td><input type="text"  name="jbqk"></td>
			</tr>
			<tr>				
				<td>上报日期：</td><td><input type="text"  name="sbrq"></td>
			</tr>
			<tr>
				<td>联系方式：</td><td><input type="text"  name="lxfs"></td>				
			</tr>
			<table>
				<tr>
					<input type="submit" value="提交">	
				</tr>	
			</table>	
		</form>		
</center>
<center>
 版权@西北师范大学张燕
 </center>
</body>
</html>