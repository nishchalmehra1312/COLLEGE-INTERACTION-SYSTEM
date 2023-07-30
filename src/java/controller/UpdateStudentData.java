/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.StudentDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertDataCheck;

public class UpdateStudentData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String SessionCategory=(String)session.getAttribute("category");
        if(SessionCategory.equals("student"))
        {
            String enrollment_number = (String)session.getAttribute("id");
            String student_name=req.getParameter("student_name");
            String dob = req.getParameter("dob");
            String email = req.getParameter("email");
         // String password = req.getParameter("password");
            String address = req.getParameter("address");
            String mobile=req.getParameter("mobile");
            String gender=req.getParameter("gender");
            StudentDto student=new StudentDto();
            student.setStudent_name(student_name);
            student.setEmail(email);
            student.setDob(dob);
            student.setGender(gender);
            student.setMobile(mobile);
            student.setAddress(address);
            student.setEnrollment_number(enrollment_number);
            InsertDataCheck iCheck=new InsertDataCheck();
            boolean isUpdate=iCheck.isUpdateDataStudentIndividual(student);
       if(isUpdate)
       {
           
           resp.sendRedirect("homeStudent.jsp");
       }
       else
       {
           
           out.println("<h1>error Updating Data</h1>");
       }
        }
        else
        {
        String enrollment_number = (String)session.getAttribute("enrollment");
        String student_name=req.getParameter("student_name");
        String dob = req.getParameter("dob");
        String email = req.getParameter("email");
       // String password = req.getParameter("password");
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
        System.out.println(dob);
        student.setDob(dob);
        student.setEmail(email);
        student.setGender(gender);
        student.setMobile(mobile);
       // student.setPassword(password);
        student.setStudent_name(student_name);
        student.setFather_name(fname);
        String category=(String)session.getAttribute("category");
        InsertDataCheck iCheck=new InsertDataCheck();
       boolean isUpdate=iCheck.isUpdateData(student);
       if(isUpdate)
       {
           if(category.equals("faculty"))
           resp.sendRedirect("ViewStudentFaculty.jsp");
           else if(category.equals("admin"))
           resp.sendRedirect("student.jsp");
           else if(category.equals("hod"))
           resp.sendRedirect("ViewStudentHod.jsp");
       }
       else
       {
           
           out.println("<h1>error Updating Data</h1>");
       }
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
