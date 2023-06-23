package kr.co.jsplec.ex;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class modifyOk
 */
public class modifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("id");
	    String passwd = request.getParameter("passwd");
	    String name = request.getParameter("name");
	    String phone1 = request.getParameter("phone1");
	    String phone2 = request.getParameter("phone2");
	    String phone3 = request.getParameter("phone3");

	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink";
	    String uid = "scott";
	    String upw = "tiger";
	    String updateMemberQuery = "UPDATE member SET name=?, phone1=?, phone2=?, phone3=?, pw=? WHERE id=?";

	    try {
	        Class.forName(driver);
	        connection = DriverManager.getConnection(url, uid, upw);

	        preparedStatement = connection.prepareStatement(updateMemberQuery);
	        preparedStatement.setString(1, name);
	        preparedStatement.setString(2, phone1);
	        preparedStatement.setString(3, phone2);
	        preparedStatement.setString(4, phone3);
	        preparedStatement.setString(5, passwd);
	        preparedStatement.setString(6, id);

	        int rowsUpdated = preparedStatement.executeUpdate();

	        if (rowsUpdated > 0) {
	            // 업데이트 성공 시 처리할 내용
	            response.sendRedirect("modifyResult.jsp");
	        } else {
	            // 업데이트 실패 시 처리할 내용
	        }
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	        // 업데이트 실패
	    } finally {
	        // 리소스 해제
	        if (preparedStatement != null) {
	            try {
	                preparedStatement.close();
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
