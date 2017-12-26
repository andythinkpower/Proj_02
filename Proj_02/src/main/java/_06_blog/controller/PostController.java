package _06_blog.controller;

import java.util.HashMap;
import java.util.Map;

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
@RequestMapping(path = {"/_06_blog/post.controller"})
public class PostController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method= {RequestMethod.POST, RequestMethod.GET}, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public BlogBean post(BlogBean bean, Model model, String memberemail,
			String articlename, String articletype, String editor, String pravicy) {
		
		System.out.println("post.controller");
		
		System.out.println("articlecontent:"+editor);
		
		bean.setMemberemail(memberemail);
		bean.setArticlename(articlename);
		bean.setArticletype(articletype);
		bean.setArticlecontent(editor);
		
		blogService.post(bean);		
		
		return blogService.select(bean);
	}
}
