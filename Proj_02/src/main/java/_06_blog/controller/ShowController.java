package _06_blog.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogDAO;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path = { "/_06_blog/show.controller" })
public class ShowController {

	@Autowired
	private BlogService blogService;

	@RequestMapping(method = { RequestMethod.GET }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<BlogBean> show(BlogBean list, Model model, String memberemail, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("show.controller");

		list.setMemberemail(memberemail);
		System.out.println(memberemail);
		
		List<BlogBean> result = blogService.selectall(list);
//		System.out.println("result:" + result);
		
		Cookie cookieUser = null;
		cookieUser = new Cookie("user", memberemail);
		cookieUser.setMaxAge(30*60*60);
		cookieUser.setPath(request.getContextPath());
		response.addCookie(cookieUser);

		return blogService.selectall(list);
	}
}
