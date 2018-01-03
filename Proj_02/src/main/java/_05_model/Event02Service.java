package _05_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_proj02Bean.Event01;

@Service
public class Event02Service {

	@Autowired
	private Event01DAO event01dao;

	public List<Event01> select() {
		List<Event01> result = event01dao.select();
		return result;
	}
	public Event01  select(int eventID) {
		Event01 result = event01dao.select(eventID);
		return result;
	}
	public Event01  update(Event01 event) {
		Event01 result = event01dao.update(event);
		return result;
	}
	
	public List<Event01> selectcollectionCount() {
		List<Event01> result = event01dao.selectcollectionCount();
		return result;
	}
	
	public List<Event01> selectInsertTime() {
		List<Event01> result = event01dao.selectInsertTime();
		return result;
	}
	
	
	public List<Event01> selectshareCount() {
		List<Event01> result = event01dao.selectshareCount();
		return result;
	}
	
	public List<Event01> selectthisweek() {
		List<Event01> result = event01dao.selectthisweek();
		return result;
	}
	
	public List<Event01> selectcollectionCount(String types) {
		List<Event01> result = event01dao.selectcollectionCount( types);
		return result;
	}
	
	public List<Event01> selectInsertTime(String types) {
		List<Event01> result = event01dao.selectInsertTime( types);
		return result;
	}
	
	
	public List<Event01> selectshareCount(String types) {
		List<Event01> result = event01dao.selectshareCount( types);
		return result;
	}
	
	public List<Event01> selectthisweek(String types) {
		List<Event01> result = event01dao.selectthisweek( types);
		return result;
	}
	
	
	
	
	
}
