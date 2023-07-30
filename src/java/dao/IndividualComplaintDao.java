/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.ComplaintDto;
import dto.StudentDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class IndividualComplaintDao {
     public ComplaintDto getIndividualComplaintData(int complaintId) throws SQLException
    {ComplaintDto complaint=new ComplaintDto();
        Statement st = DBConnector.getStatement();
        String query="";
       
               query="SELECT * FROM complaint WHERE complaintId='"+complaintId+"'  ";
        
        
        
        try
        {
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                
                
        
        complaint.setComplaintId(rs.getInt(1));
        complaint.setIssuerId(rs.getString(2));
        complaint.setResponder_id(rs.getString(3));
        complaint.setCategory(rs.getString(4));
        complaint.setIssuedDate(rs.getString(5));
        complaint.setDescription(rs.getString(6));
        
        complaint.setIssuedToIdFaculty(rs.getString(7));
        complaint.setIssuedToIdAdmin(rs.getString(8));
        complaint.setIssuedToIdHod(rs.getString(9));
        complaint.setResponse(rs.getString(10));
        complaint.setReplyDate(rs.getString(11));
        complaint.setPersonCategory(rs.getString(12));  
        
           
            }
            
            }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return complaint;
    }
}
