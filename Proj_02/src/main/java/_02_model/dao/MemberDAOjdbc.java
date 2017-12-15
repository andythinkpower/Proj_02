package _02_model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import _02_model.MemberDAO;
import _02_model.Bean.MemberBean;
//使用JDBC技術
//DAO負責處理資料庫有關的部分 讓Service更靈活 若要更換資料庫只需更改DAO程式碼 Service不須改動
public class MemberDAOjdbc implements MemberDAO {

	// DrvierManger適合在普通Java專案 在Web應用程式上要用DataSource
	private DataSource dataSource;

	public MemberDAOjdbc() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_ACCOUNT = "select * from member where account=?";

	// 取得帳號所有資訊
	@Override
	public MemberBean select(String account) {

		MemberBean ans = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SELECT_ACCOUNT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();
			// 如果資料庫找到資料 把帳號其餘資訊塞入ans中
			if (rs.next()) {
				ans = new MemberBean();
				ans.setPsd(rs.getString("PSD"));
				ans.setPhone(rs.getString("PHONE"));
				System.out.println("成功讀取資料");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return ans;
	}

	@Override
	public boolean update(String psd, String phone) {

		return false;
	}

}
