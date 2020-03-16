package zzyServlet.copy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sqlBean.dbConnection;

/**
 * Servlet implementation class KhxxdjUpdateServlet
 */
@WebServlet("/KhxxdjUpdateServlet")
public class KhxxdjUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhxxdjUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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


		String sql = "update khxxdj set gzl=?,wtdw=?,slry=?,slzt=?,jylb=?,jymd=?,pjbz=? where sqdbh=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gzl);
			pstmt.setString(2, wtdw);
			pstmt.setString(3,slry);
			pstmt.setString(4,slzt);
			pstmt.setString(5,jylb);
			pstmt.setString(6,jymd);
			pstmt.setString(7,pjbz);
			pstmt.setString(8,sqdbh);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("数据库更新失败");
		}
		//6.返回主页面
		response.sendRedirect("zy/Khxxdj.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
