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
	
	@RequestMapping(method = { RequestMethod.POST })
	public String register(String memberemail, String memberpassword, Model model, HttpServletResponse response) {
		
		System.out.println(memberemail+" : "+memberpassword);
		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (memberemail == null || memberemail.trim().length() == 0) {
			errors.put("erremail", "請輸入帳號");
		}
		if (memberpassword == null || memberpassword.trim().length() == 0) {
			errors.put("errpsw", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "register.error";
		}
		
		String key = "kittymickysnoopy"; // 對稱式金鑰
		byte[] iv = new byte[128 / 8]; // 初始向量
		SecureRandom srnd = new SecureRandom();
		srnd.nextBytes(iv);
		
		String plainText = memberpassword;
		String cipherText = "";
//		String decryptedString = "";
		
		try {
			// encryptString(key, plainText, iv) : 將明文轉換為密文
			cipherText = CipherUtils.encryptString(key, plainText, iv);
			// decryptString(key, cipherText, iv) : 將密文還原為明文
//			decryptedString = CipherUtils.decryptString(key, cipherText, iv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		memberpassword=cipherText;
		
		MemberBean bean=memberService.register(memberemail, memberpassword);
		
		if(bean==null) {
			errors.put("errpsw", "註冊失敗");
			return "register.error";
		} else {
			model.addAttribute("member", bean);
		}
	
	return "register.success";
	}	
}
