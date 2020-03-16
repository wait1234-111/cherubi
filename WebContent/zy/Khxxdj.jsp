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
<title>疫情防控填报统计管理</title>
 版权@西北师范大学张燕
</head>
<body>
<%
		int iPage = 1;
		int recordCount = 3;
		int recordTotal = 0;
		int pageCount = 0;
	
		Connection con = dbConnection.getConn();
		Statement stmt = null;
		stmt = con.createStatement();
		
		ResultSet rs = null;
		String sql="";
		
		sql = "select count(*) total from khxxdj";
	    rs = stmt.executeQuery(sql);
		rs.next();
		recordTotal = rs.getInt("total");

		
		//求总页数
		if(recordTotal%recordCount==0)
		{
			pageCount = recordTotal/recordCount;
		}
		else{
			pageCount = recordTotal/recordCount+1;
		}
		//System.out.println(pageCount);
		
		if(request.getParameter("page")!=null&&request.getParameter("page")!="")
		{
			try
			{
				iPage = Integer.parseInt(request.getParameter("page"));//这里只能转换数值型字符串，字母会报异常
			}
			catch(Exception e)
			{
				iPage = 1;	//如果输入页码不为数字就总是定义在第一页
			}
		}
		if(iPage<1)
		{
			iPage = 1;//防止用户输入非法字符
		}
		if(iPage>pageCount)
		{
			iPage = pageCount;//输入页码为10，就定位到末页
		}
		System.out.println(iPage);
		
		sql="select * from khxxdj where true";
		
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
		rs = stmt.executeQuery(sql);
		
		ResultSet rskh = null;
		Statement stmtkh = null;
		stmtkh = con.createStatement();
		sql = "select * from kh";
		rskh = stmtkh.executeQuery(sql); 
%>
<center>
	<table border="0">
		<h3>疫情防控填报管理</h3>
		<hr width="100%" size="1" color="black">
		<form action="/firstWeb/KhxxdjInsertServlet">
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="sqdbh"></td>
				<td>学号：</td>
				<td><input type="text" name="gzl"></td>
				<td>性别；</td >
				<td><input type="text" name="wtdw""></td>
				<td>学院：</td>
				<td><input type="text" name="slry"></td>
			</tr>
			
			<tr>
				<td>所在地：</td>
				<td><input type="text" name="slzt"></td>
				<td>本人疾病情况：</td>
				<td><select name="jylb"><option value="良好">良好</option>
										<option value="疑似">疑似</option>
										<option value="隔离">隔离</option>
										<option value="确诊">确诊</option>
					</select>
				</td>
				<td>上报日期：</td>
				<td><input type="text" name="jymd"></td>
				<td>联系方式：</td>
				<td><input type="text" name="pjbz"></td>
			</tr>
			<table>
				<tr>
					<td><input type="submit" value="增加"></td>
				</tr>
			</table>
		</form>
			
		<tr>
			<table border="1">
			<h3>疫情防控填报统计</h3>
			<hr width="500%" size="1" color="black">
			<form action="Khxxdj.jsp">
				姓名查找:<input type="text" name="sqdbh">
				学院查找:<input type="text" name="slry">
				地址查找:<input type="text" name="pjbz">
				  <p text-align="center"><input type="submit" value="查询"></p>
			</form>
		</tr>
		
		<table border="2">
			<hr width="200%" size="2" color="black">
			
			<tr>
				<th>姓名</th>
				<th>学号</th>
				<th>性别</th>
				<th>学院</th>
				<th>所在地</th>
				<th>本人疾病情况</th>
				<th>上报日期</th>
				<th>联系方式</th>

			</tr>

			<%
				rs.absolute((iPage - 1) * recordCount + 1);//定位页面
				for (int i = 1; i <= recordCount; i++)
				{
					String x = rs.getString("sqdbh");
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
				<td><a href=/firstWeb/KhxxdjDeleteServlet?sqdbh=<%=x%>>删除</a></td>
				<td><a href=KhxxdjUpdateForm.jsp?sqdbh=<%=x%>>修改</a></td>
			</tr>
				
			<%
					if (!rs.next())
						break;
				}
			%>
				
			</table>
					
			<p><a href=KhxxdjExcel.jsp>确认导出</a></p>
		
			<form action="Khxxdj.jsp">
				<a href=Khxxdj.jsp?page=1>首页</a> 
				<a href=Khxxdj.jsp?page=<%=iPage-1%>>上一页</a> 
				<a href=Khxxdj.jsp?page=<%=iPage+1%>>下一页</a>
				<a href=Khxxdj.jsp?page=<%=pageCount%>>末页</a><br> 
				请输入页码:<input type="text" size="10" name="page"> 
				<input type="submit" value="go">
			</form>
		</table>
	</center>
</body>

<script>
	function check(form) {
		alert("数据导入成功！")
	}
</script>

</html>
