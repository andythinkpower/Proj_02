package _06_blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path = { "/_06_blog/blog.controller" })
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method = { RequestMethod.GET }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<BlogBean> showhighest(){		
		return blogService.selecthightest();
	}
}
