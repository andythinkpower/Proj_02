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

import _03_backStage.model.BlogsBackVO;
import _03_backStage.model.EventDAO;
import _03_backStage.model.EventService;
import _03_backStage.model.EventVO;

@WebServlet("/book/book.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
public class Event_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       System.out.println("hello");
		request.setCharacterEncoding("UTF-8"); // 處理中文檔名
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
	
		if ("insert".equals(action)) {
System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			System.out.println("2");
			try {
				System.out.println("3");
				PrintWriter out = response.getWriter();
				System.out.println("4");
				Integer EventID = Integer.valueOf(request.getParameter("EventID"));
				System.out.println(EventID);

				String EventName = request.getParameter("EventName");
				System.out.println(EventName);
				if (EventName == null || EventName.trim().length() == 0) {
					errorMsgs.add("活動名稱:空白");
					System.out.println("5");
				}
				String Fee = String.valueOf(request.getParameter("Fee"));
				String IsCharge = request.getParameter("IsCharge");
				System.out.println("121214234");
				String ImageFile = String.valueOf(request.getParameter("ImageFile"));
				System.out.println(ImageFile);
				System.out.println("6");
				String Date= request.getParameter("DtStart");
				System.out.println(Date);
				java.sql.Date DtStart = java.sql.Date.valueOf(Date);
				System.out.println(DtStart);
				if (Date == null || Date.trim().length() == 0) {
					errorMsgs.add("活動開始日期:空白");
					System.out.println("123");
				}
				String Date1= request.getParameter("DurationEnd");
				java.sql.Date DurationEnd = java.sql.Date.valueOf(Date1);
				System.out.println("a");
				if (Date1 == null || Date1.trim().length() == 0) {
					errorMsgs.add("活動結束日期:空白");
				}
				String Date3= request.getParameter("InsertTime");
				java.sql.Date InsertTime = java.sql.Date.valueOf(Date3);
				System.out.println("c");
				if (Date3 == null || Date3.trim().length() == 0) {
					errorMsgs.add("更新時間:空白");
				}
				String CityID = request.getParameter("CityID");
				if (CityID == null || CityID.trim().length() == 0) {
					errorMsgs.add("城市名:空白");
				}
				String AreaID = request.getParameter("AreaID");
				if (AreaID == null || AreaID.trim().length() == 0) {
					errorMsgs.add("地區:空白");
				}
				String Address = request.getParameter("Address");
				if (Address == null || Address.trim().length() == 0) {
					errorMsgs.add("地址:空白");
				}
				String ShowGroupName = request.getParameter("ShowGroupName");
				if (ShowGroupName == null || ShowGroupName.trim().length() == 0) {
					errorMsgs.add("演出單位:空白");
				}

				String EventTypeID= request.getParameter("EventTypeID");
				if (EventTypeID == null || EventTypeID.trim().length() == 0) {
					errorMsgs.add("活動連絡人:空白");
				}
				System.out.println("7");
				String VContent = request.getParameter("VContent");
				if (VContent == null || VContent.trim().length() == 0) {
					errorMsgs.add("活動內容:空白");
				}
				System.out.println("8");
				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");
				EventVO eventVO = new EventVO();
				eventVO.setEventID(EventID);
				eventVO.setEventName(EventName);
				eventVO.setFee(Fee);
				eventVO.setIsCharge(IsCharge);
				eventVO.setDtStart(DtStart);
				eventVO.setDurationEnd(DurationEnd);
//				eventVO.setTimeStart(Date2);
				eventVO.setInsertTime(InsertTime);
				eventVO.setCityID(CityID);
				eventVO.setAreaID(AreaID);
				eventVO.setAddress(Address);
				eventVO.setShowGroupName(ShowGroupName);
				eventVO.setEventTypeID(EventTypeID);
				eventVO.setVContent(VContent);
				eventVO.setImageFile(ImageFile);
				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						System.out.println("9");
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("EventVO", eventVO);
							response.sendRedirect("../_03_backStage/BookAdd.jsp");
							return;// 程式中斷
						}					
//						
//						InputStream ImageFile = part.getInputStream();
						
						EventDAO.insert(EventID, EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, InsertTime, CityID, AreaID, Address, ImageFile, EventTypeID, VContent);
						
//						ImageFile.close();
					}
				}
					
				response.sendRedirect("../_03_backStage/BookList.jsp");
				System.out.println("9");
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				response.sendRedirect("../_03_backStage/BookAdd.jsp");
			}
		}
		
		
		
		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer eventID = new Integer(request.getParameter("EventID"));
				System.out.println("1");
