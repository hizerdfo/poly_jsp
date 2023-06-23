package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
	    String id = request.getParameter("id");
	    String passwd = request.getParameter("passwd");

	    Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;

	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/SQLDEV/Wallet_DinkDB";
	    String uid = "DA2307";
	    String upw = "Data2307";
	    String selectMemberQuery = "SELECT id, pw FROM member";

	    try {
	        Class.forName(driver);
	        connection = DriverManager.getConnection(url, uid, upw);
	        statement = connection.createStatement();

	        resultSet = statement.executeQuery(selectMemberQuery);

	        boolean validLogin = false;

	        while (resultSet.next()) {
	            String resultId = resultSet.getString("id");
	            String resultPw = resultSet.getString("pw");

	            if (id.equals(resultId) && passwd.equals(resultPw)) {
	                validLogin = true;
	                break;
	            }
	        }

	        if (validLogin) {
	            // 로그인 성공 시 세션 생성
	            HttpSession session = request.getSession(true);
	            session.setAttribute("id", id);

	            // 로그인 완료 후 페이지 이동
	            response.sendRedirect("loginResult.jsp");
	        } else {
	            // 로그인 실패 시 페이지 이동
	            response.sendRedirect("login.html");
	        }
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	        // 회원가입 실패 시 페이지 이동
	        response.sendRedirect("login.html");
	    } finally {
	        // 리소스 해제
	        if (resultSet != null) {
	            try {
	                resultSet.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (statement != null) {
	            try {
	                statement.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
}

