package _04_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _00_proj02Bean.Event01;

@Service
@Transactional
public class Event01Service {

	@Autowired
	private Event01DAO event01dao;
	

	@Transactional(readOnly=true)

	public List<Event01> eventSearch(String newDate , String newAreas , String newTypes,Integer pageNumber) {
		return event01dao.eventSearch(newDate , newAreas , newTypes,pageNumber);
	}
	
	@Transactional(readOnly=true)
	public Long eventCount(String newDate , String newAreas , String newTypes) {
		return event01dao.eventCount(newDate , newAreas , newTypes);

	}
	
	@Transactional(readOnly=true)
	public List<Event01> eventSelf(String eventID){
		return event01dao.eventSelf(eventID);
	}

}
