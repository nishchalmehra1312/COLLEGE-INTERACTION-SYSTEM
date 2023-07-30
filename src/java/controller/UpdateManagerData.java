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
public class UpdateManagerData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
          String unique_key=(String)session.getAttribute("unique_key");
        
        String  category="";
        String specialization="";
        
        String SessionCategory= (String)session.getAttribute("category");
        if(SessionCategory.equals("admin"))
        {
                String managerIdForUpdation=(String)session.getAttribute("managerIdForUpdation");
                String categoryOfTable=req.getParameter("category");
                String manager_name=req.getParameter("name");
                String dob = req.getParameter("dob");
                String email = req.getParameter("email");
                String mobile=req.getParameter("mobile");
                String address = req.getParameter("address");
                String qualification = req.getParameter("qualification");
                String experience = req.getParameter("experience");       
                String branch =req.getParameter("branch");
                String subjects =req.getParameter("subjects");
                String aadhar =req.getParameter("aadhar");
                specialization=req.getParameter("specialization");
                String gender=req.getParameter("gender");
                String joining_year=req.getParameter("joining_year");
      
                ManagerDto manager = new ManagerDto();
                manager.setManager_id(managerIdForUpdation);
                manager.setAadhar(aadhar);
                manager.setSpecialization(specialization);
                manager.setAddress(address);
                manager.setBranch(branch);
                manager.setCategory(categoryOfTable);
                manager.setDob(dob);
                manager.setEmail(email);
                manager.setExperience(experience);
                manager.setGender(gender);
                manager.setJoining_year(joining_year);
                manager.setMobile(mobile);
                manager.setName(manager_name);
                manager.setQualification(qualification);
                manager.setSubjects(subjects);
                
                PrintWriter out = resp.getWriter();
                InsertDataCheck iCheck = new InsertDataCheck();
                boolean isInserted = iCheck.isUpdateDataManager(manager);
                if(isInserted)
                {
           
                    if(categoryOfTable.equals("faculty"))
                    resp.sendRedirect("faculty.jsp");
                    else if(categoryOfTable.equals("hod"))
                    resp.sendRedirect("hod.jsp");
                }
                 else
                {
                    System.out.println("error");
                }
          
     }
        
        else
        {
            String managerIdForUpdation=(String)session.getAttribute("id");
                String categoryOfTable=(String)session.getAttribute("category");
                String manager_name=req.getParameter("name");
                String dob = req.getParameter("dob");
                String email = req.getParameter("email");
                String mobile=req.getParameter("mobile");
                String address = req.getParameter("address");
                String qualification = req.getParameter("qualification");
                String experience = req.getParameter("experience");       
                String branch =req.getParameter("branch");
                String subjects =req.getParameter("subjects");
                String aadhar =req.getParameter("aadhar");
                specialization=req.getParameter("specialization");
                String gender=req.getParameter("gender");
                String joining_year=req.getParameter("joining_year");
      
                ManagerDto manager = new ManagerDto();
                manager.setManager_id(managerIdForUpdation);
                manager.setAadhar(aadhar);
                manager.setSpecialization(specialization);
                manager.setAddress(address);
                manager.setBranch(branch);
                manager.setCategory(categoryOfTable);
                manager.setDob(dob);
                manager.setEmail(email);
                manager.setExperience(experience);
                manager.setGender(gender);
                manager.setJoining_year(joining_year);
                manager.setMobile(mobile);
                manager.setName(manager_name);
                manager.setQualification(qualification);
                manager.setSubjects(subjects);
                
                PrintWriter out = resp.getWriter();
                InsertDataCheck iCheck = new InsertDataCheck();
                boolean isInserted = iCheck.isUpdateDataManager(manager);
                if(isInserted)
                {
           
                    if(categoryOfTable.equals("hod"))
                    resp.sendRedirect("homeHod.jsp");
                    else if(categoryOfTable.equals("faculty"))
                    resp.sendRedirect("homeFaculty.jsp");
                    else
                     resp.sendRedirect("homeAdmin.jsp");
                }
                 else
                {
                    System.out.println("error");
                }
        }
       
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.sendRedirect("login.jsp");
    }
    
    
}
