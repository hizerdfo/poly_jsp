package kr.co.jsplec.ex;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO {
    private String url = "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/SQLDEV/Wallet_DinkDB";
    private String uid = "DA2307";
    private String upw = "Data2307";
    private DataSource ds;
    
    public MemberDAO() {
//        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
        
        try {
            Context ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle8g");         
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
        public ArrayList<MemberDTO> memberSelect() {
            ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                conn = DriverManager.getConnection(url, uid, upw);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("select * from member");
                
                while(rs.next()) {
                    String name = rs.getString("name");
                    String id = rs.getString("id");
                    String pw = rs.getString("pw");
                    String phone1 = rs.getString("phone1");
                    String phone2 = rs.getString("phone2");
                    String phone3 = rs.getString("phone3");
                    String gender = rs.getString("gender");
                    
                    MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
                    dtos.add(dto);
                }
            } catch(Exception e) {
                
            } finally {
                try {
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(conn != null) conn.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
            }
            
            return dtos;
        }
    }

