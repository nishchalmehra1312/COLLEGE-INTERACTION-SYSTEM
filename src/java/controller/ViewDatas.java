/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nishc
 */
public class ViewDatas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        String category = req.getParameter("cat");
        String uid=req.getParameter("uid");
        String unique_key = (String) session.getAttribute("unique_key");
      
        if(category.equals("student") && unique_key.equals("faculty") || unique_key.equals("hod")|| unique_key.equals("admin"))
        {
            if(unique_key.equals("faculty"))
            {
                session.setAttribute("enrollment", uid);
               
                resp.sendRedirect("ViewSingleStudentInfoFaculty.jsp");
            }
           else if(unique_key.equals("admin"))
            {
                session.setAttribute("enrollment", uid);
               
                resp.sendRedirect("ViewSingleStudentInfoAdmin.jsp");
            }
           else
               {
                   System.out.println("hod part");
                session.setAttribute("enrollment", uid);
               
                resp.sendRedirect("ViewSingleStudentInfoHod.jsp");
            }
        }
    }

}
