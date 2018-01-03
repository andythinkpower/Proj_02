package _03_backStage.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;

public class BlogsBackVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L; // 沒寫不會怎樣,寫了更好

	public BlogsBackVO() {
	} // 不帶參數的建構子

	// ====================private實例變數=============================
	
	private Integer ArticleId; // 1.部落格編號
	private String MemberEmail; // 2.留言會員E-Mail
	private String ArticleContent; // 3.部落格內容
	private String ArticleName; // 4.名稱
	private String BlogPhoto; // 5.部落格貼圖
	private Date PostTime; // 6.留言時間
	private Integer ViewNum; // 7.觀看數
	private String ArticleType; // 8.部落格類型
	private Integer LikeNum; // 9.檢舉數

	// ==============================================================
	
	// ====================getter跟setter=============================	
	public Integer getArticleId() {
		return ArticleId;
	}
	public void setArticleId(Integer articleId) {
		ArticleId = articleId;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public String getArticleContent() {
		return ArticleContent;
	}
	public void setArticleContent(String articleContent) {
		ArticleContent = articleContent;
	}
	public String getArticleName() {
		return ArticleName;
	}
	public void setArticleName(String articleName) {
		ArticleName = articleName;
	}
	public String getBlogPhoto() {
		return BlogPhoto;
	}
	public void setBlogPhoto(String blogPhoto) {
		BlogPhoto = blogPhoto;
	}
	public Date getPostTime() {
		return PostTime;
	}
	public void setPostTime(Date postTime) {
		PostTime = postTime;
	}
	public Integer getViewNum() {
		return ViewNum;
	}
	public void setViewNum(Integer viewNum) {
		ViewNum = viewNum;
	}
	public String getArticleType() {
		return ArticleType;
	}
	public void setArticleType(String articleType) {
		ArticleType = articleType;
	}
	public Integer getLikeNum() {
		return LikeNum;
	}
	public void setLikeNum(Integer likeNum) {
		LikeNum = likeNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	

}
