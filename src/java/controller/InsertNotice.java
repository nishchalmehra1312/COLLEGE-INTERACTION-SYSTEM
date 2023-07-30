/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.NoticeDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InsertNoticeData;

/**
 *
 * @author nishc
 */
public class InsertNotice extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession();
    Random rand = new Random();
    int maxNumber= 12345678;
    Date date = new Date();
    int noticeId=rand.nextInt(maxNumber);
    String category=(String)session.getAttribute("category");
    String Description = req.getParameter("description");
    String issuedDate=date.toString();
    String issuedBy=(String)session.getAttribute("id");
    String issuedTo=req.getParameter("issuedTo");
        System.out.println("From Controller = "+issuedTo);
    NoticeDto n1 = new NoticeDto();
    n1.setNoticeId(noticeId);
    n1.setDescription(Description);
    n1.setIssuedBy(issuedBy);
    n1.setIssuedTo(issuedTo);
    n1.setIssuedDate(issuedDate);
    InsertNoticeData i = new InsertNoticeData();
    boolean isInserted =i.noticeInsert(n1);
    if(isInserted)
    {
        if(category.equals("hod"))
        {
            resp.sendRedirect("NoticePageOfHod.jsp");
        }
        else if(category.equals("faculty"))
        {
            resp.sendRedirect("NoticePageOfFaculty.jsp");
        }
        else if(category.equals("student"))
            
        resp.sendRedirect("NoticePageOfStudent.jsp");
    }
    else
    {
        System.out.println("error Inserting Notice Data");
    }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

}