//				System.out.println(interests_ID);
				EventService bookSvc = new EventService();
				bookSvc.deleteevent01(eventID);
				String url = "/_03_backStage/BookList.jsp";
				RequestDispatcher sucessView = request.getRequestDispatcher(url);
				sucessView.forward(request, response);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = request.getRequestDispatcher("/_06_backStage/BookList.jsp");
//				failureView.forward(request, response);
				response.sendRedirect("../_03_backStage/BookList.jsp");
			}
		}
		
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				 Integer eventID = new Integer(request.getParameter("EventID").trim());

				 EventService bookSvc = new EventService();
				 EventVO eventVO = bookSvc.getOneBook(eventID);
				request.setAttribute("eventVO", eventVO);
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
			System.out.println("1");
			try {
				System.out.println("3");
				/* 1.接收請求參數 - 輸入格是式錯誤處理 */
				Integer EventID = new Integer(request.getParameter("EventID").trim());	
				System.out.println("4");
				System.out.println(EventID);
				String EventName = request.getParameter("EventName");
				if (EventName == null || EventName.trim().length() == 0) {
					errorMsgs.add("活動名稱:空白");
				}
				
				String Fee = String.valueOf(request.getParameter("Fee"));
				
				String ImageFile = String.valueOf(request.getParameter("ImageFile"));
				
				String IsCharge = String.valueOf(request.getParameter("IsCharge"));
				
			
				
				String date = request.getParameter("DtStart");
				java.sql.Date DtStart = java.sql.Date.valueOf(date);
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
			
				
				String EventTypeID= request.getParameter("EventTypeID");
				if (EventTypeID == null || EventTypeID.trim().length() == 0) {
					errorMsgs.add("活動連絡人:空白");
				}
				
				 
				String VContent = request.getParameter("VContent");
				if (VContent == null || VContent.trim().length() == 0) {
					errorMsgs.add("簡介:空白");
				}
				

				Collection<Part> parts = request.getParts();
				out.write("<h2> Total parts : " + parts.size() + "</h2>");
				
				
				EventVO eventVO = new EventVO();
				eventVO.setEventID(EventID);
				eventVO.setEventName(EventName);
				eventVO.setFee(Fee);
				eventVO.setIsCharge(IsCharge);
				eventVO.setDtStart(DtStart);
				eventVO.setDurationEnd(DurationEnd);
				eventVO.setShowGroupName(ShowGroupName);
				eventVO.setEventTypeID(EventTypeID);
				eventVO.setVContent(VContent);	
				eventVO.setImageFile(ImageFile);
				System.out.println("2");
				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
						if (!errorMsgs.isEmpty()) {
							request.setAttribute("EventVO", eventVO);
							RequestDispatcher failureView = request.getRequestDispatcher("/_03_backStage/BookInputUpdate.jsp");
							failureView.forward(request, response);
							return;// 程式中斷
						}	
						
//						InputStream ImageFile = part.getInputStream();
						
						EventDAO.update(EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, ImageFile, EventTypeID, VContent, EventID);
						
//						ImageFile.close();
						
					}else {
						EventDAO.update_noPic(EventName, Fee, IsCharge, DtStart, DurationEnd, ShowGroupName, EventTypeID, VContent, EventID);
					}
				}
				

				response.sendRedirect("../_03_backStage/BookList.jsp");

			} catch (Exception e) {
				System.out.println("5");
				errorMsgs.add(e.getMessage());
				System.out.println("6");
//				RequestDispatcher failureView = request.getRequestDispatcher("/_06_backStage/BookInputUpdate.jsp");
//				failureView.forward(request, response);
				response.sendRedirect("../_03_backStage/BookInputUpdate.jsp");
			}
		}
	}


	
	private String getFileNameFromPart(Part part) {

		String header = part.getHeader("content-disposition");
		String test = "form-data; name='ImageFile'";
		System.out.println("header = " + header);// 測試用
		// 得到的結果 header = form-data; name = "upfile"; filename = "儲值.jsp"
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
	
		System.out.println("filename = " + filename);
		if (filename.trim().length() == 0) {
			return null;
		}
		return filename;
	}

}
