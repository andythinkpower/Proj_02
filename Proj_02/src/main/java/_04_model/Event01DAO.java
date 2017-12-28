package _04_model;

import java.util.List;

import _00_proj02Bean.Event01;

public interface Event01DAO {

	List<Event01> eventSearch(String newDate, String newAreas, String newTypes, String newOrder, Integer pageNumber);
	
	Long eventCount(String newDate, String newAreas, String newTypes);

	List<Event01> eventSelf(String eventID);

}