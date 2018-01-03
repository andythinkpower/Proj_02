package _03_backStage.model;

import java.sql.SQLException;
import java.util.List;


public class BlogsBackService {
	private BlogsBackDAO_interface dao;
	
	public BlogsBackService() {
			dao = new BlogsBackDAO();
	}

	public List<BlogsBackVO> getAll(){
		return dao.getAll();
	}
	public void deleteBlogs(Integer ArticleId) throws SQLException {
		dao.delete(ArticleId);
	}
	public BlogsBackVO getOneBook(Integer ArticleId) {
		return dao.findByPrimaryKey(ArticleId);
	}

}
