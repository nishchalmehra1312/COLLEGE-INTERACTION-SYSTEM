/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.AssignmentResponseDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nishc
 */
public class SubmitAssignmentCheck {
    
    public boolean submitAssignment(AssignmentResponseDto response)
    {
        int assignmentId=response.getAssignmentId();
        int submissionId=response.getSubmissionId();
        String description = response.getDesccription();
        String date=response.getSubmissionDate();
        String studentId=response.getStudentId();
        Connection con = DBConnector.getConnection();
        try
        {
            PreparedStatement ps = con.prepareStatement("INSERT INTO assignmentresponses values(?,?,?,?,?)");
            ps.setInt(1, submissionId);
            ps.setString(2, studentId);
            ps.setString(3,description);
            ps.setString(4, date);
            ps.setInt(5, assignmentId);
            int i =ps.executeUpdate();
            if(i!=0)
            {
                return true;
            }
            else 
                return false;
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        
        return false;
    }
    
}
