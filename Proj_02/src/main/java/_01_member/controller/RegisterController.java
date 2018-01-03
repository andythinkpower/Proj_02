package _01_member.controller;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_member.CipherUtils;
import _01_member.model.MemberBean;
import _01_member.model.MemberService;

@Controller
@RequestMapping(path = { "/_01_member/register.controller" })
@SessionAttributes(names= {"member"})
public class RegisterController {

	@Autowired
	private MemberService memberService;	

	@RequestMapping(method = { RequestMethod.POST }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public boolean register(String memberemail, String memberpassword, Model model, HttpServletResponse response) {
		
		System.out.println("使用者輸入準備註冊的帳號和密碼:"+memberemail+":"+memberpassword);
		
		MemberBean bean=memberService.register(memberemail, memberpassword);
		
		if(bean==null) {
			return false;
		}
		
	return true;
	}	
}
