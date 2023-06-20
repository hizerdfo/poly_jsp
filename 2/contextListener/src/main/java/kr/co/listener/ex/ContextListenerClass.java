package kr.co.listener.ex;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ContextListenerClass implements ServletContextListener {
   @Override
   public void contextDestroyed(ServletContextEvent sce) {
      ServletContextListener.super.contextDestroyed(sce);
      System.out.println("contextDestroyed");
   }
   
   @Override
   public void contextInitialized(ServletContextEvent sce) {
      ServletContextListener.super.contextInitialized(sce);
      System.out.println("contextInitialized");
   }
}