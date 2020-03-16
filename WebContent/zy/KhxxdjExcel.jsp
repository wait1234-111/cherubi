<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="sqlBean.dbConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Connection conn=dbConnection.getConn();
	Statement stmt=null;
	stmt=conn.createStatement();
	ResultSet rs=null;
	
	String sql="select * from khxxdj where true";
	
	String sqdbh = request.getParameter("sqdbh");
	String gzl = request.getParameter("gzl");
	String wtdw = request.getParameter("wtdw");
	String slry = request.getParameter("slry");
	String slzt = request.getParameter("slzt");
	String jylb = request.getParameter("jylb");
	String jymd = request.getParameter("jymd");
	String pjbz = request.getParameter("pjbz");

	if (sqdbh != null && sqdbh != "")
		sql = sql + " and sqdbh='" + sqdbh + "'";
	if (gzl != null && gzl != "")
		sql = sql + " and gzl='" + gzl + "'";
	if (wtdw != null && wtdw != "")
		sql = sql + " and wtdw='" + wtdw + "'";
	if (slry != null && slry != "")
		sql = sql + " and slry='" + slry + "'";
	if (slzt != null && slzt != "")
		sql = sql + " and slzt='" + slzt + "'";
	if (jylb != null && jylb != "")
		sql = sql + " and jylb='" + jylb + "'";
	if (jymd != null && jymd != "")
		sql = sql + " and jymd='" + jymd + "'";
	if (pjbz != null && pjbz != "")
		sql = sql + " and pjbz='" + pjbz + "'";
	sql = sql + " order by sqdbh";
 	rs=stmt.executeQuery(sql);
 %>
 <center> 
 	<table id="khxxdj" algin="center" border="0" >
  		<h3>防控情况统计表</h3>
 		<tr>
	 		<th>姓名</th>
	 		<th>学号</th>
	 		<th>性别</th>
	 		<th>学院</th>
	  		<th>所在地 </th>
	  		<th>本人疾病情况</th>
	  		<th>上报日期</th>
	  		<th>联系方式</th>
	  	</tr>
	  	
		<%
			 while(rs.next())
 			{
	 			 String x=rs.getString("sqdbh");
		%>
		
		<tr>
			<td><%=x%></td>
			<td><%=rs.getString("gzl")%></td>
			<td><%=rs.getString("wtdw")%></td>
			<td><%=rs.getString("slry")%></td>
			<td><%=rs.getString("slzt")%></td>
			<td><%=rs.getString("jylb")%></td>
			<td><%=rs.getString("jymd")%></td>
			<td><%=rs.getString("pjbz")%></td>

		</tr>
		<% 
			}
		%>
	</table>
<tr><a href=Khxxdj.jsp>取消返回</a></th>
  <th><a id="print">确定导出</a></th></tr>
<hr width="80%" size="2" color="black" align="center">
  版权@西北师范大学张燕
</center>
<script type="application/javascript" src="js/FileSaver.js" ></script>
	<script>
		var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementById("khxxdj").outerHTML + "</body></html>";
		var blob = new Blob
			(
				[html], 
					{
						type: "application/vnd.ms-excel"
					}
			);
		var b = document.getElementById("print");
		b.href = URL.createObjectURL(blob);
		b.download = "防控情况统计表.xls";
	</script>
	</center>
</body>
</html>
