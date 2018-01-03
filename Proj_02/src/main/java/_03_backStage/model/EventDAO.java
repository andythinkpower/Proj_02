package _03_backStage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EventDAO implements EventDAO_interface
{
	private static DataSource ds = null;
	private static final String insert_stmt = "insert into event01 (EventID, EventName, Fee"
			+ ", IsCharge, DtStart, DurationEnd, ShowGroupName, InsertTime"
			+ ", CityID, AreaID, Address, ImageFile, EventTypeID, VContent) "
			+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	//EventID, EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, TimeStart, InsertTime, Address, ImageFile, EventTypeID, VContent	
//	private static final String update_ALL_stmt = "Update ProductListingBook set MessageBoard_Content=?, MessageBoard_Picture=?, "
//			+ "MessageBoard_FileName=?, MessageBoard_Counts=?, MessageBoard_Status=?, MessageBoard_Reports=? where MessageBoard_ID = ?";
	private static final String update_stmt = "UPDATE event01 SET EventName=?, Fee=?"
			+ ", IsCharge=?, DtStart=?, DurationEnd=?, "
			+ "ShowGroupName=?, EventTypeID=?, VContent=?, ImageFile=?"
			+ " WHERE EventID =?";
	private static final String update_without_pic = "UPDATE event01 SET EventName=?, Fee=?"
			+ ", IsCharge=?, DtStart=?, DurationEnd=?, "
			+ "ShowGroupName=?, EventTypeID=?, VContent=?"
			+ " WHERE EventID =?";
	private static final String delete_stmt = "Delete from event01 where EventID = ?";
	private static final String get_one_stmt = "Select * from event01 where EventID = ?";
	private static final String get_all_stmt = "Select * from event01 ";

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
	public static void insert(Integer EventID, String EventName, String Fee,
			String IsCharge, Date DtStart, Date DurationEnd, String ShowGroupName,
			Date InsertTime, String CityID, String AreaID, String Address,String ImageFile,
			String EventTypeID, String VContent)
	//EventID, EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, TimeStart, InsertTime, Address, ImageFile, EventTypeID, VContent
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
//EventID, EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, TimeStart, InsertTime, Address, ImageFile, EventTypeID, VContent
			pStmt = conn.prepareStatement(insert_stmt);
			pStmt.setInt(1, EventID);
			pStmt.setString(2, EventName);
			pStmt.setString(3, Fee);
			pStmt.setString(4, IsCharge);
			pStmt.setDate(5, (java.sql.Date) DtStart);
			pStmt.setDate(6, (java.sql.Date) DurationEnd);
			pStmt.setString(7, ShowGroupName);
//			pStmt.setDate(8, (java.sql.Date) TimeStart);
			pStmt.setDate(8, (java.sql.Date) InsertTime);
			pStmt.setString(9, CityID);
			pStmt.setString(10, AreaID);
			pStmt.setString(11, Address);
			pStmt.setString(12, ImageFile);
			pStmt.setString(13, EventTypeID);
			pStmt.setString(14, VContent);

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
			Date DtStart, Date DurationEnd, String ShowGroupName,
			String imageFile, String EventTypeID, String VContent,
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
			pStmt.setDate(4, (java.sql.Date) DtStart);
			pStmt.setDate(5, (java.sql.Date) DurationEnd);
			pStmt.setString(6, ShowGroupName);			
			pStmt.setString(7, EventTypeID);
			pStmt.setString(8, VContent);
			pStmt.setString(9, imageFile);
			pStmt.setInt(10, EventID);
			
			System.out.println("ImageFile:"+imageFile);
						
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
			Date DtStart, Date DurationEnd, String ShowGroupName, 
			String EventTypeID, String VContent,Integer EventID){
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
			pStmt.setDate(4, (java.sql.Date) DtStart);
			pStmt.setDate(5, (java.sql.Date) DurationEnd);
			pStmt.setString(6, ShowGroupName);			
			pStmt.setString(7, EventTypeID);
			pStmt.setString(8, VContent);
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
	public EventVO findByPrimaryKey(Integer eventID)
	{
		EventVO eventVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(get_one_stmt);

			pstmt.setInt(1, eventID);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				eventVO = new EventVO();
				eventVO.setEventID(rs.getInt("EventID"));
				eventVO.setEventName(rs.getString("EventName"));
				eventVO.setFee(rs.getString("Fee"));
				eventVO.setIsCharge(rs.getString("IsCharge"));
				eventVO.setDtStart(rs.getDate("DtStart"));
				eventVO.setDurationEnd(rs.getDate("DurationEnd"));
				eventVO.setShowGroupName(rs.getString("ShowGroupName"));
				eventVO.setImageFile(rs.getString("ImageFile"));
				eventVO.setEventTypeID(rs.getString("EventTypeID"));
				eventVO.setVContent(rs.getString("VContent"));
			}
//EventID, EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, TimeStart, InsertTime, Address, ImageFile, EventTypeID, VContent
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
		
		return eventVO;
	}

	@Override
	public List<EventVO> getAll() {
		List<EventVO> list = new ArrayList<EventVO>();
		EventVO eventVO = null;
		
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
				eventVO = new EventVO();
				eventVO.setEventID(rs.getInt("EventID"));
				eventVO.setEventName(rs.getString("EventName"));
				eventVO.setFee(rs.getString("Fee"));
				eventVO.setIsCharge(rs.getString("IsCharge"));
				eventVO.setDtStart(rs.getDate("DtStart"));
				eventVO.setDurationEnd(rs.getDate("DurationEnd"));
				eventVO.setShowGroupName(rs.getString("ShowGroupName"));
				eventVO.setImageFile(rs.getString("ImageFile"));
				eventVO.setEventTypeID(rs.getString("EventTypeID"));
				eventVO.setIsBlock(rs.getInt("IsBlock"));
				eventVO.setVContent(rs.getString("VContent"));
				list.add(eventVO);
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