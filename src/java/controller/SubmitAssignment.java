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
public class SubmitAssignment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String id = (String)session.getAttribute("id");
        int assignmentId=Integer.parseInt(req.getParameter("assignmentId"));
        
        session.setAttribute("assignmentId", assignmentId);
        System.out.println("ASS ID SESSION WALI"+assignmentId);
        
        resp.sendRedirect("SubmitAssignmentStudent.jsp");
    }   



}
