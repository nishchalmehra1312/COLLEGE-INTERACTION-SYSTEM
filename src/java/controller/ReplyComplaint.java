/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import dto.ResponseComplaintDto;
import java.util.Random;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertReply;

/**
 *
 * @author nishc
 */
public class ReplyComplaint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            String SessionCategory = (String)session.getAttribute("category");
            Random rand= new Random();
             Date date = new Date();
              int maxNumber=9433248;
              int replyId=0;
            int complaintId=(int)session.getAttribute("complaintId");
            String responderId = (String)session.getAttribute("id");
            String reply=req.getParameter("reply");
            String replyDate=date.toString();
            replyId = rand.nextInt(maxNumber);
            InsertReply i1=new InsertReply();
            ResponseComplaintDto response = new ResponseComplaintDto();
            response.setComplaintID(complaintId);
            response.setReply(reply);
            response.setReplyDate(replyDate);
            response.setResponderId(responderId);
            response.setResponseId(replyId);
            boolean check = i1.insertReply(response);
            if(check)
            {
                if(SessionCategory.equals("hod"))
                {
                    resp.sendRedirect("ResponseComplaintHod.jsp");
                }
                else if(SessionCategory.equals("admin"))
                 resp.sendRedirect("ResponseComplainAdmin.jsp");
                else if(SessionCategory.equals("faculty"))
                 resp.sendRedirect("ResponseComplaintFaculty.jsp");
                else resp.sendRedirect("ResponseComplaintHod.jsp");
            }
            else
            {
                System.out.println("error in replying to a complaint");
            }
            
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}
