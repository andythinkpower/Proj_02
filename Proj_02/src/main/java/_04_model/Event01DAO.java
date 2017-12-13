package _04_model;

import java.util.List;

public interface Event01DAO {
	
//	Event01 select(int id);

	List<Event01> select();
	
	List<Event01> selectMusic();

	List<Event01> selectMany();
}