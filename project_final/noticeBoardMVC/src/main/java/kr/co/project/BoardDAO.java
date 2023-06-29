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
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oraclellg");
            System.out.println("Oracle 연결 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<BoardDTO> SelectAllArticles() {
        List<BoardDTO> articlesList = new ArrayList<>();
        ResultSet rs = null;
        String sql = "select LEVEL, articleNO, parentNO, title, content, id, postDate, hitCount from mvc_board\r\n"
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
                Date postDate = rs.getDate("postDate");
                int hitCount = rs.getInt("hitCount");
                
                
                BoardDTO article = new BoardDTO();
                article.setLevel(level);
                article.setArticleNO(articleNO);
                article.setParentNO(parentNO);
                article.setTitle(title);
                article.setContent(content);
                article.setId(id);
                article.setPostDate(postDate);
                article.setHitCount(hitCount);
                
                
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
    public int insertNewArticle(BoardDTO article) {
    	int articleNO = getNewArticleNO();
        // TODO Auto-generated method stub
        try {
            conn = ds.getConnection();
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
            pstmt.setNString(5, id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return articleNO;
    }

	public BoardDTO selectArticle(int articleNO) {
		BoardDTO article = new BoardDTO();
		try {
			conn = ds.getConnection();
			String query = "select articleNO, parentNO, title, content, id, postDate "
					+ "from mvc_board "
					+ "where articleNO=?";
			
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int _articleNO = rs.getInt("articleNO");
			int parentNO = rs.getInt("parentNO");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			Date postDate = rs.getDate("postDate");
					
			article.setArticleNO(_articleNO);
			article.setParentNO(parentNO);
			article.setTitle(title);
			article.setContent(content);
			article.setId(id);
			article.setPostDate(postDate);
			rs.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return article;
	}

	public void updateArticle(BoardDTO article) {
		int articleNO = article.getArticleNO();
		String title = article.getTitle();
		String content = article.getContent();
		try {
			conn = ds.getConnection();
			String query = "update mvc_board set title =?, content =? where articleNO = ?";
						
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,title);
			pstmt.setString(2, content);
			pstmt.setInt(3, articleNO);
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void deleteArticle(int articleNO) {
		try {
			conn = ds.getConnection();
			String query ="DELETE FROM mvc_board";
			query += "WHERE articleNO in (";
			query +=" SELECT articleNO FROM mvc_board";
			query +=" START WITH articleNO = ?";
			query +=" CONNECT BY PRIOR articleNO = parentNO )";
			
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Integer> selectRemovedArticles(int articleNO) {
		List<Integer> articleNOList = new ArrayList<Integer>();
		try {
			conn = ds.getConnection();
			String query ="SELECT articleNO FROM mvc_board";
			query += " START WITH articleNO = ?";
			query += " CONNECT BY PRIOR articleNO = parentNO";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				articleNO = rs.getInt("articleNO");
				articleNOList.add(articleNO);
			}
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return articleNOList;
	}
}
