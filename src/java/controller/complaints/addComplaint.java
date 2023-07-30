/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.complaints;

import dto.ComplaintDto;
import java.util.Random;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertComplaintAndNotices;

/**
 *
 * @author nishc
 */
public class addComplaint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id=(String)session.getAttribute("id");
        String category=req.getParameter("category");
        String categoryOfGenerator=(String)session.getAttribute("category");
        String complaint_description=req.getParameter("complaint_description");
        String hodId=req.getParameter("hodId");
        String adminId=req.getParameter("adminId");
        String facultyId=req.getParameter("facultyId");
        System.out.println("complaint category "+categoryOfGenerator);
        Date complaintDate = new Date();

        Random rand = new Random();
        int maxNumber = 9475554;

        String personCategory=(String)session.getAttribute("category");
        int complaint_id=0;
        complaint_id = rand.nextInt(maxNumber) + 1;
        
       
        ComplaintDto complaint = new ComplaintDto();
        complaint.setComplaintId(complaint_id);
        complaint.setDescription(complaint_description);
        complaint.setCategory(category);
        complaint.setIssuerId(id);
        complaint.setPersonCategory((String)session.getAttribute("category"));
        complaint.setIssuedToIdAdmin(adminId);
        complaint.setIssuedToIdHod(hodId);
        complaint.setIssuedDate(complaintDate.toString());
        complaint.setIssuedToIdFaculty(facultyId);
        InsertComplaintAndNotices icheck = new InsertComplaintAndNotices();
       boolean insertComplain=icheck.insetComplaintCheck(complaint);
       if(insertComplain)
       {
           if(personCategory.equals("faculty"))
           {
               resp.sendRedirect("homeFaculty.jsp");
           }
           else if(personCategory.equals("student"))
           {
               resp.sendRedirect("homeStudent.jsp");
           }
           else
               resp.sendRedirect("homeHod.jsp");
    }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    
}
