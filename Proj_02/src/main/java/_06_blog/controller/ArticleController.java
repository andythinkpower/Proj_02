package _06_blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path= {"/_06_blog/article.controller"})
@SessionAttributes(names= {"article"})
public class ArticleController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method = { RequestMethod.GET })
	public String article(BlogBean bean, Model model, String memberemail, String articleid) {
		System.out.println("article.controller");
		System.out.println("articleid:"+articleid);
		int x=Integer.parseInt(articleid);
//		System.out.println("x:"+x);
		bean.setArticleid(x);
		BlogBean newbean= blogService.select(bean);
		blogService.addviewnum(bean);
//		System.out.println("newbean:"+newbean);
		model.addAttribute("article", newbean);
		
		return "article.success";
	}
}
