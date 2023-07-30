package model;

import db.DBConnector;
import dto.LoginDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.websocket.Session;

public class LoginAuthentication {
    
    public boolean isLogin(LoginDto user_data)
    {
        
        String email = user_data.getEmail();
        String password = user_data.getPassword();
        String category = user_data.getCategory();
        Statement st;
        
        String tablepassword="";
        st = DBConnector.getStatement();
        
        ResultSet rs =null ;
        if(category.equals("student"))
        {
            String query="SELECT password  FROM student  WHERE email='"+email+"'  ";
            try
            {
                
                rs=st.executeQuery(query);
               
                if(rs.next())
                {
                    tablepassword=rs.getString(1);
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
           
            if(password.equals(tablepassword))
            {
                return true;
            }
            
            
            
        }
        
     else   {
              String query="SELECT password  FROM manager WHERE email='"+email+"' AND category='"+category+"' ";
              
            try
            {
                rs=st.executeQuery(query);
               
                if(rs.next())
                {
                     System.out.println("manquexla");
                    tablepassword=rs.getString(1);
                    
                    
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
           
            if(password.equals(tablepassword))
            {
                
                return true;
            }
        }     
     return false;   
    }
    public String getId(String email,String category)
    {
        String query="";
        Statement st = DBConnector.getStatement();
        ResultSet rs=null;
        if(category.equals("student"))
        {
            query="SELECT enrollment_number FROM student where email='"+email+"' ";
        }
        else
        {
            query="SELECT manager_id FROM manager where email='"+email+"' ";
        }
        try
        {
            rs = st.executeQuery(query);
            if(rs.next())
            {
                return rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return "lol";   
    }
}
