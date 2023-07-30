/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.AssignmentDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertAssignmentCheck;

/**
 *
 * @author nishc
 */
public class InsertAssignment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int assignmentId;
            int maxNumber=77228833;
            HttpSession session= req.getSession();
            String issuerCategory=(String)session.getAttribute("category");
            Date date=new Date();    
            Random rand=new Random();
            assignmentId=rand.nextInt(maxNumber);
            String assignmentIssuer=(String)session.getAttribute("id");
            String description = req.getParameter("description");
            String assignmentDate=date.toString();
            String dueDate=req.getParameter("dueDate");
            String assignedTo=req.getParameter("assignedTo");
            
           AssignmentDto assignment=new AssignmentDto();
           assignment.setAssignmentId(assignmentId);
           assignment.setAssignmentIssue(assignmentIssuer);
           assignment.setDescription(description);
           assignment.setDueDate(dueDate);
           assignment.setDate(assignmentDate);
           assignment.setAssignedTo(assignedTo);
            
           InsertAssignmentCheck icheck=new InsertAssignmentCheck();
           boolean insertAssignment=icheck.insertAssignment(assignment);
           if(insertAssignment)
           {
               if(issuerCategory.equals("faculty"))
               {
                   resp.sendRedirect("AssignmentPageOfFaculty.jsp");
               }
               else if(issuerCategory.equals("hod"))
               {
                   resp.sendRedirect("AssignmentPageOfHod.jsp");
               }
           }
           else
           {
               System.out.println("Error Inserting Assignment check conmsole");
               if(issuerCategory.equals("faculty"))
               {
                   resp.sendRedirect("facultyAssignment.jsp");
               }
               else if(issuerCategory.equals("hod"))
               {
                   resp.sendRedirect("hodAssignment.jsp");
               }
           }
    }

    
    
}
