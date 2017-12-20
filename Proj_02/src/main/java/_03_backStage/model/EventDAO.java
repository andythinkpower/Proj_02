package _03_backStage.model;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import _00_init.GlobalService;

public class EventDAO implements EventDAO_interface
{
	private static DataSource ds = null;
	private static final String insert_stmt = "insert into event01 (EventName, Fee"
			+ ", IsCharge, DurationStart, DurationEnd, "
			+ "ShowGroupName, ImageFile, ContactName, BriefIntroduction) "
			+ "values (?,?,?,?,?,?,?,?,?)";
	
//	private static final String update_ALL_stmt = "Update ProductListingBook set MessageBoard_Content=?, MessageBoard_Picture=?, "
//			+ "MessageBoard_FileName=?, MessageBoard_Counts=?, MessageBoard_Status=?, MessageBoard_Reports=? where MessageBoard_ID = ?";
	private static final String update_stmt = "UPDATE event01 SET EventName=?, Fee=?"
			+ ", IsCharge=?, DurationStart=?, DurationEnd=?, "
			+ "ShowGroupName=?, ContactName=?, BriefIntroduction=?, ImageFile=?"
			+ " WHERE EventID =?";
	private static final String update_without_pic = "UPDATE event01 SET EventName=?, Fee=?"
			+ ", IsCharge=?, DurationStart=?, DurationEnd=?, "
			+ "ShowGroupName=?, ContactName=?, BriefIntroduction=?"
			+ " WHERE EventID =?";
	private static final String delete_stmt = "Delete from event01 where EventID = ?";
	private static final String get_one_stmt = "Select * from event01 where EventID = ?";
	private static final String get_all_stmt = "Select * from event01 ";

	static {
		try{
			//要使用JNDI
			Context ctx = new InitialContext();
			//取得連線物件
			ds = (DataSource)ctx.lookup("");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	public static void insert(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			InputStream ImageFile, String ContactName, String BriefIntroduction)
	{
		Connection conn = null;
		PreparedStatement pStmt = null;
		// 定義格式不顯示毫秒
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//獲取系統當前時間
		Timestamp now = new Timestamp(System.currentTimeMillis());
		int i = 0;

		try
		{
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 關閉自動交易

			pStmt = conn.prepareStatement(insert_stmt);
			pStmt.setString(1, EventName);
			pStmt.setString(2, Fee);
			pStmt.setString(3, IsCharge);
			pStmt.setDate(4, (java.sql.Date) DurationStart);
			pStmt.setDate(5, (java.sql.Date) DurationEnd);
			pStmt.setString(6, ShowGroupName);
			pStmt.setBinaryStream(7, ImageFile);
			pStmt.setString(8, ContactName);
			pStmt.setString(9, BriefIntroduction);

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

	public static void update(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			InputStream ImageFile, String ContactName, String BriefIntroduction,
			Integer EventID){
		int i = 0;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 關閉自動交易

			pStmt = conn.prepareStatement(update_stmt);
			pStmt.clearParameters();
			pStmt.setString(1, EventName);
			pStmt.setString(2, Fee);
			pStmt.setString(3, IsCharge);
			pStmt.setDate(4, (java.sql.Date) DurationStart);
			pStmt.setDate(5, (java.sql.Date) DurationEnd);
			pStmt.setString(6, ShowGroupName);			
			pStmt.setString(7, ContactName);
			pStmt.setString(8, BriefIntroduction);
			pStmt.setBinaryStream(9, ImageFile);
			pStmt.setInt(10, EventID);
			
			System.out.println("ImageFile:"+ImageFile);
						
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
	public static void update_noPic(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName, 
			String ContactName, String BriefIntroduction,Integer EventID){
		int i = 0;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			
			conn = ds.getConnection();
			conn.setAutoCommit(false); // 關閉自動交易

			pStmt = conn.prepareStatement(update_without_pic);
			pStmt.clearParameters();
			pStmt.setString(1, EventName);
			pStmt.setString(2, Fee);
			pStmt.setString(3, IsCharge);
			pStmt.setDate(4, (java.sql.Date) DurationStart);
			pStmt.setDate(5, (java.sql.Date) DurationEnd);
			pStmt.setString(6, ShowGroupName);			
			pStmt.setString(7, ContactName);
			pStmt.setString(8, BriefIntroduction);
			pStmt.setInt(9, EventID);
			
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


	
	// 依Interests_ID來刪除單筆記錄
		@Override
		public Integer delete(Integer EventID) throws SQLException
		{	
			
	//		InterestsVO interestsVO = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			Integer i = 0;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(delete_stmt);
				pstmt.setInt(1, EventID);
				i = pstmt.executeUpdate();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch(SQLException e){
					   e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch(SQLException e){
						e.printStackTrace();
					}
				}
			}
			return i;
		}
		
		
	@Override
	public EventVO findByPrimaryKey(Integer EventID)
	{
		EventVO EventVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(get_one_stmt);

			pstmt.setInt(1, EventID);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				EventVO = new EventVO();
				EventVO.setEventID(rs.getInt("EventID"));
				EventVO.setEventName(rs.getString("EventName"));
				EventVO.setFee(rs.getString("Fee"));
				EventVO.setIsCharge(rs.getString("IsCharge"));
				EventVO.setDurationStart(rs.getDate("DurationStart"));
				EventVO.setDurationEnd(rs.getDate("DurationEnd"));
				EventVO.setShowGroupName(rs.getString("ShowGroupName"));
				EventVO.setImageFile(rs.getString("ImageFile"));
				EventVO.setContactName(rs.getString("ContactName"));
				EventVO.setBriefIntroduction(rs.getString("BriefIntroduction"));
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
		
		return EventVO;
	}

	@Override
	public List<EventVO> getAll() {
		List<EventVO> list = new ArrayList<EventVO>();
		EventVO EventVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(get_all_stmt);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				EventVO = new EventVO();
				EventVO.setEventID(rs.getInt("EventID"));
				EventVO.setEventName(rs.getString("EventName"));
				EventVO.setFee(rs.getString("Fee"));
				EventVO.setIsCharge(rs.getString("IsCharge"));
				EventVO.setDurationStart(rs.getDate("DurationStart"));
				EventVO.setDurationEnd(rs.getDate("DurationEnd"));
				EventVO.setShowGroupName(rs.getString("ShowGroupName"));
				EventVO.setImageFile(rs.getString("ImageFile"));
				EventVO.setContactName(rs.getString("ContactName"));
				EventVO.setBriefIntroduction(rs.getString("BriefIntroduction"));
				list.add(EventVO);
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

}