package _01_member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import _01_member.SqlDateEditor;
import _01_member.model.MemberBean;
import _01_member.model.MemberService;

@Controller
@RequestMapping(path= {"member.controller"})
@SessionAttributes(names= {"member", "message"})
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@InitBinder
	public void initialize(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class, "memberbdate", 
				new SqlDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping(method = { RequestMethod.POST })
	public String edit(MemberBean bean, BindingResult bindingResult, Model model, 
			String liketype, String likeregion, String submitbtn,
			HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println(liketype);
		System.out.println(likeregion);		
		System.out.println(bean);
		
		String type[] = liketype.split(",");

		String region[] =likeregion.split(",");
		
		
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;	
			
			MultipartFile file=multiRequest.getFile("memberphoto");
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
				bean.setMemberphoto(dbpath);				
			}			
		}
		
		

		if("修改密碼".equals(submitbtn)) {
			
			MemberBean bean3=memberService.changepsw(bean);
			
		}else {
			MemberBean bean2=memberService.update(bean);
			memberService.disliketype(bean);
			memberService.dislikeregion(bean);
			memberService.liketype(bean,type);
			memberService.likeregion(bean, region);
				
			if(bean2==null) {			
				return "update.error";
			} else {
				model.addAttribute("member", bean2);
			}
		}
		
		Map<String, String> message = new HashMap<>();
		model.addAttribute("message", message);
		message.put("success", "修改成功");
	
	return "update.success";
	}
}
