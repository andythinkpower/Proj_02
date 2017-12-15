package _05_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Event02Service {

	@Autowired
	private Event01DAO event01dao;

	public List<Event02> select(Event02 bean) {
		List<Event02> result = event01dao.select();
		return result;
	}
	
	public List<Event02> selectMusic(Event02 bean) {
		List<Event02> result = event01dao.selectMusic();
		return result;
	}
	
}
