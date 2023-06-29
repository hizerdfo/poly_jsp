package kr.co.manager;

import java.util.ArrayList;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MembersAllService implements Service{
    public MembersAllService() {
        
    }
    @Override
    public ArrayList<MemberDTO> execute(HttpServletRequest result, HttpServletResponse response){
        MemberDAO mDao = MemberDAO.getInstance();
        
        return mDao.memberSelect(); 
    }

}
