package kr.co.project;

import java.util.List;

public class BoardService {
    BoardDAO boardDAO;

    public BoardService() {
        boardDAO = new BoardDAO();
    }

    public List<BoardDTO> listArticles() {
        List<BoardDTO> articlesList = boardDAO.SelectAllArticles();
        return articlesList;
    }

    public int addArticle(BoardDTO article) {
        // TODO Auto-generated method stub
        return boardDAO.insertNewArticle(article);
    }
    
    public BoardDTO viewArticle(int articleNO) {
    	BoardDTO article = null;
    	article = boardDAO.selectArticle(articleNO);
    	return article;
    }
    
    public void modArticle(BoardDTO article) {
    	boardDAO.updateArticle(article);
    }

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);
		boardDAO.deleteArticle(articleNO);
		return articleNOList;
	}
	
	public int addReply(BoardDTO article) {
		return boardDAO.insertNewArticle(article);
	}

}
