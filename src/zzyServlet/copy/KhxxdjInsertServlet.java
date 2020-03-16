package zzyServlet.copy;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

import sqlBean.dbConnection;

/**
 * Servlet implementation class KhxxdjInsertServlet
 */
@WebServlet("/KhxxdjInsertServlet")
public class KhxxdjInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhxxdjInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = dbConnection.getConn();
		PreparedStatement pstmt = null;
		// 4.执行SQL语句，返回记录结果
		// 5/执行SQL语句
		String sqdbh = request.getParameter("sqdbh");
		String gzl = request.getParameter("gzl");
		String wtdw = request.getParameter("wtdw");
		String slry = request.getParameter("slry");
		String slzt = request.getParameter("slzt");
		String jylb = request.getParameter("jylb");
		String jymd = request.getParameter("jymd");
		String pjbz = request.getParameter("pjbz");


		String sql = "insert into  khxxdj(sqdbh,gzl,wtdw,slry,slzt,jylb,jymd,pjbz) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sqdbh);
			pstmt.setString(2, gzl);
			pstmt.setString(3, wtdw);
			pstmt.setString(4, slry);
			pstmt.setString(5, slzt);
			pstmt.setString(6, jylb);
			pstmt.setString(7, jymd);
			pstmt.setString(8, pjbz);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("数据库加载失败！");
		}
		response.sendRedirect("zy/AfterInsert1.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
