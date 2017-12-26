package _06_blog.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlogService {

	@Autowired
	private BlogDAO blogDao;
	
	//發布一篇文章
	public BlogBean post(BlogBean bean) {
		blogDao.insert(bean);
		return null;
	}
	//選出該會員的所有文章
	public List<BlogBean> selectall(BlogBean bean){
		List<BlogBean> result=blogDao.selectall(bean);
		return result;
	}
}
