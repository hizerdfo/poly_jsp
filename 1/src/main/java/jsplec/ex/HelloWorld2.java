package jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * Servlet implementation class HelloWorld2
 */
@WebServlet("/HWorld2")
public class HelloWorld2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorld2() {
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
//		doGet(request, response);
//		
//		System.out.println("doPost");
//		response.setContentType("text/html; charset=euc-kr");
//		PrintWriter pw = response.getWriter();
//		
//		pw.println("<html>");
//        pw.println("<head>");
//        pw.println("</head>");
//        pw.println("<body>");
//        pw.println("<h1>Post방식으로 호출되었습니다. HelloWorld!!!</h1>");
//        pw.println("</body>");
//        pw.println("</html>");
	    
	    System.out.println("doPost");
	      
	      request.setCharacterEncoding("UTF-8");
	      
	      String name = request.getParameter("name");
	      String id = request.getParameter("id");
	      String passwd = request.getParameter("passwd");
	      String[] hobby = request.getParameterValues("hobby");
	      
	      System.out.println("name : " + name + "| id : " + id + "| passwd : " + passwd);
	      System.out.println("hobby : " + Arrays.toString(hobby));
	      
	      response.setContentType("text/html; charset-UTF-8");
	      PrintWriter pw = response.getWriter();
	      
	      pw.println("<htmll>");
	      pw.println("<head>");
	      pw.println("</head>");
	      pw.println("<body>");
	      pw.println("이름 : " + name + "<br/>");
	      pw.println("아이디 : " + id + "<br/>");
	      pw.println("비밀번호 : " + passwd + "<br/>");
	      pw.println("취미 : " + Arrays.toString(hobby) + "<br/>");
	      pw.println("</body>");
	      pw.println("</html>");
	      
	      pw.close();


	}
	

}
