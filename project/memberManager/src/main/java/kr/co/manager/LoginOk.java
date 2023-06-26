package kr.co.manager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginOk")
public class LoginOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "Oracle 연결 성공");
        
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String url = "";
        
        MemberDTO member = null;
        
        MemberDAO dao = MemberDAO.getInstance();
        int result = dao.userCheck(id, pw);
        
        switch(result) {
            case 2:
                request.setAttribute("message", "회원 승인 대기중입니다.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                break;
            case 1:
                member = dao.getUser(id);
                String userType = request.getParameter("permission"); // 사용자 유형 가져오기
                String adminName = member.getName();
                
                    if (userType.equals("U")) {
                        // 사용자 로그인 성공 시 사용자 페이지로 이동
                        request.setAttribute("message", "사용자 로그인 성공");
                        response.sendRedirect("user.jsp");
                        return;
                    } else if (userType.equals("A")) {
                        // 관리자 로그인 성공 시 관리자 페이지로 이동
                        // 세션에 관리자 정보 저장
                        HttpSession session = request.getSession();
                        session.setAttribute("adminId", id);

                        response.sendRedirect("admin.jsp");
                    }
                    break;
                
            case 0:
                request.setAttribute("message", "비밀번호가 맞지 않습니다.");
                response.sendRedirect("login.jsp");
                break;
            case -1: 
                request.setAttribute("message", "존재하지 않는 회원입니다.");
                response.sendRedirect("login.jsp");
                break;
        }
    }

}
