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
public class Submission extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int assignmentId=Integer.parseInt(req.getParameter("assignmentId"));
        HttpSession session = req.getSession();
        String category=(String)session.getAttribute("category");
        session.setAttribute("assignmentId", assignmentId);
        if(category.equals("hod"))
        {
        resp.sendRedirect("ViewSubmissionsAssignmentHod.jsp");      
        }
      
        else   
        resp.sendRedirect("ViewSubmissionsAssignment.jsp");
    }

}
