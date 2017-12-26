package _03_backStage.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface EventDAO_interface {
	
	public static void insert(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			String ImageFileURL, String ContactName, String BriefIntroduction ) {
	}
	public static void update(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			String ImageFileURL, String ContactName, String BriefIntroduction ) {
	}

//	public void updateAll(ProductListingBookVO productListingBookVO);

	public Integer delete(Integer EventID) throws SQLException;

	public EventVO findByPrimaryKey(Integer eventID);

	public List<EventVO> getAll();

//	public Integer update(ProductListingBookVO productListingBookVO) throws SQLException;
}
