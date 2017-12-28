package _01_member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _01_member.model.MemberService;

@Controller
@RequestMapping(path = { "/_01_blog/password.controller" })
public class PasswordController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(method = { RequestMethod.POST }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public boolean check() {
		
		return false;
	}
}
