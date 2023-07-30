/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.NoticeDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nishc
 */
public class InsertNoticeData {
   public boolean noticeInsert(NoticeDto n1)
    {
     int noticeId=n1.getNoticeId();
     String description = n1.getDescription();
     String issuedDate= n1.getIssuedDate();
     String issuedBy = n1.getIssuedBy();
     String issuedTo = n1.getIssuedTo();
     Connection con = DBConnector.getConnection();
     try
     {
         PreparedStatement ps = con.prepareStatement("INSERT INTO notices values(?,?,?,?,?)");
         ps.setInt(1, noticeId);
         ps.setString(2, description);
         ps.setString(3, issuedDate);
         ps.setString(4,issuedBy);
         ps.setString(5,issuedTo);
         int i = ps.executeUpdate();
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
     
     
     
        return false ;
    }
}
