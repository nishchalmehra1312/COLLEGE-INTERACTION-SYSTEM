package controller;

import dao.IndividualStudentDao;
import dto.StudentDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndividualStudentGetData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            
            String id = (String)session.getAttribute("id");
            String SessionCategory=(String)session.getAttribute("category");
            if(session!=null)
            {
                        
                if(!SessionCategory.equals("student"))
                {
                    String enrollment = req.getParameter("enrollment");
                    session.setAttribute("enrollment", enrollment);
                resp.sendRedirect("editStudent.jsp");}
                else
                {
                    session.setAttribute("enrollment",id);
                    resp.sendRedirect("editStudentPersonalized.jsp");
                }
                         
            }
            
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
    
        
}
