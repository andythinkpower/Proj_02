package _04_model;

import java.util.List;

public interface Event01DAO {

	List<Event01> eventSearch(String newDate, String newAreas , String newTypes);
	
	List<Event01> eventSelf(String eventID);

}