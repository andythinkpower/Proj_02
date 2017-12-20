package _03_backStage.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
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

import org.hibernate.hql.internal.ast.SqlASTFactory;

import com.sun.xml.internal.bind.v2.runtime.Name;

import _03_backStage.model.EventDAO;
import _03_backStage.model.EventService;
import _03_backStage.model.EventVO;

@WebServlet("/book/book.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
public class Event_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 處理中文檔名
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		
		
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/* 1.接收請求參數 - 輸入格是式錯誤處理 */
				PrintWriter out = response.getWriter();
				
				String EventName = request.getParameter("EventName");
				if (EventName == null || EventName.trim().length() == 0) {
					errorMsgs.add("活動名稱:空白");
				}


				String Fee = String.valueOf(request.getParameter("Fee"));
				
				
				String FeeString = String.valueOf(Fee);

				String IsCharge = String.valueOf(request.getParameter("IsCharge"));
							
				String IsChargeString = String.valueOf(IsCharge);

				String date= request.getParameter("DurationStart");
				java.sql.Date DurationStart = java.sql.Date.valueOf(date);
				if (date == null || date.trim().length() == 0) {
					errorMsgs.add("活動開始日期:空白");
				}
				String date1= request.getParameter("DurationEnd");
				java.sql.Date DurationEnd = java.sql.Date.valueOf(date);
				if (date == null || date.trim().length() == 0) {
					errorMsgs.add("活動開始日期:空白");
				}

				String ShowGroupName = request.getParameter("ShowGroupName");
				if (ShowGroupName == null || ShowGroupName.trim().length() == 0) {
					errorMsgs.add("演出單位:空白");
				}

				
				String ContactName= request.getParameter("ContactName");
				if (ContactName == null || ContactName.trim().length() == 0) {
					errorMsgs.add("活動連絡人:空白");
				}

				 
				String BriefIntroduction = request.getParameter("BriefIntroduction");
				if (BriefIntroduction == null || BriefIntroduction.trim().length() == 0) {
					errorMsgs.add("活動簡介:空白");
				}

				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");
				EventVO EventVO = new EventVO();
				EventVO.setEventName(EventName);
				EventVO.setFee(Fee);
				EventVO.setIsCharge(IsCharge);
				EventVO.setDurationStart(DurationStart);
				EventVO.setDurationEnd(DurationEnd);
				EventVO.setShowGroupName(ShowGroupName);
				EventVO.setContactName(ContactName);
				EventVO.setBriefIntroduction(BriefIntroduction);				

				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("ProductListingBookVO", EventVO);
							response.sendRedirect("../_06_backStage/BookAdd.jsp");

							return;// 程式中斷
						}					
						
						InputStream ImageFile = part.getInputStream();
						
						EventDAO.insert(EventName, Fee, IsCharge, DurationStart, DurationEnd, ShowGroupName, ImageFile, ContactName, BriefIntroduction);
						
						ImageFile.close();
					}
				}
				
				
				/*新增完成，準備轉交 */

				response.sendRedirect("../_03_backStage/BookList.jsp");
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());

				response.sendRedirect("../_03_backStage/BookAdd.jsp");
			}
		}
		
		
		
		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer EventID = new Integer(request.getParameter("EventID"));

//				System.out.println(interests_ID);
				
				EventService bookSvc = new EventService();
				bookSvc.deleteevent01(EventID);

				String url = "/_06_backStage/BookList.jsp";
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());

				response.sendRedirect("../_06_backStage/BookList.jsp");
			}
		}
		
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/* 1.接收請求參數 */
				 Integer EventID = new Integer(request.getParameter("EventID"));


				/* 2.開始查詢資料 */
				 EventService bookSvc = new EventService();
				 EventVO productListingBookVO = bookSvc.getOneBook(EventID);
				/* 3.查詢完成，準備轉交 */
				request.setAttribute("EventVO", productListingBookVO);
				String url = "/_03_backStage/BookInputUpdate.jsp";
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());

				response.sendRedirect("../_03_backStage/BookList.jsp");
			}
		}
		
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = response.getWriter();
			try {
				
				Integer EventID = new Integer(request.getParameter("EventID").trim());	
				System.out.println(EventID);
				String EventName = request.getParameter("EventName");
				if (EventName == null || EventName.trim().length() == 0) {
					errorMsgs.add("活動名稱:空白");
				}

				String Fee = String.valueOf(request.getParameter("Fee"));
				

				
				String IsCharge = String.valueOf(request.getParameter("IsCharge"));
				

				
				String date = request.getParameter("DurationStart");
				java.sql.Date DurationStart = java.sql.Date.valueOf(date);
				if(date == null || date.trim().length() == 0 ){
					errorMsgs.add("活動開始日期:空白");
				}

				String date1= request.getParameter("DurationEnd");
				java.sql.Date DurationEnd = java.sql.Date.valueOf(date);
				if (date == null || date.trim().length() == 0) {
					errorMsgs.add("活動結束日期:空白");
				}
				String ShowGroupName = request.getParameter("ShowGroupName");
				if (ShowGroupName == null || ShowGroupName.trim().length() == 0) {
					errorMsgs.add("演出單位:空白");
				}

				
				String ContactName= request.getParameter("ContactName");
				if (ContactName == null || ContactName.trim().length() == 0) {
					errorMsgs.add("活動連絡人:空白");
				}

				 
				String BriefIntroduction = request.getParameter("BriefIntroduction");
				if (BriefIntroduction == null || BriefIntroduction.trim().length() == 0) {
					errorMsgs.add("簡介:空白");
				}


				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");
				
				
				EventVO EventVO = new EventVO();
				EventVO.setEventID(EventID);
				EventVO.setEventName(EventName);
				EventVO.setFee(Fee);
				EventVO.setIsCharge(IsCharge);
				EventVO.setDurationStart(DurationStart);
				EventVO.setDurationEnd(DurationEnd);
				EventVO.setShowGroupName(ShowGroupName);
				EventVO.setContactName(ContactName);
				EventVO.setBriefIntroduction(BriefIntroduction);		

				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("EventVO", EventVO);
							RequestDispatcher failureView = request.getRequestDispatcher("/_03_backStage/BookInputUpdate.jsp");
							failureView.forward(request, response);
							return;// 程式中斷
						}	
						
						InputStream ImageFile = part.getInputStream();
						
						EventDAO.update(EventName, Fee, IsCharge, DurationStart, DurationEnd, ShowGroupName, ImageFile, ContactName, BriefIntroduction, EventID);
						
						ImageFile.close();
						
					}else {
						EventDAO.update_noPic(EventName, Fee, IsCharge, DurationStart, DurationEnd, ShowGroupName, ContactName, BriefIntroduction, EventID);
					}
				}

				response.sendRedirect("../_03_backStage/BookList.jsp");

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());

				response.sendRedirect("../_03_backStage/BookInputUpdate.jsp");
			}
		}
	}


	
	private String getFileNameFromPart(Part part) {

		String header = part.getHeader("content-disposition");
		String test = "form-data; name='ImageFile'";
		System.out.println("header = " + header);// 測試用

		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
	
		System.out.println("filename = " + filename);
		if (filename.trim().length() == 0) {
			return null;
		}
		return filename;
	}

}
