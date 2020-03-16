package zzyServlet.copy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sqlBean.dbConnection;

/**
 * Servlet implementation class KhxxdjDeleteServlet
 */
@WebServlet("/KhxxdjDeleteServlet")
public class KhxxdjDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhxxdjDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = dbConnection.getConn();
		 Statement stmt=null;
		  try
		  {
			  stmt=con.createStatement();
			  String sql="delete from khxxdj where sqdbh='"+request.getParameter("sqdbh")+"'";
			  stmt.executeUpdate(sql);

		  }
		  catch(Exception e)
		  {
			  System.out.println("Êý¾Ý¿âÉ¾³ýÊ§°Ü£¡");
		  }
		  
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
