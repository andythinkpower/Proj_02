package _06_blog.model;

public interface BlogDAO {

	Boolean insert(BlogBean bean);	
	
	BlogBean select(BlogBean bean);
	
	void addviewnum(BlogBean bean);
	
	void addlikenum(BlogBean bean);
	
	void delete(int id);
}
