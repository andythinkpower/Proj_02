package _03_backStage.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.*;

import javax.print.attribute.standard.DateTimeAtCompleted;

public interface EventDAO_interface {
	
	public static void insert(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			InputStream LogoImageFileURL, String ContactName, String BriefIntroduction ) {
	}
	public static void update(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			InputStream LogoImageFileURL, String ContactName, String BriefIntroduction ) {
	}



	public Integer delete(Integer EventID) throws SQLException;

	public EventVO findByPrimaryKey(Integer EventID);

	public List<EventVO> getAll();


}
