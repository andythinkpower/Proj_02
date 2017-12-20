package _02_controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Controller
public class FileController {

	@RequestMapping(path= {"/test.controller"},method= {RequestMethod.POST})
	public String xxx(HttpServletRequest request) throws IllegalStateException, IOException {
		long startTime=System.currentTimeMillis();
	//	System.out.println("檔案名稱 : "+input_file_name.getOriginalFilename());
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;	
			
			MultipartFile file=multiRequest.getFile("file");
			if(file.isEmpty()) {
				System.out.println("檔案是空的");
			}else {
				System.out.println("有傳檔案");
				ServletContext context=request.getServletContext();
				String filename=file.getOriginalFilename();
				String path=context.getRealPath("/uploadFile/"+filename);
				System.out.println("路徑"+path);
				file.transferTo(new File(path));	
				
			}
			
		}
		
		return "display";
	}
	
}
