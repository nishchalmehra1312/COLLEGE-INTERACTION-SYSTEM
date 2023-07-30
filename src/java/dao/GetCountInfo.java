/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nishc
 */
public class GetCountInfo {
    
    public int getStudentCount()
    {
        int count = 0;
        String query1="SELECT COUNT(enrollment_number) FROM student";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
    public int getFacultyCount()
    {
        int count = 0;
        String query1="SELECT COUNT(manager_id) FROM manager WHERE category='faculty' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    };
    
    
      public int getHodCount()
    {
        int count = 0;
        String query1="SELECT COUNT(manager_id) FROM manager WHERE category='hod' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    };
        public int getAdminCount()
    {
        int count = 0;
        String query1="SELECT COUNT(manager_id) FROM manager WHERE category='admin' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    };
    
         
    public int getNoticeCountManager(String id)
    {
        int count = 0;
        String query1="SELECT COUNT(noticeId) FROM notices WHERE issuedBY='"+id+"' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
    
    public int getAssignmentCountManager(String id)
    {
        int count = 0;
        String query1="SELECT COUNT(assignment_Id) FROM assignments WHERE assignment_issuer='"+id+"' ";
         Statement st=DBConnector.getStatement(); 
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
    
    public int getComplaintCountManager(String id)
    {
        int count = 0;
        String query1="SELECT COUNT(complaintId) FROM complaint WHERE idOfFaculty='"+id+"' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
    
     public int getComplaintCountStudent(String id)
    {
        int count = 0;
        String query1="SELECT COUNT(complaintId) FROM complaint WHERE issuerId='"+id+"' ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
     public int getAssignmentCountStudent(String id)
    {
        int count = 0;
        int count2=0;
        String query1="SELECT COUNT(assignment_Id) FROM assignments WHERE assignedTo='"+id+"' ";
        String query2="SELECT COUNT(assignment_Id) FROM assignments WHERE assignedTo='1' ";
         Statement st=DBConnector.getStatement(); 
         Statement st2=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                
                 count=rs.getInt(1);
                
             }
              ResultSet rs2 =st.executeQuery(query2);
             if(rs2.next())
             {
                 count2=rs2.getInt(1);
                
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count+count2 ;
    }
     public int getNoticeCountStudent(String id)
    {
        int count = 0;
        String query1="SELECT COUNT(noticeId) FROM notices  ";
         Statement st=DBConnector.getStatement();
         try
         {
             ResultSet rs =st.executeQuery(query1);
             if(rs.next())
             {
                 count=Integer.parseInt(rs.getString(1));
             }
         }
         catch(SQLException e )
         {
             System.out.println(e);
         }
        return count ;
    }
    
}
