/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nishc
 */
public class IndividualManagerGetData {
    

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String manager_id = req.getParameter("manager_id");
            String category=req.getParameter("category");
            if(manager_id!=null)
            {
                        
                HttpSession session = req.getSession(true);
                session.setAttribute("manager_id", manager_id);
                session.setAttribute("category", category);
                resp.sendRedirect("editManager.jsp");
                         
            }
            
    }

}
