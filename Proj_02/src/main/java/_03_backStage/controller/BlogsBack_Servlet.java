package _03_backStage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import _03_backStage.model.*;

@WebServlet("/msg/msg.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
public class BlogsBack_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 處理中文檔名
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		
		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			System.out.println("2a");
//			System.out.println(articleId);
			try {
				System.out.println("3a");
				Integer articleId = new Integer(request.getParameter("ArticleId"));
				System.out.println("ArticleId");
				BlogsBackService blogsSvc = new BlogsBackService();
				blogsSvc.deleteBlogs(articleId);
				String url = "/_03_backStage/MessageList.jsp";
				System.out.println("4b");
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				response.sendRedirect("../_03_backStage/MessageList.jsp");
			}
		}

		if ("hide".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = response.getWriter();
			try {
				/* 1.接收請求參數 - 輸入格是式錯誤處理 */

				Integer ArticleId = new Integer(request.getParameter("ArticleId").trim());
				System.out.println(ArticleId);

				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");

				BlogsBackVO blogsBackVO = new BlogsBackVO();
				blogsBackVO.setArticleId(ArticleId);

				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("BlogsBackVO", blogsBackVO);
							RequestDispatcher failureView = request
									.getRequestDispatcher("/_03_backStage/MessageList.jsp");
							failureView.forward(request, response);
							return;// 程式中斷
						}

					} else{
						BlogsBackDAO.hide(ArticleId);
					}
				}

				/* 新增完成，準備轉交 */
				String url = "/_03_backStage/MessageList.jsp";
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/_03_backStage/MessageList.jsp");
				failureView.forward(request, response);
			}
		}
		if ("display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = response.getWriter();
			try {
				/* 1.接收請求參數 - 輸入格是式錯誤處理 */

				Integer ArticleId = new Integer(request.getParameter("ArticleId").trim());
				System.out.println(ArticleId);


				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");

				BlogsBackVO blogsBackVO = new BlogsBackVO();
				blogsBackVO.setArticleId(ArticleId);
				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("BlogsBackVO", blogsBackVO);
							RequestDispatcher failureView = request
									.getRequestDispatcher("/_03_backStage/MessageList.jsp");
							failureView.forward(request, response);
							return;// 程式中斷
						}

					} else {
						BlogsBackDAO.display(ArticleId);
					}
				}

				/* 新增完成，準備轉交 */
				String url = "/_03_backStage/MessageList.jsp";
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/_03_backStage/MessageList.jsp");
				failureView.forward(request, response);
			}
		}
		
	}
	
	
	//

	private String getFileNameFromPart(Part part) {

		String header = part.getHeader("content-disposition");
		String test = "form-data; name='ProductListingBook_Picture'";
		System.out.println("header = " + header);// 測試用
		// 得到的結果 header = form-data; name = "upfile"; filename = "儲值.jsp"
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		// if(header.equals(test)&& filename.trim().length()==0){
		// filename =
		// }
		//
		System.out.println("filename = " + filename);
		if (filename.trim().length() == 0) {
			return null;
		}
		return filename;
	}

}
