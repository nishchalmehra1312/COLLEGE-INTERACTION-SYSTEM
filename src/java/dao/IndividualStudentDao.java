package dao;

import db.DBConnector;
import dto.StudentDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IndividualStudentDao {
    Statement st = DBConnector.getStatement();
    public StudentDto getIndividualStudentData(String enrollment)
    {
        String query="SELECT * FROM student WHERE enrollment_number='"+enrollment+"' ";
        try
        {
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                StudentDto student=new StudentDto();
                student.setEnrollment_number(rs.getString(1));
                student.setStudent_name(rs.getString(2));
                
                student.setDob(rs.getString(4));
                student.setEmail(rs.getString(5));
                student.setPassword(rs.getString(6));
                student.setAddress(rs.getString(7));
                student.setCourse(rs.getString(8));
                student.setBranch(rs.getString(9));
                student.setMobile(rs.getString(10));
                student.setAadhar(rs.getString(11));
                student.setGender(rs.getString(12));
                student.setAdmission_year(rs.getString(13));
                student.setBlood_group(rs.getString(14));
                
                return student;
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
    

