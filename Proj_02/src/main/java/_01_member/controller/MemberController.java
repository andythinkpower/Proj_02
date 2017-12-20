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
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping(method = { RequestMethod.POST })
	public String edit(MemberBean bean, BindingResult bindingResult, Model model) {
		
//		if(bindingResult.getFieldError("memberbdate") !=null) {			
//		}
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date=sdf.format(memberbdate);
//		java.util.Date parseDate=null;
//		try {
//			parseDate = sdf.parse(date);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		System.out.println(bean);
		
		MemberBean bean2=memberService.update(bean);
		if(bean2==null) {			
			return "update.error";
		} else {
			model.addAttribute("member", bean2);
		}
	
	return "update.success";
	}
}
