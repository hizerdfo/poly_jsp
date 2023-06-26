package kr.co.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MemberEdit
 */
@WebServlet("/MemberEdit")
public class MemberEdit extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEdit() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("memberId");
        String name = request.getParameter("name");
        String pw = request.getParameter("pw");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String status = request.getParameter("status");
        
        String action = request.getParameter("action");

        if (id != null) {
            MemberDAO dao = MemberDAO.getInstance();
            MemberDTO member = dao.getUser(id);

            if (member != null) {
                if (action != null && action.equals("delete")) {
                    // 탈퇴 처리
                    dao.updateStatus(id, "D");

                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().print("success");
                    response.sendRedirect("commitMember.jsp");
                } else {
                    // 회원 정보 수정
                    dao.updateMember(id, name, pw, phone, email, status);

                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().print("success");
                    response.sendRedirect("commitMember.jsp");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("failure");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().print("failure");
        }
    }
}
