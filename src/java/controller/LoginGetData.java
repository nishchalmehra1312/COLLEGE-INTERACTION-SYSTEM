/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.LoginDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthentication;

public class LoginGetData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email=req.getParameter("email");
       String password=req.getParameter("password");
       String category=req.getParameter("category");
      if(email.trim().equals("") || password.equals(""))
      {
            PrintWriter out =resp.getWriter();
   out.println("<script type=\"text/javascript\">");
   out.println("alert('User or password incorrect');");
   out.println("location='login.jsp';");
   out.println("</script>");
      }
      else{
       LoginDto user_data = new LoginDto();
       user_data.setEmail(email);
       user_data.setPassword(password);
       user_data.setCategory(category);
       
       LoginAuthentication la=new LoginAuthentication();
       boolean checkCredentials=la.isLogin(user_data);
       
       if(checkCredentials)
       {
          
            System.out.println("this");
           HttpSession session=req.getSession(true);
           String id=la.getId(email,category);
           session.setAttribute("id", id);
           session.setAttribute("category", category);
            
            if(category.equals("admin"))
            session.setAttribute("unique_key","admin");
            else if(category.equals("faculty"))
            session.setAttribute("unique_key","faculty");
            else if(category.equals("hod"))
            session.setAttribute("unique_key","hod");
            else if(category.equals("student"))
            session.setAttribute("unique_key","student");
           else
                session.setAttribute("unique_key",null);
            
        
            if(category.equals("student"))
            {
                resp.sendRedirect("homeStudent.jsp");
            }
            else if(category.equals("faculty"))
            {
                resp.sendRedirect("homeFaculty.jsp");
            }
            else if(category.equals("hod"))
            {
                resp.sendRedirect("homeHod.jsp");
            }
            else
            {
                resp.sendRedirect("homeAdmin.jsp");
            }
           
       }    
       else
       {
     PrintWriter out =resp.getWriter();
   out.println("<script type=\"text/javascript\">");
   out.println("alert('User or password incorrect');");
   out.println("location='login.jsp';");
   out.println("</script>");

       }
       
    }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession() ;
                session.invalidate();
        
        resp.sendRedirect("login.jsp");
       
    }

}
