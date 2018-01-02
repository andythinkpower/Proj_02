package _03_backStage.model;

import java.sql.SQLException;
import java.util.List;


public class BlogsBackService {
	private BlogsBackDAO_interface dao;
	
	public BlogsBackService() {
			dao = new BlogsBackDAO();
	}

	public List<BlogsBackVO> getAll(){
		return dao.getAll();
	}
	
//	public void hideMessageBoard(Integer MessageBoard_ID) throws SQLException {
//		dao.hide(MessageBoard_ID);
//	}
//	public void displayMessageBoard(Integer MessageBoard_ID) throws SQLException {
//		dao.display(MessageBoard_ID);
//	}
	public void deleteBlogs(Integer ArticleId) throws SQLException {
		dao.delete(ArticleId);
	}
	public BlogsBackVO getOneBook(Integer ArticleId) {
		return dao.findByPrimaryKey(ArticleId);
	}

//	public BlogsBackVO updateMessageBoard(String MessageBoard_Name, Float MessageBoard_Price, Float MessageBoard_Discount,
//			Integer MessageBoard_Quantity, Date MessageBoard_Publishedate, String MessageBoard_Publisher,
//			InputStream MessageBoard_Picture, String MessageBoard_Authors, String MessageBoard_Des) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
