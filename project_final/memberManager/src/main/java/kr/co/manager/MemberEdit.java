package kr.co.manager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MemberEdit")
public class MemberEdit extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public MemberEdit() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("memberId");
        String name = request.getParameter("name");
        String currentPw = request.getParameter("pw"); 
        String newPw = request.getParameter("newPw"); 
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String status = request.getParameter("status");

        String action = request.getParameter("action");

        if (id != null) {
            MemberDAO dao = MemberDAO.getInstance();
            MemberDTO member = dao.getUser(id);

            if (member != null) {
                if (action != null && action.equals("delete")) {
                    dao.updateStatus(id, "D");

                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().print("success");
                    response.sendRedirect("commitMember.jsp");
                } else {
                    if (newPw != null && !newPw.isEmpty()) {
                        
                        dao.updateMember(id, name, newPw, phone, email, status);
                    } else {
                        dao.updateMember(id, name, currentPw, phone, email, status);
                    }
                    RequestDispatcher dispatcher = request.getRequestDispatcher("commitMember.jsp");
                    dispatcher.forward(request, response);
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().print("success");
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
