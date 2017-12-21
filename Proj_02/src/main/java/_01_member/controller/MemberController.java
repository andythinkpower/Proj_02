package _01_member.controller;

import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import _01_member.SqlDateEditor;
import _01_member.model.MemberBean;
import _01_member.model.MemberService;

@Controller
@RequestMapping(path= {"member.controller"})
@SessionAttributes(names= {"member"})
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
			String liketype, String likeregion) {
		
		System.out.println(liketype);
		System.out.println(likeregion);		
		System.out.println(bean);
		
		String type[] = liketype.split(",");
		for(String u:type) {
			System.out.println(u);
		}
		String region[] =likeregion.split(",");
		for(String v:region) {
			System.out.println(v);
		}
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
	
	return "update.success";
	}
}
