package _03_backStage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BlogsBackDAO implements BlogsBackDAO_interface
{
	private static DataSource ds = null;
//	private static final String insert_stmt = "insert into ProductListingBook (ProductListingBook_Name, ProductListingBook_Price"
//			+ ", ProductListingBook_Discount, ProductListingBook_Quantity, ProductListingBook_Publishedate, "
//			+ "ProductListingBook_Publisher, ProductListingBook_Picture, ProductListingBook_Authors, ProductListingBook_Des) "
//			+ "values (?,?,?,?,?,?,?,?,?)";
	
//	private static final String update_ALL_stmt = "Update ProductListingBook set MessageBoard_Content=?, MessageBoard_Picture=?, "
//			+ "MessageBoard_FileName=?, MessageBoard_Counts=?, MessageBoard_Status=?, MessageBoard_Reports=? where MessageBoard_ID = ?";
	private static final String update_stmt = "UPDATE Blogs SET ArticleType=? WHERE ArticleId =?";

	private static final String delete_stmt = "Delete from Blogs where ArticleId = ?";
	private static final String get_one_stmt = "Select * from Blogs where ArticleId = ?";
	private static final String get_all_stmt = "Select * from Blogs ";

	static {
		try{
			//要使用JNDI
			Context ctx = new InitialContext();
			//取得連線物件
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xxx");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	public static void hide(Integer ArticleId ){
		int i = 0;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 關閉自動交易

			pStmt = conn.prepareStatement(update_stmt);
			pStmt.clearParameters();
			pStmt.setInt(1, 0);
			pStmt.setInt(2, ArticleId);
			
						
			i = pStmt.executeUpdate();

			if (i == 1)
			{
				System.out.println("成功");
			} else
			{
				throw new SQLException("新增記錄數 : 0");
			}

			conn.commit();
			conn.setAutoCommit(true);//開啟自動交易

		} catch (SQLException e)
		{
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally
		{
			if (pStmt != null)
			{
				try {
					pStmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	public static void display(Integer ArticleId){
		int i = 0;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 關閉自動交易

			pStmt = conn.prepareStatement(update_stmt);
			pStmt.clearParameters();
			pStmt.setInt(1, 1);
			pStmt.setInt(2, ArticleId);
			
						
			i = pStmt.executeUpdate();

			if (i == 1)
			{
				System.out.println("成功");
			} else
			{
				throw new SQLException("新增記錄數 : 0");
			}

			conn.commit();
			conn.setAutoCommit(true);//開啟自動交易

		} catch (SQLException e)
		{
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally
		{
			if (pStmt != null)
			{
				try {
					pStmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	@Override
	public BlogsBackVO findByPrimaryKey(Integer productListingBook_ID)
	{
		BlogsBackVO BlogsBackVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(get_one_stmt);

			pstmt.setInt(1, productListingBook_ID);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				BlogsBackVO = new BlogsBackVO();
				BlogsBackVO.setArticleId(rs.getInt("articleId"));
				BlogsBackVO.setMemberEmail(rs.getString("memberEmail"));
				BlogsBackVO.setArticleContent(rs.getString("articleContent"));
				BlogsBackVO.setArticleName(rs.getString("articleName"));
				BlogsBackVO.setBlogPhoto(rs.getBlob("blogPhoto"));
				BlogsBackVO.setPostTime(rs.getDate("postTime"));
				BlogsBackVO.setViewNum(rs.getInt("viewNum"));
				BlogsBackVO.setArticleType(rs.getString("articleType"));
				BlogsBackVO.setReport(rs.getInt("report"));
			}

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e)
		{
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				} catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (conn != null)
			{
				try
				{
					conn.close();
				} catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
		
		return BlogsBackVO ;
	}

	@Override
	public List<BlogsBackVO> getAll() {
		List<BlogsBackVO> list = new ArrayList<BlogsBackVO>();
		BlogsBackVO BlogBackVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(get_all_stmt);
			//pstmt.setInt(1, messageBoard_Id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				//MessageBoardVO 也稱為Domain Objects
				BlogBackVO = new BlogsBackVO();
				BlogBackVO.setArticleId(rs.getInt("articleId"));
				BlogBackVO.setMemberEmail(rs.getString("memberEmail"));
				BlogBackVO.setArticleContent(rs.getString("articleContent"));
				BlogBackVO.setArticleName(rs.getString("articleName"));
				BlogBackVO.setBlogPhoto(rs.getBlob("blogPhoto"));
				BlogBackVO.setPostTime(rs.getDate("postTime"));
				BlogBackVO.setViewNum(rs.getInt("viewNum"));
				BlogBackVO.setArticleType(rs.getString("articleType"));
				BlogBackVO.setReport(rs.getInt("report"));
				list.add(BlogBackVO);
			}

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e)
		{
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				} catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (conn != null)
			{
				try
				{
					conn.close();
				} catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}
	@Override
	public Integer delete(Integer ArticleId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}