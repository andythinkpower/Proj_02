package _05_model;

import java.util.List;

import _05_model.Event02;

public interface Event01DAO {

	List<Event02> select();
	
	Event02 select(int eventID);
    
	Event02 insert(Event02 event);

	Event02 update(Event02 event);

	boolean delete(int eventID);
	
	List<Event02> selectType(String eventtype);
}