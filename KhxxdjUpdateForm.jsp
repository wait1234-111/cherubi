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
<title>Insert title here</title>
</head>
<body>
<% 
	Connection con = dbConnection.getConn();
  	Statement stmt=null;
  	stmt=con.createStatement();
  	String sqdbh=request.getParameter("sqdbh");
  	String sql="select * from khxxdj where sqdbh='"+sqdbh+"'";
  	ResultSet rs=null;
  	rs=stmt.executeQuery(sql);
  	rs.next();
  
 	ResultSet rskh = null;
	Statement stmtkh = null;
	stmtkh = con.createStatement();
	sql = "select * from kh";
	rskh = stmtkh.executeQuery(sql);

%>
<form action="/firstWeb/KhxxdjUpdateServlet">
    <center>
		<table border="0">
			<h3>学生信息修改</h3>
			<hr width="100%" size="1" color="black">
			<form action="KhxxdjUpdate.jsp">
				<input type="hidden" name="sqdbh" value=<%=sqdbh %>><br>
				<tr>
				<td>请输入姓名：</td>
				<td><input type="text" name="sqdbh"></td>
				<td>请输入学号：</td>
				<td><input type="text" name="gzl"></td>
				<td>请输入性别；</td >
				<td><input type="text" name="wtdw""></td>
				<td>请输入学院：</td>
				<td><input type="text" name="slry"></td>
			</tr>
			
			<tr>
				<td>请输入所在地：</td>
				<td><input type="text" name="slzt"></td>
				<td>请输入本人疾病情况：</td>
				<td><select name="jylb"><option value="良好">良好</option>
										<option value="疑似">疑似</option>
										<option value="隔离">隔离</option>
										<option value="确诊">确诊</option>
					</select>
				</td>
				<td>请输入上报日期：</td>
				<td><input type="text" name="jymd"></td>
				<td>请输入联系方式：</td>
				<td><input type="text" name="pjbz"></td>
			</tr>
									
			</form>
     </table>
     <p text-align="center"><input type="submit" value="修改"></p>
</form>
</body>
</html>
