package _02_controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//檔案不能超過10Mb
@MultipartConfig()
@WebServlet("/test.test")
public class TestFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    //上傳檔案無法使用get

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//getPart裡面輸入的字串為 表單中file 的name名稱
        Part photo = request.getPart("input_file_name");
        //取得上傳資料的名稱和附檔名 ex:dog.jpg       
        String filename = photo.getSubmittedFileName();
        System.out.println(filename);
        
       byte[] img = new byte[(int)photo.getSize()];
       
        
        try(InputStream in = photo.getInputStream();  
        		
        	//選擇輸出到指定路徑
            OutputStream out = new FileOutputStream("C:\\Users\\Student\\Desktop\\book\\"+filename )) {
        	
            byte[] buffer = new byte[1024];
            int length = -1;
             
            while ((length = in.read(buffer)) != -1) {
                out.write(buffer, 0, length);
            }
        }
        
        
        
        
        
    }
}