package _01_member.model;

import java.security.SecureRandom;
import java.sql.Blob;
import java.util.Set;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_member.CipherUtils;
import _01_member.EmailUtil;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	//Encrypt
	private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
	}
	
	//check password
	private boolean checkPass(String plainPassword, String hashedPassword) {
		if (BCrypt.checkpw(plainPassword, hashedPassword))
			return true;
		else
			System.out.println("The password does not match.");
		return false;
	}
	
//checkAccount
	public boolean checkAccount(String memberemail) {
		MemberBean bean= memberDao.select(memberemail);
		if(bean !=null) {
			return true;
		}
		return false;
	}
//login	
	public MemberBean login(String memberemail, String memberpassword) {
		MemberBean bean= memberDao.select(memberemail);
		if (bean != null) {
			if (memberpassword != null && memberpassword.length() != 0) {				

				String pass = bean.getMemberpassword();
				System.out.println("pass:"+pass);
				
				String temp = memberpassword;
				if (checkPass(temp,pass)) {
					System.out.println(checkPass(temp,pass));
					return bean;
				}
			}
		} 
		return null;
	}
//register	
	public MemberBean register(String memberemail, String memberpassword) {
		MemberBean bean =new MemberBean();
		bean.setMemberemail(memberemail);
		bean.setMemberpassword(hashPassword(memberpassword));
		bean.setMemberphoto("/uploadFile/default.jpg");
		boolean result=memberDao.insert(bean);
		if(result) {
//			String sendEmail = EmailUtil.sendEmail(memberemail, "註冊成功",
//			 "<h1>註冊成功</h1><br><a href='#'>重新登入<a/>",null);
//			System.out.println(".sendEmail:"+sendEmail);			
			
			bean=memberDao.select(memberemail);
			return bean;	
		}
		return null;
	}
	
//update
	public MemberBean update(MemberBean bean) {		
		memberDao.update(bean);
		MemberBean memberupdated=memberDao.select(bean.getMemberemail());
		return memberupdated;
	}

	public Set<EventsBean> showevents(MemberBean bean){
		return memberDao.showevents(bean);
	}
	public Set<RegionsBean> showregions(MemberBean bean){
		return memberDao.showregions(bean);
	}
	
//like type
	public MemberBean disliketype(MemberBean bean) {
		memberDao.deletetypes(bean);		
		return null;
	}
	public MemberBean liketype(MemberBean bean, String [] type) {
		memberDao.insertevents(bean, type);
		return null;
	}
	
//like region
	public MemberBean likeregion(MemberBean bean, String [] region) {
		memberDao.insertregions(bean, region);
		return null;
	}
	public MemberBean dislikeregion(MemberBean bean) {
		memberDao.deleteregions(bean);
		return null;
	}
	
	public MemberBean changepsw(MemberBean bean) {
		bean.setMemberpassword(hashPassword(bean.getMemberpassword()));
		memberDao.changepsw(bean);
		return null;
	}
	
	public String getRandomPassword() {
	    int z;
	    StringBuilder sb = new StringBuilder();
	    int i;
	    for (i = 0; i < 8; i++) {
	      z = (int) ((Math.random() * 7) % 3);
		 
	      if (z == 1) { // 放數字
	        sb.append((int) ((Math.random() * 10) + 48));
	      } else if (z == 2) { // 放大寫英文
	        sb.append((char) (((Math.random() * 26) + 65)));
	      } else {// 放小寫英文
	        sb.append(((char) ((Math.random() * 26) + 97)));
	      }
	    }
	    return sb.toString();
	  }
	
//test	
	public static void main(String[] args) {
		ApplicationContext context= new ClassPathXmlApplicationContext("text.xml");
		MemberService memberService=(MemberService) context.getBean("memberService");
		
		MemberBean bean=new MemberBean();
		bean.setMemberemail("nnn@gmail.com");
		System.out.println(memberService.checkAccount("nnn@gmail.com"));
				
		((ConfigurableApplicationContext)context).close();
	}

}
