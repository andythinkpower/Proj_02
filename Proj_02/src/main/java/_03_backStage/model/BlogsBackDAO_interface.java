package _03_backStage.model;

import java.sql.SQLException;
import java.util.*;

public interface BlogsBackDAO_interface {
	
	
	public BlogsBackVO findByPrimaryKey(Integer ArticleId);

	public List<BlogsBackVO> getAll();

	public static void hide(Integer ArticleId) {
	}

	public static void display(Integer ArticleId) {
	}
	public Integer delete(Integer ArticleId) throws SQLException;

}
