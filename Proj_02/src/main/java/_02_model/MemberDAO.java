package _02_model;

import _02_model.Bean.MemberBean;

public interface MemberDAO {

	// 輸入帳號 取得帳號資料
	MemberBean select(String email);

	// 輸入密碼 更新手機 (未寫)
	boolean update(String psd, String phone);

}
