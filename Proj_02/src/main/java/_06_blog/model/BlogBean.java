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
	private int articleid;
	private String articlename;
	private String articlecontent;
	private java.util.Date posttime;
	private String articletype;
	private String pravicy;
	private int likenum=0;
	private int viewnum=1;
	private String memberemail;
	private String blogphoto="/uploadFile/default.jpg";
	

	
	@Override
	public String toString() {
		return "BlogBean [articleid=" + articleid + ", articlename=" + articlename + ", articlecontent="
				+ articlecontent + ", posttime=" + posttime + ", articletype=" + articletype + ", pravicy=" + pravicy
				+ ", likenum=" + likenum + ", viewnum=" + viewnum + ", memberemail=" + memberemail + ", blogphoto="
				+ blogphoto + "]";
	}
	public String getBlogphoto() {
		return blogphoto;
	}
	public void setBlogphoto(String blogphoto) {
		this.blogphoto = blogphoto;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
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
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getViewnum() {
		return viewnum;
	}
	public void setViewnum(int viewnum) {
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
