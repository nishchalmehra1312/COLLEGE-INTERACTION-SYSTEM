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
public class ComplaintDao {
     public List<ComplaintDto> getAllComplaintData(String id,String category) throws SQLException
    {
        Statement st = DBConnector.getStatement();
        String query="";
        if(category.equals("faculty"))
        {
             query="SELECT * FROM complaint WHERE idOfFaculty='"+id+"'  ";
        }
        else
            if(category.equals("hod"))
            {
                
                   query="SELECT * FROM complaint WHERE idOfHod='"+id+"'  ";
            }
        else if(category.equals("admin"))
        {
               query="SELECT * FROM complaint WHERE idOfAdmin='"+id+"'  ";
        }
        
         List<ComplaintDto> l1=new ArrayList<ComplaintDto>();
        try
        {
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                ComplaintDto complaint=new ComplaintDto();
                
                System.out.println("rs.next executes");
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
        
                l1.add(complaint);
            }
            
            }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
      public List<ComplaintDto> getAllComplaintDataSelf(String id,String category) throws SQLException
    {
        Statement st = DBConnector.getStatement();
        String query="";
        if(category.equals("faculty"))
        {
             query="SELECT * FROM complaint WHERE issuerId='"+id+"'  ";
        }
        else
            if(category.equals("hod"))
            {
                
                   query="SELECT * FROM complaint WHERE issuerId='"+id+"'  ";
            }
        else if(category.equals("admin"))
        {
               query="SELECT * FROM complaint WHERE issuerId='"+id+"'  ";
        }
        
         List<ComplaintDto> l1=new ArrayList<ComplaintDto>();
        try
        {
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                ComplaintDto complaint=new ComplaintDto();
            
        
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
        
                l1.add(complaint);
            }
            
            }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }   
      public List<ComplaintDto> getAllComplaintDataSelfStudent(String id) throws SQLException
    {
        Statement st = DBConnector.getStatement();
        String query="SELECT * FROM complaint WHERE issuerId='"+id+"'  ";
        
        
         List<ComplaintDto> l1=new ArrayList<ComplaintDto>();
        try
        {
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                ComplaintDto complaint=new ComplaintDto();
            
        
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
        
                l1.add(complaint);
            }
            
            }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
}
