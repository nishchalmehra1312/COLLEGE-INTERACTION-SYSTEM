/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.ManagerDto;
import java.io.IOException;
import java.io.PrintWriter;
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
public class InsertManagerData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String manager_id = req.getParameter("manager_id");
       String manager_name=req.getParameter("manager_name");
       String dob = req.getParameter("dob");
       String email = req.getParameter("email");
       String password = req.getParameter("password");
       String mobile=req.getParameter("mobile");
       String address = req.getParameter("address");
       String qualification = req.getParameter("qualification");
       String experience = req.getParameter("experience");       
       String category = req.getParameter("category");
       String branch =req.getParameter("branch");
       String subjects =req.getParameter("subjects");
       String aadhar =req.getParameter("aadhar");
       
       String specialization =req.getParameter("specialization");
        
       String gender=req.getParameter("gender");
       String joining_year=req.getParameter("joining_year");
      
        System.out.println("hiasd"+joining_year);
       ManagerDto manager = new ManagerDto();
       manager.setAadhar(aadhar);
       manager.setSpecialization(specialization);
       manager.setAddress(address);
       manager.setBranch(branch);
       manager.setCategory(category);
       manager.setDob(dob);
       manager.setEmail(email);
       manager.setExperience(experience);
       manager.setGender(gender);
       manager.setJoining_year(joining_year);
       manager.setManager_id(manager_id);
       manager.setMobile(mobile);
       manager.setName(manager_name);
       manager.setPassword(password);
       manager.setQualification(qualification);
       manager.setSubjects(subjects);
       PrintWriter out = resp.getWriter();
       InsertDataCheck iCheck = new InsertDataCheck();
        boolean isInserted = iCheck.isInsertDataManager(manager);
        if(isInserted)
        
            {
               
               out.println("<h1>Data Inserted </h1>");
               resp.setStatus(1);
               if(category.equals("faculty"))
               resp.sendRedirect("faculty.jsp");
               else if(category.equals("hod"))
               resp.sendRedirect("hod.jsp");
               else resp.sendRedirect("admin.jsp");
           }
           else
           {
                  out.println("<h1>Data not inserted </h1>");
               resp.sendRedirect("student.jsp");
           }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session =null ;
       session.invalidate();
       resp.sendRedirect("login.jsp");
    }

        
}
