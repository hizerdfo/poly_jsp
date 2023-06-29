package kr.co.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
    private String url = "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/SQLDEV/Wallet_DinkDB";
    private String uid = "DA2307";
    private String upw = "Data2307";
    private DataSource ds;
    private static MemberDAO instance;
    
    public MemberDAO() {
    
        try {
            Context ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle8g");         
            System.out.println("Oracle 연결 성공");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static MemberDAO getInstance() {
        if(instance == null) {
            synchronized(MemberDAO.class) {
                if(instance == null) {
                    instance = new MemberDAO();
                }
            }
        }
        return instance;
    }
    
    private Connection getConnection() throws SQLException {
        return ds.getConnection(); 
    }
    
    public int userCheck(String id, String pw) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = -1;
        
        String sql = "select id, pw, status from usertable where id=?";
        try{
                conn=getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                
                rs = pstmt.executeQuery();
                
                if(rs.next()) {
                    String dbPw = rs.getString("pw");
                    String status = rs.getString("status");
                    if (dbPw != null && dbPw.equals(pw)) {
                        if(status.equals("Y")) {
                            result = 1;
                        } else {
                            result = 2;
                        }
                    } else {
                        result = 0;
                    }
                }else {
                    result = -1;
                }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    
    public MemberDTO getUser(String id) {
        MemberDTO dto = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "select * from usertable where id = ?";
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                
                String name = rs.getString("name");
                String pw = rs.getString("pw");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");
                String permission = rs.getString("permission");
                
                dto= new MemberDTO(id, pw, name, phone, email, status, permission);
                
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setPw(rs.getString("pw"));
                dto.setPhone(rs.getString("phone"));
                dto.setEmail(rs.getString("email"));
                dto.setStatus(rs.getString("status"));
                dto.setPermission(rs.getString("permission"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dto;
    }
    public ArrayList<MemberDTO> memberSelect() {
            ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String sql = "SELECT * FROM usertable";
            
            try {
                conn = getConnection();
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String pw = rs.getString("pw");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String status = rs.getString("status");
                    String permission = rs.getString("permission");
                    MemberDTO dto = new MemberDTO(id, name, pw, phone, email, status, permission);
                    dtos.add(dto);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            
            return dtos;
        }

    public int insertMember(MemberDTO dto) {
        // TODO Auto-generated method stub
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int result = 0;
        String sql = "insert into usertable values(?,?,?,?,?,?,'N')";
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getPhone());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getPermission());
            
            result = pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (rs != null) {
                    rs.close();
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    public void updateStatus(String id, String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE usertable SET status = ? WHERE id = ?";
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setString(2, id);
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public void updateMember(String id, String name, String pw, String phone, String email, String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "UPDATE usertable SET name = ?, pw = ?, phone = ?, email = ?, status = ? WHERE id = ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, pw);
            pstmt.setString(3, phone);
            pstmt.setString(4, email);
            pstmt.setString(5, status);
            pstmt.setString(6, id);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

