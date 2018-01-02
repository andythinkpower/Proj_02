package _03_backStage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _03_backStage.model.BackStageLoginService;
import _03_backStage.model.ManagerVO;


@WebServlet("/_03_backStage/login2.aa")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		System.out.println("hahaha");
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("pswd");
		
		String requestURI = (String) session.getAttribute("requestURI");
		
		if (userId == null || userId.trim().length() == 0)
		{
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		
		if (password == null || password.trim().length() == 0)
		{
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}
		
		if (!errorMsgMap.isEmpty())
		{
			RequestDispatcher rd = request.getRequestDispatcher("login2.jsp");
			rd.forward(request, response);
			return;
		}
		
		BackStageLoginService bsls;
		
		try
		{
			bsls = new BackStageLoginService();
			ManagerVO mg = bsls.checkPassword(userId, password);
			
			
			if (mg != null)
			{
				session.setAttribute("MLoginOK", mg);
			} else
			{
				
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
			
		} catch (NamingException e)
		{
			errorMsgMap.put("LoginError", "LoginServlet->NamingException:" + e.getMessage());
		} catch (SQLException e)
		{
			errorMsgMap.put("LoginError", "LoginServlet->SQLException:" + e.getMessage());
			e.printStackTrace();
		}
		
		if (errorMsgMap.isEmpty())
		{
			// 此時不要用下面兩個敘述，因為網址列的URL不會改變
			// RequestDispatcher rd = request.getRequestDispatcher("...");
			// rd.forward(request, response);
			if (requestURI != null)
			{
				requestURI = (requestURI.length() == 0 ? request.getContextPath() : requestURI);
//				response.sendRedirect(response.encodeRedirectURL(requestURI));
				response.sendRedirect(request.getContextPath() + "/_03_backStage/BackStage.jsp");
				return;
			} else
			{
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				System.out.println(request.getContextPath());
				return;
			}
		} else
		{
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			RequestDispatcher rd = request.getRequestDispatcher("_03_backStage/BackStage.jsp");
			rd.forward(request, response);
			return;
		}
	}
}
