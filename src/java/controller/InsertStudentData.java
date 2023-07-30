/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.StudentDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertDataCheck;

/**
 *
 * @author nishc
 */
public class InsertStudentData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
       String enrollment_number = (String)session.getAttribute("enrollmentOfStudent");
       String student_name=req.getParameter("student_name");
       String dob = req.getParameter("dob");
       String email = req.getParameter("email");
       String password = req.getParameter("password");
       String address = req.getParameter("address");
       String course = req.getParameter("course");
       String branch =req.getParameter("branch");
       String mobile=req.getParameter("mobile");
       String aadhar =req.getParameter("aadhar");
       String gender=req.getParameter("gender");
       String admission_year=req.getParameter("admission_year");
       String blood_group=req.getParameter("blood_group");
       String fname=req.getParameter("fname");
        StudentDto student=new StudentDto();
        student.setEnrollment_number(enrollment_number);
        student.setAadhar(aadhar);
        student.setAddress(address);
        student.setAdmission_year(admission_year);
        student.setBlood_group(blood_group);
        student.setBranch(branch);
        student.setCourse(course);
        
        student.setDob(dob);
        student.setEmail(email);
        student.setGender(gender);
        student.setMobile(mobile);
        student.setPassword(password);
        student.setStudent_name(student_name);
        student.setFather_name(fname);
       
        PrintWriter out = resp.getWriter();
       InsertDataCheck icheck=new InsertDataCheck();
        
           
            boolean isInserted=icheck.isInsertDataStudent(student);
           if(isInserted)
           {
               
               out.println("<h1>Data Inserted </h1>");
               resp.setStatus(1);
               resp.sendRedirect("student.jsp");
           }
           else
           {
                  out.println("<h1>Data not inserted </h1>");
               resp.sendRedirect("student.jsp");
           }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

 
}
