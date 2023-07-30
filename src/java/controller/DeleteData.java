/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nishc
 */
public class DeleteData extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id="";
        id = req.getParameter("uid");
        String cat="";
        cat=req.getParameter("cat");
        if(cat.equals("student"))
        {
            String query="DELETE FROM student WHERE enrollment_number='"+id+"' ";
            Statement st = DBConnector.getStatement();
            try
            {
                int i = st.executeUpdate(query);
                if(i!=0)
                {
                    resp.sendRedirect("student.jsp");
                }
                else 
                {
                    System.out.println("errorDeletingData");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
        else
        {
            String query="DELETE FROM manager WHERE manager_id='"+id+"' ";
            Statement st = DBConnector.getStatement();
            try
            {
                int i = st.executeUpdate(query);
                if(i!=0)
                {
                    resp.sendRedirect("homeAdmin.jsp");
                }
                else 
                {
                    System.out.println("errorDeletingData");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
    }

    
    
}
