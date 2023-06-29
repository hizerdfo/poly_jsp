package kr.co.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FrontCon
 */
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        actionDo(request,response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	System.out.println("actionDo");
	
	String uri = request.getRequestURI();
	System.out.println("uri : "+ uri);
	
	String conPath = request.getContextPath();
	System.out.println("conPath: " + conPath);
	
	String command = uri.substring(conPath.length());
	System.out.println("command: " + command);
	
	if(command.equals("insert.do")) {
	    System.out.println("/insert.do");
	    System.out.println("=====================");
	}else if(command.equals("update.do")) {
	   System.out.println("/update.do");
	   System.out.println("=====================");
	}else if(command.equals("select.do")) {
	    System.out.println("/select.do");
	    System.out.println("=====================");
	}else if(command.equals("delete.do")) {
        System.out.println("/delete.do");
        System.out.println("=====================");
    }else if (command.equals("/memberList.do")) {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();

        Service actionInterface = new MembersAllService();
        ArrayList<MemberDTO> dtos = actionInterface.execute(request, response);
        
        // 가져온 회원 정보를 출력
        for (MemberDTO dto : dtos) {
            String id = dto.getId();
            String pw = dto.getPw();
            String name = dto.getName();
            String email = dto.getEmail();
            
            writer.println("ID: " + id + "<br>");
            writer.println("PW: " + pw + "<br>");
            writer.println("Name: " + name + "<br>");
            writer.println("Email: " + email + "<br>");
            writer.println("=====================<br>");
        }
    }
	}
}
