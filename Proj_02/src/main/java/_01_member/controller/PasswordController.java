package _01_member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _01_member.EmailUtil;
import _01_member.model.MemberBean;
import _01_member.model.MemberService;

@Controller
@RequestMapping(path = { "/_01_member/password.controller" })
public class PasswordController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(method = { RequestMethod.POST }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public boolean check(MemberBean bean, String memberemail) {
		System.out.println("password.controller");
		boolean result= memberService.checkAccount(memberemail);
		if(result) {
			bean.setMemberemail(memberemail);
			String randompassword= memberService.getRandomPassword();
			
			String sendEmail = EmailUtil.sendEmail(memberemail, "您的新密碼",
			 "<h1>新密碼</h1><br>您的新密碼為："+randompassword+"<br>請重新登入變更密碼",null);
			System.out.println(".sendEmail:"+sendEmail);
			
			bean.setMemberpassword(randompassword);
			memberService.changepsw(bean);
			System.out.println("success");			
		}else {		
			System.out.println("error");
			return false;
		}
		return true;
	}
}
