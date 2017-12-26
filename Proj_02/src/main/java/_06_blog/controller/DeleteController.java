package _06_blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path = { "/_06_blog/delete.controller" })
public class DeleteController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method = { RequestMethod.GET }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public boolean delete(BlogBean bean, Model model, String memberemail, String articleid) {
		int x=Integer.parseInt(articleid);
		bean.setArticleid(x);
		if(blogService.delete(bean)) {
			return true;
		}
		
		return false;
	}
}
