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
 * Servlet implementation class KhInsertServlet
 */
@WebServlet("/KhInsertServlet")
public class KhInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = dbConnection.getConn();
	    PreparedStatement pstmt = null;
		
	    String xm = request.getParameter("xm");
		String xh = request.getParameter("xh");
		String xb   = request.getParameter("xb");
		String xy  = request.getParameter("xy");
		String szd  = request.getParameter("szd");
		String jbqk= request.getParameter("jbqk");
		String sbrq= request.getParameter("sbrq");
		String lxfs   = request.getParameter("lxfs");
		
		String sql = "insert into khxxdj(sqdbh,gzl,wtdw,slry,slzt,jylb,jymd,pjbz) values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, xm);
			pstmt.setString(2, xh);
			pstmt.setString(3,xb);
			pstmt.setString(4,xy);
			pstmt.setString(5,szd);
			pstmt.setString(6,jbqk);
			pstmt.setString(7,sbrq);
			pstmt.setString(8,lxfs);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Êý¾Ý¿âÖ´ÐÐÊ§°Ü!");
		}
		
		response.sendRedirect("zy/AfterInsert.html");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
