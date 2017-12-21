package _05_model;

import java.util.List;

public interface FavoritesDAO {
	public List<FavoritesBean> select(String email);
	public String update(String email,List<FavoritesBean> jsondata);
	public boolean delete(Integer pk);
	public Integer insert(FavoritesBean bean);	
	
}
