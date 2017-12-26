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

public class BackStageLoginService
{
	static private List<ManagerVO> managerList = new ArrayList<ManagerVO>();
	
	private DataSource ds = null;
	
	public BackStageLoginService() throws NamingException, SQLException
	{
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		if(managerList.isEmpty())
		{
			gogogo();
		}
	}
	
	public void gogogo() throws SQLException
	{
		String sql = "SELECT * FROM Manager";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerVO mg = null;
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				int Manager_ID = rs.getInt("Manager_ID");
				String Manager_Account = rs.getString("Manager_Account");
				String Manager_Password = rs.getString("Manager_Password");
				int Manager_Level = rs.getInt("Manager_Level");
				
				mg = new ManagerVO(Manager_ID,Manager_Account,Manager_Password,Manager_Level);
				
				managerList.add(mg);
			}
		}finally
		{
			if (rs != null)
			{
				rs.close();
			}
			if (conn != null)
			{
				conn.close();
			}
		}
	}
	
	public ManagerVO checkPassword(String account,String password)
	{
		for (ManagerVO mg : managerList)
		{
			if (mg.getManager_Account().trim().equals(account))
			{
				String mgpswd = mg.getManager_Password();
				if (mgpswd.equals(password))
				{
					return mg;
				}
				else 
				{
					return null;
				}
			}
		}
		return null;
	}
	
}
