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
	public List<Event01> select() {
		return event01dao.select();
	}
	
	@Transactional(readOnly=true)
	public List<Event01> selectChange(String newTypes) {
		return event01dao.selectChange(newTypes);
	}
	
	@Transactional(readOnly=true)
	public List<Event01> eventSelf(String eventID){
		return event01dao.eventSelf(eventID);
	}
	
//	@Transactional(readOnly=true)
//	public List<Event01> selectCount(String newTypes) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
}
