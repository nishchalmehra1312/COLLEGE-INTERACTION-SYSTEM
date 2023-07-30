package dao;

import db.DBConnector;
import dto.ManagerDto;
import dto.StudentDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IndividualManagerDao {
    Statement st = DBConnector.getStatement();
    public ManagerDto getIndividualManagerData(String manager_id,String category)
    {
        String query="";
    
              query="SELECT * FROM manager WHERE manager_id='"+manager_id+"' AND category='"+category+"' ";
        
        try
        {
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                ManagerDto manager=new ManagerDto();
                 manager.setManager_id(rs.getString(1));
                manager.setName(rs.getString(2));
                
                manager.setDob(rs.getString(3));
                manager.setEmail(rs.getString(4));
                manager.setPassword(rs.getString(5));
                manager.setMobile(rs.getString(6));
                manager.setAddress(rs.getString(7));
                manager.setQualification(rs.getString(8));
                manager.setExperience(rs.getString(9));
                manager.setCategory(rs.getString(10));
                manager.setBranch(rs.getString(11));
               
                manager.setSubjects(rs.getString(12));
                
                manager.setAadhar(rs.getString(13));
                manager.setSpecialization(rs.getString(14));
                manager.setGender(rs.getString(15));
                manager.setJoining_year(rs.getString(16));
                
                return manager;
            }
            else 
            {
                return null;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return null;
    }
}
    

