package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	    String phone1 = request.getParameter("phone1");
	    String phone2 = request.getParameter("phone2");
	    String phone3 = request.getParameter("phone3");
	    String gender = request.getParameter("gender");
	    doGet(request, response);
	    
	    // SQL
	    Connection connection = null;
	    PreparedStatement preparedStatement;
	    Statement statement = null;
	    ResultSet resultSet = null;

	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/SQLDEV/Wallet_DinkDB";
	    String uid = "DA2307";
	    String upw = "Data2307";
	    String selectMemberQuery = "SELECT id, pw, name, phone1, phone2, phone3, gender FROM member";
	    String insertMemberQuery = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?)";
	    
	    try {
	        Class.forName(driver);
	        connection = DriverManager.getConnection(url, uid, upw);
	        statement = connection.createStatement();
	        
	        preparedStatement = connection.prepareStatement(insertMemberQuery);
	        preparedStatement.setString(1, id);
	        preparedStatement.setString(2, passwd);
	        preparedStatement.setString(3, name);
	        preparedStatement.setString(4, phone1);
	        preparedStatement.setString(5, phone2);
	        preparedStatement.setString(6, phone3);
	        preparedStatement.setString(7, gender);
	        preparedStatement.executeUpdate();
	        
	        resultSet = statement.executeQuery(selectMemberQuery);

	        while(resultSet.next()) {
	            String resultId = resultSet.getString("id");
	            String resultPw = resultSet.getString("pw");
	            String resultName = resultSet.getString("name");
	            String resultPhone1 = resultSet.getString("phone1");
	            String resultPhone2 = resultSet.getString("phone2");
	            String resultPhone3 = resultSet.getString("phone3");
	            String resultGender = resultSet.getString("gender");
	            
	            System.out.println("아이디: " + resultId);
	            System.out.println("비밀번호: " + resultPw);
	            System.out.println("이름: " + resultName);
	            System.out.println("전화번호: " + resultPhone1 + resultPhone2 + resultPhone3);
	            System.out.println("성별: " + resultGender);
	            
	            System.out.println();
	        }
	        
	        // 회원가입 완료 후 페이지 이동
	        response.sendRedirect("joinResult.jsp");
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	        // 회원가입 실패 시 페이지 이동
	        response.sendRedirect("join.html");
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


