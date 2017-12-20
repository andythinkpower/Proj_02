package _04_model;

import java.util.List;

public interface Event01DAO {

	List<Event01> select();
	
	List<Event01> selectChange(String newTypes);
	
	List<Event01> eventSelf(String eventID);
	
}