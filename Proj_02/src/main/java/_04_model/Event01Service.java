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
	
//	@Transactional
//	Event01 select(int eventID) {
//		Event01 result = (Event01) event01dao.select();
//		return result;
//	}
	
	@Transactional(readOnly=true)
	public List<Event01> select(Event01 bean) {
		List<Event01> result = event01dao.select();
		return result;
	}
	
	@Transactional(readOnly=true)
	public List<Event01> selectMusic(Event01 bean) {
		List<Event01> result = event01dao.selectMusic();
		return result;
	}
	
	@Transactional(readOnly=true)
	public List<Event01> selectMany(String manyType) {
		List<Event01> result = event01dao.selectMusic();
		return result;
	}
}
