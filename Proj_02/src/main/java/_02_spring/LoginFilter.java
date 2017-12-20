package _02_spring;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _01_member.model.MemberBean;
@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "mustLogin1", value = "/_02_activity/*"), 		
				@WebInitParam(name = "mustLogin2", value = "/_02_favorite/*")
		})
public class LoginFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	public void init(FilterConfig fConfig) throws ServletException {
//		System.out.println("濾波器初始化....");
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
//			System.out.println("這些路徑要檢查會員登入"+fConfig.getInitParameter(path));
		}
//		System.out.println("把上述路徑存起來 之後有用到這些路徑就必須檢查是否有 會員session物件");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
//			System.out.println("servletPath="+servletPath);
//			System.out.println("contextPath="+contextPath);
//			System.out.println("requestURI="+requestURI);
//			System.out.println("==============================");
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			//System.out.println("session 仍然有效?:"+isRequestedSessionIdValid);
			if (mustLogin()) {
				if (checkLogin(req)) {   //  需要登入，已經登入
					chain.doFilter(request, response);
				} else {				//  需要登入，尚未登入
					HttpSession session = req.getSession();
					session.setAttribute("requestURI", requestURI);
					if ( ! isRequestedSessionIdValid ) {
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					}
					resp.sendRedirect(contextPath + "/security/login.jsp");
					return;
				}
			} else {   //不需要登入
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Request / Response 型態錯誤");
		}
	}
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("member");
		//System.out.println("現在檢查Session物件 是否有一個屬性較做member : "+loginToken);
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}

	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				//System.out.println("sURL="+sURL);
				sURL = sURL.substring(0, sURL.length() - 1);
//				System.out.println("sURL="+sURL);
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}
	@Override
	public void destroy() {
	}
}