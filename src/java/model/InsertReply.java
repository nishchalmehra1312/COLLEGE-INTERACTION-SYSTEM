/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.ResponseComplaintDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nishc
 */
public class InsertReply {
    public boolean insertReply(ResponseComplaintDto response)
    {
        int complaintId=response.getComplaintID();
        int responseId=response.getResponseId();
        String reply=response.getReply();
        String replyDate=response.getReplyDate();
        String responderId=response.getResponderId();
        Connection con = DBConnector.getConnection();
        try
        {
            PreparedStatement ps=con.prepareStatement("INSERT INTO responsecomplain (responseId,complaintId,responderId,reply,replyDate)values(?,?,?,?,?)");
            ps.setInt(1, responseId);
            ps.setInt(2, complaintId);
            ps.setString(3, responderId);
            ps.setString(4, reply);
            ps.setString(5, replyDate);
          
            int i = ps.executeUpdate();
            if(i!=0)
            {
               return true;
            }
            else
            {
                return false ;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return false ;
    }
}
