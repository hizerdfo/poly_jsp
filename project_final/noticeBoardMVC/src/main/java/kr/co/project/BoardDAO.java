package kr.co.project;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
    private DataSource ds;
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    public BoardDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle8g");
            System.out.println("Oracle 연결 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<BoardDTO> SelectAllArticles() {
        List<BoardDTO> articlesList = new ArrayList<>();
        ResultSet rs = null;
        String sql = "select LEVEL, articleNO, parentNO, title, content, id, post_date, hit_count from mvc_board\r\n"
                + "start with parentNO = 0\r\n"
                + "connect by prior articleNO = parentNO\r\n"
                + "order siblings by articleNO";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int level = rs.getInt("LEVEL");
                int articleNO = rs.getInt("articleNO");
                int parentNO = rs.getInt("parentNO");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String id = rs.getString("id");
                Date post_date = rs.getDate("post_date");
                int hit_count = rs.getInt("hit_count");
                
                
                BoardDTO article = new BoardDTO();
                article.setLevel(level);
                article.setArticleNO(articleNO);
                article.setParentNO(parentNO);
                article.setTitle(title);
                article.setContent(content);
                article.setId(id);
                article.setPostDate(post_date);
                article.setHitCount(hit_count);
                
                
                articlesList.add(article);
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

        return articlesList;
    }
    private int getNewArticleNO() {
        try {
            conn = ds.getConnection();
            String query = "SELECT max(articleNO) from mvc_board";
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery(query);
            if(rs.next())
                return (rs.getInt(1) + 1);
            rs.close();
            pstmt.close();
            conn.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        return 0;
    }
    public void insertNewArticle(BoardDTO article) {
        // TODO Auto-generated method stub
        try {
            conn = ds.getConnection();
            int articleNO = getNewArticleNO();
            int parentNO = article.getParentNO();
            String title = article.getTitle();
            String content = article.getContent();
            String id = article.getId();
            String query ="INSERT INTO mvc_board(articleNO, parentNO, title, content, id)"
                            + "VALUES(?,?,?,?,?)";
            System.out.println(query);
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, articleNO);
            pstmt.setInt(2, parentNO);
            pstmt.setString(3, title);
            pstmt.setString(4, content);
            pstmt.setNString(6, id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
