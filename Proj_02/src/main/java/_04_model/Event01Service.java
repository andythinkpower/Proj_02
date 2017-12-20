package _04_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Event01Service {

	@Autowired
	private Event01DAO event01dao;
	
	@Transactional(readOnly=true)

	public List<Event01> eventSearch(String newTypes) {
		return event01dao.eventSearch(newTypes);
	}
	
	@Transactional(readOnly=true)
	public List<Event01> eventSelf(String eventID){
		return event01dao.eventSelf(eventID);
	}

}
