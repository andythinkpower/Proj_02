package _05_model;

import java.util.List;

import _05_model.Event01;

public interface Event01DAO {

	List<Event01> select();
	
	Event01 select(int eventID);
    
	Event01 insert(Event01 event);

	Event01 update(Event01 event);

	boolean delete(int eventID);
}