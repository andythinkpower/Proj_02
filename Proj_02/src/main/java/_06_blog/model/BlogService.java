package _06_blog.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlogService {

	@Autowired
	private BlogDAO blogDao;
	
	public BlogBean post(BlogBean bean) {
		blogDao.insert(bean);
		return null;
	}
}
