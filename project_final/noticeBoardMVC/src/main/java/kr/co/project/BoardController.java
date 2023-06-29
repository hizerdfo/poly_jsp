package kr.co.project;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
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
        HttpSession session;
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
                int articleNO = 0;
                Map<String, String> articleMap = upload(request, response);
                String title = articleMap.get("title");
                String content = articleMap.get("content");

                boardDTO.setParentNO(0);
                boardDTO.setId("hong");
                boardDTO.setTitle(title);
                boardDTO.setContent(content);
                boardService.addArticle(boardDTO);
                articleNO = boardService.addArticle(boardDTO);
                PrintWriter pw = response.getWriter();
                pw.print("<script>" + " alert('새 글을 추가했습니다.');"
                        + "location.href='" + request.getContextPath() + "/listArticles.do';"
                        + "</script>");
                return;
            } else if (action.equals("/viewArticle.do")) {
                String articleNO = request.getParameter("articleNO");
                boardDTO = boardService.viewArticle(Integer.parseInt(articleNO));
                request.setAttribute("article", boardDTO);
                nextPage = "/viewArticle.jsp";
            } else if (action.equals("/modArticle.do")) {
                Map<String, String> articleMap = upload(request, response);
                String articleNOParam = request.getParameter("articleNO");  // 수정된 부분: 수정하고자 하는 게시물 번호를 받아옴
                int articleNO = Integer.parseInt(articleMap.get("articleNO"));
                boardDTO.setArticleNO(articleNO);
                String title = articleMap.get("title");
                String content = articleMap.get("content");
                boardDTO.setParentNO(0);
                boardDTO.setId("hong");
                boardDTO.setTitle(title);
                boardDTO.setContent(content);

                boardService.modArticle(boardDTO);

                PrintWriter pw = response.getWriter();
                pw.print("<script>");
                pw.print("alert('글을 수정했습니다.');");
                pw.print("location.href='" + request.getContextPath() + "/viewArticle.do?articleNO=" + articleNO + "';");  // 수정된 부분: 수정이 완료된 게시물로 다시 이동
                pw.print("</script>");

                return;
            }else if(action.equals("/replyForm.do")) {
            	int parentNO = Integer.parseInt(request.getParameter("parentNO"));
            	session = request.getSession();
            	session.setAttribute("parentNO", parentNO);
            	nextPage = "/replyForm.jsp";
            }else if(action.equals("/addReply.do")) {
            	session = request.getSession();
            	int parentNO = (Integer) session.getAttribute("parentNO");
            	session.removeAttribute("parentNO");
            	Map<String, String> articleMap = upload(request, response);
            	String title = articleMap.get("title");
            	String content = articleMap.get("content");
            	
            	boardDTO.setParentNO(parentNO);
            	boardDTO.setId("lee");
            	boardDTO.setTitle(title);
            	boardDTO.setContent(content);
            	
            	int articleNO = boardService.addReply(boardDTO);
            	PrintWriter pw = response.getWriter();
            	pw.print("<script>");
                pw.print("alert('답글을 추가했습니다.');");
                pw.print("location.href='" + request.getContextPath() + "/viewArticle.do?articleNO=" + articleNO + "';");  // 수정된 부분: 수정이 완료된 게시물로 다시 이동
                pw.print("</script>");
            	
            }
            else if (action.equals("/removeArticle.do")) {
                int articleNO = Integer.parseInt(request.getParameter("articleNO"));
                List<Integer> articleNOList = boardService.removeArticle(articleNO);

                PrintWriter pw = response.getWriter();
                pw.print("<script>");
                pw.print("alert('글을 삭제했습니다.');");
                pw.print("location.href='" + request.getContextPath() + "/listArticles.do';");
                pw.print("</script>");

                return;
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
        Map<String, String> articleMap =  new HashMap<String, String>();
        String encoding ="utf-8";
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String articleNO = request.getParameter("articleNO"); // 수정된 부분: 게시물 번호를 가져옴
        
        articleMap.put("title", title);
        articleMap.put("content", content);
        articleMap.put("articleNO", articleNO); // 수정된 부분: 게시물 번호를 맵에 추가
        
        return articleMap;
    }
}
