package _05_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
