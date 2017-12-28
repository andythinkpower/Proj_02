package _01_member.model;

import java.security.SecureRandom;
import java.sql.Blob;
import java.util.Set;

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
				if (temp.equals(pass)) {
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
		bean.setMemberpassword(memberpassword);
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
		memberDao.changepsw(bean);
		return null;
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
