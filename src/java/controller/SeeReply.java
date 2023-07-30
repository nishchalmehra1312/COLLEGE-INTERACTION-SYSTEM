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
public class SeeReply extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    HttpSession session = req.getSession();
       int complaintId=Integer.parseInt(req.getParameter("complaintId"));
       String category=(String)session.getAttribute("category");
       session.setAttribute("complaintId", complaintId);
       if(category.equals("student"))
       {
            resp.sendRedirect("SeeReplyStudent.jsp");
       }
       else if(category.equals("hod"))
       {
            resp.sendRedirect("SeeReplyHod.jsp");
       }
       else if(category.equals("faculty"))
       {
            resp.sendRedirect("SeeReplyFaculty.jsp");
       }
       else
       resp.sendRedirect("SeeReplyHod.jsp");
    }

}
