package kr.co.project;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    BoardService boardService;
    BoardDTO boardDTO;
    
    public void init(ServletConfig config) throws ServletException {
        boardService = new BoardService();
        boardDTO = new BoardDTO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = "";
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String action = request.getServletPath();

        System.out.println("action: " + action);
        try {
            List<BoardDTO> articlesList = new ArrayList<BoardDTO>();

            if (action.equals("/listArticles.do")) {
                articlesList = boardService.listArticles();
                request.setAttribute("articlesList", articlesList);
                nextPage = "/listArticles.jsp";
            } else if (action.equals("/articleForm.do")) {
                nextPage = "/articleForm.jsp";
            } else if (action.equals("/addArticle.do")) {
                Map<String, String> articleMap = upload(request, response);
                String title = articleMap.get("title");
                String content = articleMap.get("content");

                boardDTO.setParentNO(0);
                boardDTO.setId("");
                boardDTO.setTitle(title);
                boardDTO.setContent(content);
                boardService.addArticle(boardDTO);

                nextPage = "/listArticles.do";
            } else {
                nextPage = "/listArticles.jsp";
            }

            for (BoardDTO dto : articlesList) {
                System.out.println(dto.toString());
            }

            RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
            dispatch.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        Map<String, String> articleMap =  new HashMap<String, String>();
        String encoding ="utf -8";
        
        
        return null;
    }
}
