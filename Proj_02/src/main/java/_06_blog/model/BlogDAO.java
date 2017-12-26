package _06_blog.model;

import java.util.List;

public interface BlogDAO {

	Boolean insert(BlogBean bean);	
	
	BlogBean select(BlogBean bean);
	
	void addviewnum(BlogBean bean);
	
	void addlikenum(BlogBean bean);
	
	void delete(int id);
	
	List<BlogBean> selectall(BlogBean bean);
	
	List<BlogBean> selecthightest();
}
