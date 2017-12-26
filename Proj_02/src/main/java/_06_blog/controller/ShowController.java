package _06_blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path= {"/_06_blog/show.controller"})
public class ShowController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method= {RequestMethod.GET},produces= {"application/jason;charset=UTF-8"})
	@ResponseBody	
	public String show(BlogBean bean, Model model, String memberemail) {
		System.out.println("YES");
		
		bean.setMemberemail(memberemail);
		List<BlogBean>result=blogService.selectall(bean);
		System.out.println("result:"+result);
		
		return "";
	}
}
