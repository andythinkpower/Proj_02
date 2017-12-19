package _02_model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.MemberDAO;
import _02_model.Bean.MemberBean;

//Service 只需負責 business logic 部分 不需要撰寫任何資料庫相關程式 
@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberDAO memberDao;
	//private MemberDAO memberDao=new MemberDAOHibernate(HibernateUtil.getSessionFactory());
	//private MemberDAO memberDao=new MemberDAOjdbc();
	@Transactional(readOnly=true)
	public MemberBean login(String email, String psd) {

		MemberBean bean = memberDao.select(email);
		if (bean != null) {
			if (psd != null && psd.trim().length() != 0) {
				if (bean.getPsd().equals(psd)) {
					return bean;
				}
			}
		}
		return null;
	}
}
