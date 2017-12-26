package _05_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_proj02Bean.Event02;

@Service
public class Event02Service {

	@Autowired
	private Event01DAO event01dao;

	public List<Event02> select() {
		List<Event02> result = event01dao.select();
		return result;
	}
	public Event02  select(int eventID) {
		Event02 result = event01dao.select(eventID);
		return result;
	}
	public Event02  update(Event02 event) {
		Event02 result = event01dao.update(event);
		return result;
	}
	
}
