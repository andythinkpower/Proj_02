package _06_blog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="blogs")
public class BlogBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer articleid;
	private String articlename;
	private String articlecontent;
	private java.util.Date posttime;
	private String articletype;
	private String pravicy;
	private String likenum="0";
	private String viewnum="0";
	private String memberemail;
	

	@Override
	public String toString() {
		return "BlogBean [articleid=" + articleid + ", articlename=" + articlename + ", articlecontent="
				+ articlecontent + ", posttime=" + posttime + ", articletype=" + articletype + ", pravicy=" + pravicy
				+ ", likenum=" + likenum + ", viewnum=" + viewnum + ", memberemail=" + memberemail + "]";
	}
	public Integer getArticleid() {
		return articleid;
	}
	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}
	public String getArticlename() {
		return articlename;
	}
	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}
	public String getArticlecontent() {
		return articlecontent;
	}
	public void setArticlecontent(String articlecontent) {
		this.articlecontent = articlecontent;
	}
	public java.util.Date getPosttime() {
		return posttime;
	}
	public void setPosttime(java.util.Date posttime) {
		this.posttime = posttime;
	}
	public String getArticletype() {
		return articletype;
	}
	public void setArticletype(String articletype) {
		this.articletype = articletype;
	}	
	public String getLikenum() {
		return likenum;
	}
	public void setLikenum(String likenum) {
		this.likenum = likenum;
	}
	public String getViewnum() {
		return viewnum;
	}
	public void setViewnum(String viewnum) {
		this.viewnum = viewnum;
	}
	public String getPravicy() {
		return pravicy;
	}
	public void setPravicy(String pravicy) {
		this.pravicy = pravicy;
	}
	public String getMemberemail() {
		return memberemail;
	}
	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}
	
}
