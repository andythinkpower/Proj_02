package _02_model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.Bean.FavoritesBean;
import _02_model.dao.FavoritesDAOSpring;

@Service
public class FavoritesService {

	@Autowired
	private FavoritesDAOSpring favoritesDAOSpring;
	
	@Transactional(readOnly=true)
	public List<FavoritesBean> selectFav(String email){
		return favoritesDAOSpring.select(email);
	}
	@Transactional
	public boolean deleteFav(Integer pk) {
		return favoritesDAOSpring.delete(pk);
	}
	
}
