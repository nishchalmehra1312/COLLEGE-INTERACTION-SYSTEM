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
public class IdManData extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          
            
            HttpSession session = req.getSession();
            String SessionCategory=(String)session.getAttribute("category");
            String SessionId=(String)session.getAttribute("id");
            if(SessionCategory.equals("admin"))
            {
                String managerId=req.getParameter("manager_id");
                String categoryOfTarget=req.getParameter("category");
                System.out.println(managerId);
                System.out.println(categoryOfTarget);
                session.setAttribute("manager_id", managerId);
                session.setAttribute("categoryOfTarget", categoryOfTarget);
                resp.sendRedirect("editManager.jsp");
            }
           
            else {//this is for individual edit 
                
                session.setAttribute("manager_id",SessionId);
                session.setAttribute("category", SessionCategory);
                if(SessionCategory.equals("hod"))
                resp.sendRedirect("editManagerPersonalizedHod.jsp");
                else if(SessionCategory.equals("admin"))
                    resp.sendRedirect("editManagerPersonalizedHod.jsp");
                else if(SessionCategory.equals("faculty"))
                    resp.sendRedirect("editManagerPersonalizedFaculty.jsp");
            }
}
}
