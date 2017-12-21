package _05_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class FavoritesService {
	@Autowired
	private FavoritesDAO favoritesDAO;
	
	public List<FavoritesBean> select(String email){
		List<FavoritesBean> result=favoritesDAO.select(email);
		return result;
	};
	
	
	
	public boolean deleteFav(Integer pk) {
		return favoritesDAO.delete(pk);
	}
	
	public Integer Create_fav(FavoritesBean bean) {
		if(bean==null) {
			return null;
		}else {
			return favoritesDAO.insert(bean);
		}
	}
	
	/*
	public void update(String email){
		favoritesDAO.update(email);
	};
	*/
	
}
