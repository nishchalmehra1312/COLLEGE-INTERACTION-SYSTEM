/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.ManagerDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class ManagersDao {
    public List<ManagerDto> getAllManagerData(String category) throws SQLException
    {
        Statement st = DBConnector.getStatement();
        String query="SELECT * FROM manager where category='"+category+"' ";
         List<ManagerDto> l1=new ArrayList<ManagerDto>();
        try
        {
            
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
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
                
                
                l1.add(manager);
                
            }
            
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
}
