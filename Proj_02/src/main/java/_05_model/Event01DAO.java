package _05_model;

import java.util.List;

import _00_proj02Bean.Event01;

public interface Event01DAO {

	List<Event01> select();
	
	Event01 select(int eventID);
    
	Event01 insert(Event01 event);

	Event01 update(Event01 event);

	boolean delete(int eventID);

	List<Event01> selectcollectionCount();

	List<Event01> selectcollectionCount(String types);

	List<Event01> selectInsertTime();

	List<Event01> selectInsertTime(String types);

	List<Event01> selectshareCount();

	List<Event01> selectshareCount(String types);

	List<Event01> selectthisweek(String types);

	List<Event01> selectthisweek();
	
	
}