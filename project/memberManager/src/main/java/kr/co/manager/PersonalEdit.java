package kr.co.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class PersonalEdit
 */
@WebServlet("/PersonalEdit")
public class PersonalEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String memberId = request.getParameter("memberId");
	    String name = request.getParameter("name");
	    String pw = request.getParameter("pw");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String status = request.getParameter("status");
	    
	    
	    String newPw = request.getParameter("newPw");
	    
	    MemberDAO dao = MemberDAO.getInstance();
	    MemberDTO member = dao.getUser(memberId);

	    if (member != null) {
	        if (newPw != null && !newPw.isEmpty()) {
	            // 새로운 비밀번호가 입력된 경우
	            dao.updateMember(memberId, name, newPw, phone, email, status);
	        } else {
	            // 새로운 비밀번호가 입력되지 않은 경우
	            dao.updateMember(memberId, name, pw, phone, email, status);
	        }

	        // 세션 정보 업데이트
	        HttpSession session = request.getSession();
	        session.setAttribute("memberId", memberId);

	        response.sendRedirect("personalEdit.jsp");
	    } else {
	        response.sendRedirect("login.jsp");
	    }
	}
	    
}


