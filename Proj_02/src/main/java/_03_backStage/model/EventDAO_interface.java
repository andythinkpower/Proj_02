package _03_backStage.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface EventDAO_interface {
	
	public static void insert(String EventID, String EventName, String Fee, String IsCharge,
			Date DtStart, Date DurationEnd, String ShowGroupName, Date TimeStart, Date InsertTime,
			String Address, String ImageFile, String EventTypeID, String VContent ) {
		/*EventID, EventName, Fee"
				+ ", IsCharge, DtStart, DurationEnd, ShowGroupName, TimeStart, InsertTime"
				+ "Address, ImageFile, EventTypeID, VContent*/
	}
	public static void update(String EventName, String Fee, String IsCharge,
			Date DtStart, Date DurationEnd, String ShowGroupName,
			String ImageFileURL, String EventTypeID, String VContent ) {
	}


	public Integer delete(Integer EventID) throws SQLException;

	public EventVO findByPrimaryKey(Integer eventID);

	public List<EventVO> getAll();

}
