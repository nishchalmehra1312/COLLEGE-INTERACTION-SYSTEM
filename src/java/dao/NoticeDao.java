/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.NoticeDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class NoticeDao {
    public List<NoticeDto> getNoticesData(String id)
    {
        List<NoticeDto> l1 = new ArrayList();
        Statement st = DBConnector.getStatement();
        String query="SELECT * FROM notices WHERE issuedBy='"+id+"' ";
        ResultSet rs =null;
        try
        {
            rs=st.executeQuery(query);
            while(rs.next())
            {
                NoticeDto n1= new NoticeDto();
                
                n1.setNoticeId(rs.getInt(1));
                n1.setDescription(rs.getString(2));
                n1.setIssuedDate(rs.getString(3));
                n1.setIssuedBy(rs.getString(4));
                n1.setIssuedTo(rs.getString(5));
                l1.add(n1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1 ;
    }
    
     public List<NoticeDto> getAllNoticesData()
    {
        List<NoticeDto> l1 = new ArrayList();
        Statement st = DBConnector.getStatement();
        String query="SELECT * FROM notices ";
        ResultSet rs =null;
        try
        {
            rs=st.executeQuery(query);
            while(rs.next())
            {
                NoticeDto n1= new NoticeDto();
                
                n1.setNoticeId(rs.getInt(1));
                n1.setDescription(rs.getString(2));
                n1.setIssuedDate(rs.getString(3));
                n1.setIssuedBy(rs.getString(4));
                n1.setIssuedTo(rs.getString(5));
                l1.add(n1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1 ;
    }
}
