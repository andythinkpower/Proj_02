package _06_blog.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_member.model.MemberBean;
import _01_member.model.MemberService;

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
		return blogDao.selectall(bean);
	}
	//選出所有文章依觀看次數列出
	public List<BlogBean> selecthightest(){
		return blogDao.selecthightest();
	}
	//選出一篇文章
	public BlogBean select(BlogBean bean) {
		return blogDao.select(bean);
	}
	//刪除一篇文章
	public Boolean delete(BlogBean bean) {
		 
		blogDao.delete(bean.getArticleid());
		
		if(blogDao.select(bean)==null) {
			return true;
		}
		return false;
	}
	//增加觀看次數
	public void addviewnum(BlogBean bean) {
		blogDao.addviewnum(bean);
	}
	
	//test	
		public static void main(String[] args) {
			ApplicationContext context= new ClassPathXmlApplicationContext("text.xml");
			BlogService blogService=(BlogService) context.getBean("blogService");

// 			測試選出該會員的所有文章
//			BlogBean bean=new BlogBean();
//			bean.setMemberemail("aaa@gmail.com");
//			System.out.println(blogService.selectall(bean));
			
//			測試刪除一篇文章
//			BlogBean bean=new BlogBean();
//			bean.setArticleid(57);
//			System.out.println(blogService.delete(bean));
			
					
			((ConfigurableApplicationContext)context).close();
		}
}
