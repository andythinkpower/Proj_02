package _05_model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_model.Event02;
import _05_model.Event01DAO;

@Repository
public class Event01DAOjdbc implements Event01DAO {
	
	@Autowired
	private DataSource dataSource;
	private static final String SELECT_ALL = "select * from event01 order by datediff ( day , getdate() , DurationEnd )";
	private static final String SELECT_BY_MUSIC = "select * from event01 where EventTypeID = '音樂'";

	@Override
	public List<Event02> select() {
		
		List<Event02> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<>();
			while (rset.next()) {
				Event02 obj = new Event02();
				obj.setEventID(rset.getInt("eventID"));
				obj.setEventName(rset.getString("eventName"));
				obj.setShowGroupName(rset.getString("showGroupName"));
				obj.setEventTypeId(rset.getString("eventTypeId"));
				obj.setDurationStart(rset.getDate("durationStart"));
				obj.setDurationEnd(rset.getDate("durationEnd"));
				obj.setIsCharge(rset.getInt("isCharge"));
				obj.setFee(rset.getString("fee"));
				obj.setShoppingUrl(rset.getString("shoppingUrl"));
				obj.setContactName(rset.getString("contactName"));
				obj.setContactTel(rset.getString("contactTel"));
				obj.setContactFax(rset.getString("contactFax"));
				obj.setBriefIntroduction(rset.getString("briefIntroduction"));
				obj.setVcontent(rset.getString("vcontent"));
				obj.setEventUrl(rset.getString("eventUrl"));
				obj.setYouTubeUrl(rset.getString("youTubeUrl"));
				obj.setimageFile(rset.getString("imageFile"));
				obj.setLogoimageFile(rset.getString("logoimageFile"));
				obj.setInsertTime(rset.getDate("insertTime"));
				obj.setDtStart(rset.getDate("dtStart"));
				obj.setDtEnd(rset.getDate("dtEnd"));
				obj.setTimeStart(rset.getTime("timeStart"));
				obj.setLocation(rset.getString("location"));
				obj.setCityId(rset.getString("cityId"));
				obj.setAreaId(rset.getString("areaId"));
				obj.setAddress(rset.getString("address"));
				obj.setLongitude(rset.getString("longitude"));
				obj.setLatitude(rset.getString("latitude"));
				result.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Event02> selectMusic() {
		
		List<Event02> result = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MUSIC);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<>();
			while (rset.next()) {
				Event02 obj = new Event02();
				obj.setEventID(rset.getInt("eventID"));
				obj.setEventName(rset.getString("eventName"));
				obj.setShowGroupName(rset.getString("showGroupName"));
				obj.setEventTypeId(rset.getString("eventTypeId"));
				obj.setDurationStart(rset.getDate("durationStart"));
				obj.setDurationEnd(rset.getDate("durationEnd"));
				obj.setIsCharge(rset.getInt("isCharge"));
				obj.setFee(rset.getString("fee"));
				obj.setShoppingUrl(rset.getString("shoppingUrl"));
				obj.setContactName(rset.getString("contactName"));
				obj.setContactTel(rset.getString("contactTel"));
				obj.setContactFax(rset.getString("contactFax"));
				obj.setBriefIntroduction(rset.getString("briefIntroduction"));
				obj.setVcontent(rset.getString("vcontent"));
				obj.setEventUrl(rset.getString("eventUrl"));
				obj.setYouTubeUrl(rset.getString("youTubeUrl"));
				obj.setimageFile(rset.getString("imageFile"));
				obj.setLogoimageFile(rset.getString("logoimageFile"));
				obj.setInsertTime(rset.getDate("insertTime"));
				obj.setDtStart(rset.getDate("dtStart"));
				obj.setDtEnd(rset.getDate("dtEnd"));
				obj.setTimeStart(rset.getTime("timeStart"));
				obj.setLocation(rset.getString("location"));
				obj.setCityId(rset.getString("cityId"));
				obj.setAreaId(rset.getString("areaId"));
				obj.setAddress(rset.getString("address"));
				obj.setLongitude(rset.getString("longitude"));
				obj.setLatitude(rset.getString("latitude"));
				result.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}