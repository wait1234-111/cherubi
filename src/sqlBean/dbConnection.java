package sqlBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbConnection {
	public static Connection con = null;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//1.查找mysql的驱动程序，解压connector后会有com文件夹
		} catch (Exception e) {
			System.out.println("驱动程序不存在！");
		}
		try {
			//2.定义连接数据库的参数
			String user = "root";
			String password = "mysql";//没有设置密码为空
			String url = "jdbc:mysql://localhost:3306/zy?useUnicode=true&characterEncoding=utf-8";//kh_db为你要连接的数据库的名称
			//3.建立连接
			con = DriverManager.getConnection(url, user, password);//三个参数顺序为：连接的地址，用户名，密码
		} catch (Exception e) {
			System.out.println("数据库连接失败");
		}
		return con;
	
	}
//	public ResultSet Search(String sql, String str[]) {
//		getConn();
//		ResultSet rs = null;
//		try {
//			PreparedStatement pst = con.prepareStatement(sql);
//			if (str != null) {
//				for (int i = 0; i < str.length - 1; i++) {
//					pst.setString(i + 1, str[i]);
//				}
//				pst.setInt(str.length, Integer.parseInt(str[str.length - 1]));
//			}
//			rs = pst.executeQuery();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return rs;
//	}
}
