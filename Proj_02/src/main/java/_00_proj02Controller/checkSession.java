package _00_proj02Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.SessionScope;

import _01_member.model.MemberBean;

@Controller
public class checkSession {
	@RequestMapping(
			path="/_05_web/checkMemSession.controller",
			method={RequestMethod.POST,RequestMethod.GET}
			)
	public void checkMemSession(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		MemberBean bean=(MemberBean)session.getAttribute("member");
		if(bean!=null) {
			String email=bean.getMemberemail();
			out.print(email);
		}else {out.print("null");}
			
	}
	
	
	
	
}
