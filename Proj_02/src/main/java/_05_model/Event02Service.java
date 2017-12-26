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
	
}
