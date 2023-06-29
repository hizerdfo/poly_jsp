package kr.co.project;

import java.util.Date;

public class BoardDTO {
    private int level;
    private int parentNO;
	private int articleNO;
    private String title;
    private String content;    
    private String id;
    
    private Date postDate;
    
    private int hitCount;
    
    public BoardDTO() {
        
    }
    
    public BoardDTO( int level, int articleNO, int parentNO, String title, String content, int hitCount, String id) {
        super();
        this.level = level;
    	this.articleNO = articleNO;
        this.parentNO = parentNO;
        this.title = title;
        this.content = content;
        this.hitCount = hitCount;
        this.id = id;
    }

    public int getLevel() {
        return level;
    }
    
    public void setLevel(int level) {
        this.level = level;
    }
    
    public int getArticleNO() {
        return articleNO;
    }
    
    public void setArticleNO(int articleNO) {
        this.articleNO = articleNO;
    }
    
    public int getParentNO() {
        return parentNO;
    }
    
    public void setParentNO(int parentNO) {
        this.parentNO = parentNO;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public Date getPostDate() {
        return postDate;
    }
    
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }
    
    public int getHitCount() {
        return hitCount;
    }
    
    public void setHitCount(int hitCount) {
        this.hitCount = hitCount;
    }
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
}
