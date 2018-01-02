package _03_backStage.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/_03_backStage/controller/MsgGetImage")
public class MessageGetImage_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		OutputStream os = null;
		InputStream is = null;
		try{
			//讀取瀏覽器傳送來的書籍資料(BookID)
			String articleId = request.getParameter("articleId");
			//分辨讀取哪個表格的圖片欄位
			//String type = request.getParameter("type");
			//取得能夠執行JNDI的Context物件
			Context context = new InitialContext();
			//透過JNDI取得DataSource物件
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/xxx");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			//if(type.equalsIgnoreCase("BOOK")){
			//	pstmt = conn.prepareStatement("Select ProductListingBook_Picture from ProductListingBook where ProductListingBook_ID = ?");
			//}else if(type.equalsIgnoreCase("MEMBER")){
			pstmt = conn.prepareStatement("Select BlogPhoto from Blogs where articleId = ?");
			//}
			pstmt.setString(1, articleId);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				//Image欄位可以取出InputStream物件
				is = rs.getBinaryStream(1);
				//設定輸出資料的型態
				response.setContentType("image/jpg");
				//取得能寫出非文字資料的OutputStream物件
				os = response.getOutputStream();
				
				if(is == null){
					is = getServletContext().getResourceAsStream("/images/NoImage.jpg");
				}
				
				int count = 0;
				byte[] bytes = new byte[8192];
				while((count = is.read(bytes)) != -1){
					os.write(bytes, 0,count);
				}
			}
		}catch(NamingException e){
			throw new ServletException(e);
		}catch(SQLException e){
			throw new ServletException(e);
		}finally{
			if(conn != null){
				try{
					conn.close();//一定要註解此行來執行本程式五次
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(os != null){
				os.close();
			}
		}
	}

}
