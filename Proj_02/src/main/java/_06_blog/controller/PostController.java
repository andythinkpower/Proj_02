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
@SessionAttributes(names= {"message"})
public class PostController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method= {RequestMethod.POST, RequestMethod.GET},produces= {"application/jason;charset=UTF-8"})
	@ResponseBody
	public String post(BlogBean bean, Model model, String memberemail,
			String articlename, String articletype, String articlecontent, String parvicy) {
		
		System.out.println("YES");
		
		bean.setMemberemail("aaa@gmail.com");
		blogService.post(bean);
		
		Map<String, String> message = new HashMap<>();
		model.addAttribute("message", message);
		
		message.put("success", "新增成功");
		
		return "post.success";
	}
}
