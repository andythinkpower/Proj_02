package _01_member.model;

import java.sql.Blob;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDAO memberDao;
//login	
	public MemberBean login(String memberemail, String memberpassword) {
		MemberBean bean= memberDao.select(memberemail);
		if (bean != null) {
			if (memberpassword != null && memberpassword.length() != 0) {
				String pass = bean.getMemberpassword();
				String temp = memberpassword;
				if (pass.equals(temp)) {
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
		memberDao.insert(bean);
		bean=memberDao.select(memberemail);
		return bean;
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
	
//test	
	public static void main(String[] args) {
		ApplicationContext context= new ClassPathXmlApplicationContext("beans.config.xml");
		MemberService memberService=(MemberService) context.getBean("memberService");
		
		MemberBean bean=new MemberBean();
		bean.setMemberemail("nnn@gmail.com");
		System.out.println(memberService.showevents(bean));
				
		((ConfigurableApplicationContext)context).close();
	}

}
