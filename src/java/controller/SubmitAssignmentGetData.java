/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.AssignmentDto;
import dto.AssignmentResponseDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SubmitAssignmentCheck;

/**
 *
 * @author nishc
 */
public class SubmitAssignmentGetData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Random rand=new Random();
        Date date=new Date();
        int maxNumber=77553399;
        int submissionId=rand.nextInt(maxNumber);
        String studentId=(String)session.getAttribute("id");
        int assignmentId=(int)session.getAttribute("assignmentId");
        String description = req.getParameter("description");
        String submissionDate = date.toString();
        AssignmentResponseDto submit=new AssignmentResponseDto();
        submit.setAssignmentId(assignmentId);
        submit.setDesccription(description);
        submit.setStudentId(studentId);
        submit.setSubmissionDate(submissionDate);
        submit.setSubmissionId(submissionId);
        
        SubmitAssignmentCheck submission = new SubmitAssignmentCheck();
        boolean submitted = submission.submitAssignment(submit);
        if(submitted)
        {
            resp.sendRedirect("ViewAssignmentByStudent.jsp");
        }
        else
        {
            System.out.println("error Submitting Assignment");
        }
             
    }
    
    
    

}
