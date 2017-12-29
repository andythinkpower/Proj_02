package _06_blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import _06_blog.model.BlogBean;
import _06_blog.model.BlogService;

@Controller
@RequestMapping(path = {"post.controller"})
@SessionAttributes(names= {"message"})
public class PostController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping(method= {RequestMethod.POST})
	public String post(BlogBean bean, Model model, 
//			String memberemail,
//			String articlename, String articletype, String editor, String pravicy, String uploadImage,
			HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println("post.controller");		
		System.out.println("articlecontent:"+bean.getArticlecontent());
		
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;	
			
			MultipartFile file=multiRequest.getFile("uploadImage");
			if(file.isEmpty()) {
				System.out.println("檔案是空的");
			}else {
				System.out.println("有傳檔案");
				ServletContext context=request.getServletContext();
				String filename=file.getOriginalFilename();
				String dbpath="/uploadFile/"+filename;
				String path=context.getRealPath("/uploadFile/"+filename);
				
				System.out.println("路徑"+path);
				file.transferTo(new File(path));
				bean.setBlogphoto(dbpath);				
			}			
		}		
		
//		bean.setMemberemail(memberemail);		
		boolean result=blogService.post(bean);
		
		Map<String, String> message = new HashMap<>();
		model.addAttribute("message", message);
		
		if(result) {
			message.put("post", "新增成功");
			return "post.success";
		}
		message.put("post", "新增失敗");
		return "post.error";
	}
}
