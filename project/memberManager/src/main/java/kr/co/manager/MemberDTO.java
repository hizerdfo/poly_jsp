package kr.co.manager;

public class MemberDTO {
   
    private String id;
    private String name;
    private String pw;
    private String phone;
    private String email;
    private String permission;
    private String status;
    
    

    public MemberDTO(String id, String name, String pw, String phone, String email, String permission , String status) {
        
        this.id = id;
        this.name = name;
        this.pw = pw;
        this.phone = phone;
        this.email = email;
        this.permission = permission;
        this.status = status;
    }
    
    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
}
