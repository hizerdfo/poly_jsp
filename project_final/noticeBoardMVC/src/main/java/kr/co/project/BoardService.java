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

    public void addArticle(BoardDTO article) {
        // TODO Auto-generated method stub
        boardDAO.insertNewArticle(article);
    }
}
