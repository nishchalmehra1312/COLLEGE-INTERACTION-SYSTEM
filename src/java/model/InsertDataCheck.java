package model;
import db.DBConnector;
import dto.ComplaintDto;
import dto.ManagerDto;
import dto.StudentDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertDataCheck {

    public boolean isInsertDataStudent(StudentDto student) 
    {
       String enrollment_number = student.getEnrollment_number();
       String student_name=student.getStudent_name();
       String dob = student.getDob();
       String email = student.getEmail();
       String password = student.getPassword();
       String address = student.getAddress();
       String course = student.getCourse();
       String branch = student.getBranch();
       String mobile=student.getMobile();
       String aadhar =student.getAadhar();
       String gender=student.getGender();
       String admission_year=student.getAdmission_year();
       String fname=student.getFather_name();
       String blood_group=student.getBlood_group();
       if(email!=null && password!=null)
       {
           Connection con=DBConnector.getConnection();
           try
           {
               PreparedStatement st =con.prepareStatement("INSERT INTO student ()values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
               st.setString(1,enrollment_number );
               st.setString(2,student_name );
               st.setString(3,fname );
               st.setString(4,dob );
               st.setString(5,email );
               st.setString(6,password );
               st.setString(7,address );
               st.setString(8,course );
               st.setString(9,branch );
               st.setString(10,mobile );
               st.setString(11,aadhar );
               st.setString(12,gender );
               st.setString(13,admission_year );
               st.setString(14,blood_group );
              
               int i = st.executeUpdate();
               if(i==1)
               {
                   return true ;
               }
               else 
                   return false ;
               
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
       }
       
        return false ; 
    }
    
    
    
    public boolean isUpdateData(StudentDto student) 
    {
       String enrollment_number = student.getEnrollment_number();
       String student_name=student.getStudent_name();
       String dob = student.getDob();
       String email = student.getEmail();
       //String password = student.getPassword();
       String address = student.getAddress();
       String course = student.getCourse();
       String branch = student.getBranch();
       String mobile=student.getMobile();
       String aadhar =student.getAadhar();
       String gender=student.getGender();
       String admission_year=student.getAdmission_year();
       String fname=student.getFather_name();
       String blood_group=student.getBlood_group();
       if(email!=null )
       {
           Connection con=DBConnector.getConnection();
           try
           {
               PreparedStatement st =con.prepareStatement("UPDATE  student set student_name=?,father_name=?, dob=? ,email=?, address=?,course=?,branch=?,mobile=?,aadhar=? ,gender=?,adminssion_year=?,blood_group=? WHERE enrollment_number='"+enrollment_number+"'  ");
               
               st.setString(1,student_name );
               st.setString(2,fname );
               st.setString(3,dob );
               st.setString(4,email );
             
               st.setString(5,address );
               st.setString(6,course );
               st.setString(7,branch );
               st.setString(8,mobile );
               st.setString(9,aadhar );
               st.setString(10,gender );
               st.setString(11,admission_year );
               st.setString(12,blood_group );
             
               int i = st.executeUpdate();
               System.out.println(i);
               if(i!=0)
               {
                   System.out.println("updated");
                   return true ;
               }
               else 
                   return false ;
               
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
       }
       
        return false ; 
    }
    
    public boolean isUpdateDataStudentIndividual(StudentDto student) 
    {
       String enrollment_number = student.getEnrollment_number();
       String student_name=student.getStudent_name();
       String dob = student.getDob();
       String email = student.getEmail();
       //String password = student.getPassword();
       String address = student.getAddress();
       
       String mobile=student.getMobile();
       
       String gender=student.getGender();
   
       if(enrollment_number!=null )
       {
           Connection con=DBConnector.getConnection();
           try
           {
               PreparedStatement st =con.prepareStatement("UPDATE  student SET student_name=? ,email=?,dob=?, address=?,mobile=?,gender=? WHERE enrollment_number='"+enrollment_number+"'  ");
               
               st.setString(1,student_name);
               st.setString(2,email );
               st.setString(3,dob );
               st.setString(4,address );
             
               st.setString(5,mobile );
               st.setString(6,gender );
              
             
               int i = st.executeUpdate();
               System.out.println(i);
               if(i!=0)
               {
                   System.out.println("updated");
                   return true ;
               }
               else 
                   return false ;
               
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
       }
       
        return false ; 
    }
    
    
     public boolean isInsertDataManager(ManagerDto manager) 
    {
        String manager_id = manager.getManager_id();
       String manager_name=manager.getName();
       String dob = manager.getDob();
       String email = manager.getEmail();
       String password = manager.getPassword();
       String mobile= manager.getMobile();
       String address = manager.getAddress();
       String qualification = manager.getQualification();
       String experience = manager.getExperience();
       String category = manager.getCategory();
       String branch = manager.getBranch();
       String subjects = manager.getSubjects();
       String aadhar = manager.getAadhar();
       String specialization = manager.getSpecialization();
       String gender=manager.getGender();
       String joining_year=manager.getJoining_year();
       if(email!=null && password!=null)
       {
           Connection con=DBConnector.getConnection();
           try
           {
               PreparedStatement st =con.prepareStatement("INSERT INTO manager values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
               st.setString(1,manager_id );
               st.setString(2,manager_name );
               st.setString(3,dob );
               st.setString(4,email );
               st.setString(5,password );
               st.setString(6,mobile );
               st.setString(7,address );
               st.setString(8,qualification );
               st.setString(9,experience );
               st.setString(10,category);
               st.setString(11,branch );
               st.setString(12,subjects );
               st.setString(13,aadhar );
               st.setString(14,specialization );
               st.setString(15,gender );
               st.setString(16,joining_year );
               
               int i = st.executeUpdate();
               if(i==1)
               {
                   return true ;
               }
               else 
                   return false ;
               
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
       }
       
        return false ; 
    }
    
      
     public boolean isUpdateDataManager(ManagerDto manager) 
    {
        String manager_id = manager.getManager_id();
       String manager_name=manager.getName();
       String dob = manager.getDob();
       String email = manager.getEmail();
       String mobile= manager.getMobile();
       String address = manager.getAddress();
       String qualification = manager.getQualification();
       String experience = manager.getExperience();
       String category = manager.getCategory();
       String branch = manager.getBranch();
       String subjects = manager.getSubjects();
       String aadhar = manager.getAadhar();
       String specialization = manager.getSpecialization();
       String gender=manager.getGender();
       String joining_year=manager.getJoining_year();
        
       if(email!=null )
       {
          
           Connection con=DBConnector.getConnection();
           try
           {
              
               PreparedStatement st =con.prepareStatement("UPDATE manager set  name=?,dob=?,email=?,mobile=?,address=?,qualification=?,experience=?,category=?,branch=?,subjects=?,aadhar=?,specialization=?,gender=?,joining_year=? WHERE manager_id='"+manager_id+"' ");
           
               
               st.setString(1,manager_name );
               st.setString(2,dob );
               st.setString(3,email );
           
               st.setString(4,mobile );
               st.setString(5,address );
               st.setString(6,qualification );
               st.setString(7,experience );
               st.setString(8,category);
               st.setString(9,branch );
               st.setString(10,subjects );
               st.setString(11,aadhar );
               st.setString(12,specialization );
               st.setString(13,gender );
               st.setString(14,joining_year );
               
               int i = st.executeUpdate();
               
              
               if(i!=0)
               {
                  
                   return true ;
               }
               else 
                   return false ;
               
           }
           catch(SQLException e)
           {
               System.out.println(e);
           }
       }
       
        return false ; 
    }
     
    
     
}
