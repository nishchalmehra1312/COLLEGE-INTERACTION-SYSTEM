/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.ResponseComplaintDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class ResponseComplaintDao {
    public List<ResponseComplaintDto> getResponses(int id)
    {
        
        String query="SELECT * FROM responsecomplain WHERE complaintId='"+id+"' ORDER BY sno desc";
        List<ResponseComplaintDto> l1 = new ArrayList<ResponseComplaintDto>();
        Statement st = DBConnector.getStatement();
        try
        {
            ResultSet rs=null;
            rs=st.executeQuery(query);
            while(rs.next())
            {
                ResponseComplaintDto response = new ResponseComplaintDto();
                response.setResponseId(rs.getInt(1));
                
                response.setComplaintID(rs.getInt(2));
                
                response.setResponderId(rs.getString(3));
                response.setReply(rs.getString(4));
                response.setReplyDate(rs.getString(5));
                System.out.println("this");
                l1.add(response);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
}
