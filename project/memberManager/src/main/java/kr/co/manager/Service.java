package kr.co.manager;

import java.util.ArrayList;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Service {
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response);
}
