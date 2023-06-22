package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * Servlet implementation class Beanex
 */
@WebServlet("/Beanex")
public class Beanex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Beanex() {
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
	    String name = request.getParameter("name");
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String phone = request.getParameter("phone");
        doGet(request, response);
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();
        
        pw.println("<htmll>");
        pw.println("<head>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<br>");
        pw.println("<h1>회원가입 완료</h1>");
        pw.println("이름 : " + name + "<br/>");
        pw.println("아이디 : " + id + "<br/>");
        pw.println("비밀번호 : " + passwd + "<br/>");
        pw.println("핸드폰 : " + phone + "<br/>");
        pw.println("</body>");
        pw.println("</html>");
        
        pw.close();
	}

}


