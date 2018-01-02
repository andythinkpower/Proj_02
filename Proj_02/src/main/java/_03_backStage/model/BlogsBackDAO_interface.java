package _03_backStage.model;

import java.sql.SQLException;
import java.util.*;

public interface BlogsBackDAO_interface {
	
	
//	public static void hide(Integer MessageBoard_ID, Integer MessageBoard_Status ) {
//	}
//	public static void display(Integer MessageBoard_ID, Integer MessageBoard_Status ) {
//	}
	

//	public void updateAll(ProductListingBookVO productListingBookVO);

	
	public BlogsBackVO findByPrimaryKey(Integer ArticleId);

	public List<BlogsBackVO> getAll();

	public static void hide(Integer ArticleId) {
	}

	public static void display(Integer ArticleId) {
	}
	public Integer delete(Integer ArticleId) throws SQLException;
//	public Integer update(ProductListingBookVO productListingBookVO) throws SQLException;

	//public void delete(Integer articleId);
}
