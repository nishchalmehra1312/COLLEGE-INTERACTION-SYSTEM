/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.AssignmentDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nishc
 */
public class InsertAssignmentCheck {
    public boolean insertAssignment(AssignmentDto assignment) 
    {
        int assignmentId=assignment.getAssignmentId();
        String issuerId=assignment.getAssignmentIssue();
        String description=assignment.getDescription();
        String assignmentDat=assignment.getDate();
        String dueDate=assignment.getDueDate();
        String assignedTo=assignment.getAssignedTo();
        Connection con = DBConnector.getConnection();
        try
        {
            PreparedStatement ps = con.prepareStatement("INSERT INTO assignments values(?,?,?,?,?,?,?)");
            ps.setInt(1, assignmentId);
            ps.setString(2, issuerId);
            ps.setString(3, description);
            ps.setString(4, assignmentDat);
            ps.setString(5, dueDate);
            ps.setString(6, assignedTo);
            ps.setInt(7,0);
            int i = ps.executeUpdate();
            if(i!=0)
                return true;
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
