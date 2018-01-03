package _01_member.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_member.GlobalService;
import _01_member.model.EventsBean;
import _01_member.model.MemberBean;
import _01_member.model.MemberService;
import _01_member.model.RegionsBean;

@Controller
@SessionAttributes(names= {"member","types","regions","errors"})
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@InitBinder
	public void initialize(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class, "memberbdate", 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping(path= {"/_01_member/fblogin.controller"}, method= {RequestMethod.GET}, produces = { "application/json;charset=UTF-8" })	
	@ResponseBody
	public void fblogin(MemberBean bean, String memberemail, Model model, HttpServletResponse response) {

		System.out.println("fblogin.controller");
		String memberpassword= "null";					
		
		MemberBean bean2= memberService.login(memberemail, memberpassword);

			model.addAttribute("member", bean2);
			System.out.println("bean2:"+bean2);
			Cookie cookieUser = null;
			cookieUser = new Cookie("user", memberemail);
			response.addCookie(cookieUser);
	}

	@RequestMapping(path = { "login.controller" }, method = { RequestMethod.POST })
	public String login(String memberemail, String memberpassword, 
			MemberBean bean, BindingResult bindingResult, Model model, HttpServletRequest request,
			HttpServletResponse response, String rememberme, String fb) {
		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (memberemail == null || memberemail.trim().length() == 0) {
			errors.put("erremail", "請輸入帳號");
		}
		if (memberpassword == null || memberpassword.trim().length() == 0) {
			errors.put("errpsw", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "login.error";
		}
		
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		if (rememberme != null) {   // rm存放瀏覽器送來之RememberMe的選項
			cookieUser = new Cookie("user", memberemail);
			cookieUser.setMaxAge(30*60*60);
			cookieUser.setPath(request.getContextPath());
			// 稍微編碼(不算是加密)
			//String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
			String encodePassword = GlobalService.encryptString(memberpassword);
//			System.out.println("--->" + encodePassword + "<---");
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(30*60*60);
			cookiePassword.setPath(request.getContextPath());
			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(30*60*60);
			cookieRememberMe.setPath(request.getContextPath());
		} else {
			cookieUser = new Cookie("user", memberemail);
			cookieUser.setMaxAge(30*60*60);   // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());
			//String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
			String encodePassword = GlobalService.encryptString(memberpassword);
//			System.out.println("--->" + encodePassword + "<---");
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());
			cookieRememberMe = new Cookie("rm", "false");
			cookieRememberMe.setMaxAge(30*60*60);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		
		boolean bean3=memberService.checkAccount(memberemail);
		if(bean3==false) {
			errors.put("erremail", "帳號輸入有誤");
			return "login.error";
		}
		MemberBean bean2=memberService.login(memberemail, memberpassword);
		Set<EventsBean> events=memberService.showevents(bean);
		Set<RegionsBean> regions=memberService.showregions(bean);
		System.out.println(events);
		System.out.println(regions);
		
		if(bean2==null) {
			errors.put("errpsw", "登入失敗");
			errors.put("account", memberemail);
			return "login.error";
		} else {
			model.addAttribute("member", bean2);
			model.addAttribute("types", events);
			model.addAttribute("regions", regions);
			System.out.println("bean2:"+bean2);
		}
		
	return "login.success";
	}
}
