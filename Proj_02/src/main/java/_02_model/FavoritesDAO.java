package _02_model;

import java.util.List;

import _02_model.Bean.FavoritesBean;


public interface FavoritesDAO {
	//查詢該會員所有收藏
	public List<FavoritesBean> select(String email);
	
	public boolean delete(Integer pk);
}
