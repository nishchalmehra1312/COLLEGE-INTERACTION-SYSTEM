/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nishc
 */
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
       String id = (String) session.getAttribute("id");
       String cat= (String) session.getAttribute("category");
       String oldpassword=req.getParameter("opass");
       String password=req.getParameter("npass");
       String rpassword = req.getParameter("rnpass");
       String tablepassword="";
       String query="";
       int i=0;
           Statement st =DBConnector.getStatement();
       if(session==null || id==null || cat==null)
       {
           resp.sendRedirect("login.jsp");
       } 
       else
       {
          
           if(cat.equals("student"))
           {
                query = "SELECT password FROM student WHERE enrollment_number='"+id+"' ";
           
           try
           {
               ResultSet rs = st.executeQuery(query);
               if(rs.next())
               {
                   tablepassword=rs.getString(1);
                   
               }
               else
               {
                   System.out.println("error cpass");
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           
           if(password.equals(rpassword) && tablepassword.equals(oldpassword))
           {
               String passwordQuery="";
               passwordQuery = "UPDATE student SET password='"+password+"' WHERE enrollment_number='"+id+"'; ";
                    try 
                    {
                         i = st.executeUpdate(passwordQuery);
                    } 
                    catch (SQLException ex) 
                    {
                        System.out.println(ex);
                    }
                  if(i!=0)
                  {
                        PrintWriter out =resp.getWriter();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Password Updated');");
                        out.println("location='homeStudent.jsp';");
                        out.println("</script>");
                        resp.sendRedirect("homeStudent.jsp");
                  }
                  else
                  {
                     PrintWriter out =resp.getWriter();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Password Not Updated');");
                        out.println("location='homeStudent.jsp';");
                        out.println("</script>");
                        resp.sendRedirect("homeStudent.jsp");
                        
                  }
           }
           else
           {
                      resp.setStatus(2);
                      resp.sendRedirect("homeStudent.jsp");
           }
       }
           
           else
           {
               
                query = "SELECT password FROM manager WHERE manager_id='"+id+"' ";
           
           try
           {
               ResultSet rs = st.executeQuery(query);
               if(rs.next())
               {
                   tablepassword=rs.getString(1);
                   
               }
               else
               {
                   System.out.println("error cpass");
               }
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
           
           if(password.equals(rpassword) && tablepassword.equals(oldpassword))
           {
               String passwordQuery="";
               passwordQuery = "UPDATE manager SET password='"+password+"' WHERE manager_id='"+id+"' ";
                    try 
                    {
                      i = st.executeUpdate(passwordQuery);
                    } 
                    catch (SQLException ex) 
                    {
                        System.out.println(ex);
                    }
                  if(i!=0)
                  {
                      resp.setStatus(1);
                      if(cat.equals("faculty"))
                      resp.sendRedirect("homeFaculty.jsp");
                      else if(cat.equals("hod")) 
                      resp.sendRedirect("homeHod.jsp");
                      else resp.sendRedirect("homeAdmin.jsp");
                         
                  }
                  else
                  {
                      resp.setStatus(2);
                     if(cat.equals("faculty"))
                      resp.sendRedirect("homeFaculty.jsp");
                      else if(cat.equals("hod")) 
                      resp.sendRedirect("homeHod.jsp");
                      else resp.sendRedirect("homeAdmin.jsp");
                  }
           }
           else
           {
                      resp.setStatus(2);
                      if(cat.equals("faculty"))
                      resp.sendRedirect("homeFaculty.jsp");
                      else if(cat.equals("hod")) 
                      resp.sendRedirect("homeHod.jsp");
                      else resp.sendRedirect("homeAdmin.jsp");
           }
         }
       }
    }
 

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
       session.invalidate();
    }


}
