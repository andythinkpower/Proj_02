package _03_backStage.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;


public class EventService {
	private EventDAO_interface dao;
	
	public EventService() {
			dao = new EventDAO();
	}

	public List<EventVO> getAll(){
		return dao.getAll();
	}
	
	public void deleteevent01(Integer EventID) throws SQLException {
		dao.delete(EventID);
	}

	public EventVO getOneBook(Integer EventID) {
		return dao.findByPrimaryKey(EventID);
	}

	public EventVO updateevent01(String EventName, String Fee, String IsCharge,
			Date DurationStart, Date DurationEnd, String ShowGroupName,
			String ImageFile, String ContactName, String BriefIntroduction) {
		// TODO Auto-generated method stub
		return null;
	}
}
