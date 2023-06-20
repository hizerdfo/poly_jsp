package kr.co.listener.ex;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ContextListener")
public class ContextListener extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContextListener() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        System.out.println("doPost");
    }

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("init");
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("destroy");
    }

    @PostConstruct
    private void postConstruct() {
        System.out.println("PostConstruct");
    }

    @PreDestroy
    private void preDestroy() {
        System.out.println("PreDestroy");
    }
}

