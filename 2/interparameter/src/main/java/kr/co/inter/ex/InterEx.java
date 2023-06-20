package kr.co.inter.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class InterEx

@WebServlet(urlPatterns= {"/InterEx"}, initParams= {
        @WebInitParam(name="dbId", value="abcde"),
        @WebInitParam(name="dbPwd", value="1234556"),
        @WebInitParam(name="dbSid", value="orac")
    })*/ 
@WebServlet("/InterEx")
public class InterEx extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InterEx() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("doGet");
		String dbId = getServletContext().getInitParameter("dbId");
		String dbPwd = getServletContext().getInitParameter("dbPwd");
		String dbSid = getServletContext().getInitParameter("dbSid");
		String testId = getServletContext().getInitParameter("testId");
		System.out.println("dbId : " + dbId + "| dbPwd: " + dbPwd + "| dbsid : " + dbSid);
		
		PrintWriter pw = response.getWriter();
		pw.write("<html>");
		pw.write("<head>");
		pw.write("</head>");
		pw.write("<body>");
		pw.write("dbId: " + dbId + "<br  />");
		pw.write("dbPwd: " + dbPwd + "<br  />");
        pw.write("dbSid: " + dbSid + "<br  />");
        pw.write("testId: " + testId + "<br  />");
		pw.write("</body>");
		pw.write("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		System.out.println("doPost");
        String dbId = getInitParameter("dbId");
        String dbPwd = getInitParameter("dbPwd");
        String dbSid = getInitParameter("dbSid");
        String testId = getInitParameter("testId");
        System.out.println("dbId : " + dbId + "| dbPwd: " + dbPwd + "| dbsid : " + dbSid);
        
        PrintWriter pw = response.getWriter();
        pw.write("<html>");
        pw.write("<head>");
        pw.write("</head>");
        pw.write("<body>");
        pw.write("dbId: " + dbId + "<br  />");
        pw.write("dbPwd: " + dbPwd + "<br  />");
        pw.write("dbSid: " + dbSid + "<br  />");
        pw.write("testId: " + testId + "<br  />");
        pw.write("</body>");
        pw.write("</html>");
	}

}
