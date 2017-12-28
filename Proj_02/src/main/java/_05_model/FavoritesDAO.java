package _05_model;

import java.util.Date;
import java.util.List;

import _00_proj02Bean.FavoritesBean;

public interface FavoritesDAO {
	public List<FavoritesBean> select(String email);
	public String update(String email,List<FavoritesBean> jsondata);
	public Integer insert(FavoritesBean bean);
	public String updateCalendar(String email, Integer eventID, Date targetDate);
	public FavoritesBean selectFavorites(String email, Integer eventID);
	public boolean delete(String email, Integer eventID);	
	
}
