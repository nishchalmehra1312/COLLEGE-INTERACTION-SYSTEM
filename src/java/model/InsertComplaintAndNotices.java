/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.ComplaintDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nishc
 */
public class InsertComplaintAndNotices {
    
public    boolean insetComplaintCheck(ComplaintDto complaint)
    {
        int complaintId =complaint.getComplaintId();
        String issuerId=complaint.getIssuerId();
        String responderId=complaint.getResponder_id();
        String category=complaint.getCategory();
        String hodId=complaint.getIssuedToIdHod();
        String facultyId=complaint.getIssuedToIdFaculty();
        String adminId=complaint.getIssuedToIdAdmin();
        String description = complaint.getDescription();
        String personCategory=complaint.getPersonCategory();
        String issuedDate = complaint.getIssuedDate();
        String replyDate=complaint.getReplyDate();
        String response=complaint.getResponse();
        Connection con=DBConnector.getConnection();
        ResultSet rs = null;
        try
        {
          
        PreparedStatement st = con.prepareStatement("INSERT INTO complaint values(?,?,?,?,?,?,?,?,?,?,?,?)");
            st.setInt(1, complaintId);
            st.setString(2, issuerId);
            st.setString(3, responderId);
            st.setString(4, category);
            st.setString(5, issuedDate);
            st.setString(6, description);
            st.setString(7, facultyId);
            st.setString(8, adminId);
            st.setString(9, hodId);
            st.setString(10,response);
            st.setString(11,replyDate);
            st.setString(12,personCategory);
            int i=st.executeUpdate();
            if(i!=0)
            {
                return true;
            }
            else 
            {
                return false;
            }
            
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        
        return false;
    }
    
}
